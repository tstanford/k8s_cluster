# -*- mode: ruby -*-
# vi: set ft=ruby :

numberOfNodes = 3

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/jammy64"
  config.vm.synced_folder "data", "/vagrant_data"
  config.vm.network "public_network", bridge: "enp4s0"

  #buildagent vm
  config.vm.define "buildagent", primary: true, autostart: false do |buildagent|      
    buildagent.vm.hostname = "buildagent"

    buildagent.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.name = "buildagent"
      vb.memory = "2048"
      vb.cpus = 2
      vb.check_guest_additions = true
      
    end

    buildagent.vm.provision "shell", path: "buildagent.sh"
  end

  #master vm
  config.vm.define "k8master" do |k8master|      
    k8master.vm.hostname = "K8Master"

    k8master.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.name = "K8Master"
      vb.memory = "2048"
      vb.cpus = 2
      vb.check_guest_additions = true
    end

    k8master.vm.provision "shell", path: "provision.sh"
    k8master.vm.provision "shell", path: "master.sh"
  end

  #node vms
  (1..numberOfNodes).each do |nodeNumber|    
    config.vm.define "k8node"+nodeNumber.to_s do |k8node|
      k8node.vm.hostname = "K8Node"+nodeNumber.to_s

      k8node.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.name = "K8Node"+nodeNumber.to_s
        vb.memory = "1024"
        vb.cpus = 2
        vb.check_guest_additions = true
      end

      k8node.vm.provision "shell", path: "provision.sh"
      k8node.vm.provision "shell", path: "node.sh"
    end
  end

end



