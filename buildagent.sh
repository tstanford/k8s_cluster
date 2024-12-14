#!/bin/bash

echo "This is buildagent script"
echo "========================="

#Step 4: Install Containerd Runtime (all nodes)
sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates

#Enable the Docker repository:
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/docker.gpg
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt update -y
apt upgrade -y
apt install docker.io git openjdk-21-jdk curl -y

# run a local docker registry
docker run -d -p 5000:5000 registry:2.7

#install kubectl
cd /usr/bin/
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod 755 kubectl

mkdir -p /opt/software
cd /opt/software

git clone https://github.com/tstanford/sample-service.git
cd sample-service
./gradlew build
docker build -t localhost:5000/sample-service .
docker push localhost:5000/sample-service
