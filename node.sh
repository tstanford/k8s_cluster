#!/bin/bash

echo "This is Node script"
echo "====================="

master_ip_address=`host K8Master | awk '{print $4}'`
token=`cat /vagrant_data/tokens | tail -n 1 | awk '{print $1}'`
ca_cert_hash=`cat /vagrant_data/ca_cert_hash`

kubeadm join $master_ip_address:6443\
    --token=$token \
    --discovery-token-ca-cert-hash sha256:$ca_cert_hash


