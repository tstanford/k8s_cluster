#!/bin/bash

echo "This is master script"
echo "====================="

#Step 7: Initialize Kubernetes Cluster with Kubeadm (master node)
ip_address=`hostname -I | awk '{print $2}'`
kubeadm init --apiserver-advertise-address=$ip_address --pod-network-cidr=192.168.0.0/16 --ignore-preflight-errors=all 

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#save ca cert hash for usage in nodes
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt \
    | openssl rsa -pubin -outform der 2>/dev/null \
    | openssl dgst -sha256 -hex \
    | sed 's/^.* //' \
    > /vagrant_data/ca_cert_hash

#save tokens hash for usage in nodes
kubeadm token list > /vagrant_data/tokens

export KUBECONFIG=/etc/kubernetes/admin.conf

kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
kubectl get nodes