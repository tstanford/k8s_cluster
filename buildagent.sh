#!/bin/bash

echo "This is buildagent script"
echo "========================="

apt update -y
apt upgrade -y
apt install docker.io git openjdk-21-jdk curl -y

mkdir -p ~/build
cd ~/build

git clone https://github.com/tstanford/sample-service.git
cd sample-service
./gradle build

