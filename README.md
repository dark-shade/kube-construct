# Purpose
These shell scripts automate the setup and teardown process of Kubernetes cluster on Hypriot OS 
(debian based). The need for this was felt as every time master node rebooted or turned off then 
the kubedeam initialization needs to be done again, hence to automate the process these scripts
were developed.

# Description
Script Name | Purpose 
--- | --- 
tearDown | tears down the kubernetes cluster 
setupMaster | set's up up the master node(can also be used for slaves)
setupWifi | configures wifi

# How to use:
1. Clone the repo.
2. Use `setupMaster.sh` for master and slave setup.
3. If the master restarts and cluster needs to reset then use `tearDown.sh` (run `tearDown` on all nodes).
4. For configuring wifi on any node utilize `setupWifi.sh`.

### Other resources and references
1. [Setup kubernetes raspberry pi cluster](https://blog.hypriot.com/post/setup-kubernetes-raspberry-pi-cluster/)
2. [How to run shell scripts](https://askubuntu.com/questions/38661/how-do-i-run-sh-files)
3. [Issues in kubernetes](https://github.com/kubernetes/kubernetes/issues)

### Developer comments
Kube-constuct is being merged with [Utility Scipts Project](https://github.com/dark-shade/UtilityScripts)
