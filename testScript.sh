status=$(dpkg-query -W -f='${Status} ${Version}\n' kubeadm)
if [[ $status = "install ok"* ]]; then
  echo "installed"
fi
