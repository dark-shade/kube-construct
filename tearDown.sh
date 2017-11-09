#!/bin/bash
# Script to tear down the cluster

# colors
orange='\033[0;33m'
red='\033[0;31m'
nc='\033[0m' # No Color
green='\033[0;32m'
cyan='\033[0;36m'

# formatting
bold=$(tput bold)
normal=$(tput srg0)

echo -e "${green}${bold}Tearing down the cluster${nc}${normal}"

if [ $USER != "root" ]
then 
	sudo su -
fi

kubeadm reset
etcdctl rm --recursive registry
rm -rf /var/lib/cni
rm -rf /run/flannel
rm -rf /etc/cn
ifconfig cni0 down
brctl delbr cni0

echo -e "${green}${bold}Cluster successfully cleared${nc}${normal}"
echo -e "${cyan}${bold}Ignore any errors above${nc}${normal}"

su - pirate
