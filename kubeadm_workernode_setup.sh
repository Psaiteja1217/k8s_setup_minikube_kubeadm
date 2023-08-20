#!/bin/bash

# updating the repo & installing the docker & installing the kubeadm

sudo su
apt update -y
apt install docker.io -y

systemctl start docker
systemctl enable docker

curl -fsSL "https://packages.cloud.google.com/apt/doc/apt-key.gpg" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/kubernetes-archive-keyring.gpg
echo 'deb https://packages.cloud.google.com/apt kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list

apt update -y
apt install kubeadm=1.20.0-00 kubectl=1.20.0-00 kubelet=1.20.0-00 -y

# This command will help us to work as workernode

sudo su
kubeadm reset pre-flight checks

echo "Worker node is ready..!! Paste the join command you got from the master node and append --v=5 at the end."
