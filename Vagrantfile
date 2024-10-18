# -*- mode: ruby -*-
# vi: set ft=ruby :

numberOfNodes = 3

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/jammy64"
  config.vm.network "public_network"
  config.vm.synced_folder "data", "/vagrant_data"
  config.vm.provision "shell", path: "provision.sh"

  #master vm
  config.vm.define "k8master", primary: true do |k8master|      
    k8master.vm.hostname = "K8Master"

    k8master.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.name = "K8Master"
      vb.memory = "2048"
      vb.cpus = 2
      vb.check_guest_additions = true
    end

    k8master.vm.provision "shell", path: "master.sh"
  end

  #node vms
  (1..numberOfNodes).each do |nodeNumber|    
    config.vm.define "k8node"+nodeNumber.to_s, primary: true do |k8node|
      k8node.vm.hostname = "K8Node"+nodeNumber.to_s

      k8node.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.name = "K8Node"+nodeNumber.to_s
        vb.memory = "1024"
        vb.cpus = 2
        vb.check_guest_additions = true
      end

      k8node.vm.provision "shell", path: "node.sh"
    end
  end

end



