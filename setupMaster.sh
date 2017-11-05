#!/bin/bash
# Script to setup Kubernetes Master

red='\033[0;31m'
nc='\033[0m' # No Color
green='\033[0;32m'
cyan='\033[0;36m'

echo "${cyan}----- Initializing Master -----"

if [ $USER != "root" ]
then
	sudo su -
fi

status=$(dpkg-query -W -f='${Status} ${Version}\n' kubeadm)
if [[ $status != "install ok"* ]]
then
	echo "${red}Kubernetes not installed."
	echo "$(green}Installing Kubernetes....."

	echo "Trusting the kubernetes APT key and adding the official APT Kubernetes repository"
	curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
	echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list

	#instaling kubeadm
	kubInstallStatus=$(apt-get update && apt-get install -y kubeadm)

	echo "${green}Kuberenetes successfully installed"
	echo "${cyan}Please perform same actions on other nodes"
fi



wifiName=ifconfig wlan0|grep -Po 't addr:\K[\d.]+'

echo "--- Initializing kubeadm ---"
kubeadm init --pod-network-cidr 10.244.0.0/16 --apiserver-advertise-address=$wifiName

su - pirate

echo "-- Setting up cluster --"
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf

echo "Setup Complete"
echo "Join the nodes using the token generated above"
