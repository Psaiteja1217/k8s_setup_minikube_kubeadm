#!/bin/bash

# updating the repository and installing the docker

sudo apt update -y
sudo apt install docker.io -y

# starting the enabling the docker

sudo systemctl start docker
sudo systemctl enable docker

# downloading the packages to run k8s

curl -fsSL "https://packages.cloud.google.com/apt/doc/apt-key.gpg" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/kubernetes-archive-keyring.gpg
echo 'deb https://packages.cloud.google.com/apt kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list

# installing the kubeadm 

apt update -y
apt install kubeadm=1.20.0-00 kubectl=1.20.0-00 kubelet=1.20.0-00 -y

# we have to intialize the kubeadm 

sudo su
kubeadm init

# we have to Set up local kubeconfig (both for root user and normal user)
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# we have to apply weave network
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml

# we have to generate the token for worker nodes to join

kubeadm token create --print-join-command

echo "Please copy the token to establish the connection between Master and worker node & Expose port 6443 in the Security group"
echo "Master node set up is completed..!!! Please follow the kubeadm_workernode_setup.sh to set up the worker node ."

