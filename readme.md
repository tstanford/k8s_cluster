# Automated Kubernetes Lab Cluster Build

I've been wanting to experiment more with my own kubernetes cluster so that I can understand the installation and configuration of it outside of public cloud environment.

This is my attempt at providing a base installation.

## Prerequisites

- vagrant
- virtualbox


## Command: `vagrant up` 

To build and provision the kubernetes cluster consisting of 1 control plane and 3 nodes. The VMs run on ubuntu server 22.04.

There are 3 provisioning scripts, `provision.sh` is run on all of the VMs. `master.sh` is then run on the control plane. `node.sh` is then run on the 3 nodes.

## Command `vagrant halt`

Power off the kubernetes control plane and 3 nodes

## Command `vagrant destroy`

Power off the kubernetes control plane and 3 nodes and then delete the VMs from virtual box.


## Change the Number of Nodes in the Cluster
It is possible to change the number of nodes in the cluster. To do this, change the variable `numberOfNodes` in the VagrantFile.

## TODO:

x setup local container repository
x build a container image using docker and have it published to the local repository
- setup a bare metal load balancer and allow it to use DHCP to get an IP address from physical network
- can master and nodes be moved to a private, host only network?
- deploy a container image to kubernetes cluster and have it bring up a new service with a new ip addresses



# virtual box config

## Disable that annoying notification center

`VBoxManage setextradata global GUI/SuppressMessages confirmGoingFullscreen,remindAboutMouseIntegration,remindAboutAutoCapture`

