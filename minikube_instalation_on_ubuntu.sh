#!/bin/bash

# updating the repository

sudo apt update

# Install Required Packages

sudo apt install -y curl wget apt-transport-https

# installing the docker

sudo apt install -y docker.io

# starting the enabling the docker

sudo systemctl start docker
sudo systemctl enable docker

# installing the Minikube

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

# We have to mv this bin to local bin for minikube commands
chmod +x minikube
sudo mv minikube /usr/local/bin/

# installing the kubectl

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# We have to mv this bin to local bin for kubectl commands

chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# we have to set driver for minikube, "docker"

minikube start --driver=docker

echo "This command will start a single-node Kubernetes cluster inside a Docker container."

# we can use kubectl commands directly to cluster ex:

kubectl get nodes

# minikube stop this is for stoping the minicube

echo "That's it! You've successfully installed Minikube on Ubuntu, and you can now start deploying Kubernetes applications for development and testing."
