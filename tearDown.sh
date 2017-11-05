#!/bin/bash
# Script to tear down the cluster
echo "Tearing down the cluster"

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

echo "Cluster successfully cleared"
echo "Ignore any errors above"
