# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  net_ip = "192.168.50"
  lin_os = "bento/ubuntu-16.10"
  win_os = "ferventcoder/win2008r2-x64-nocm"

  # Salt Master
  config.vm.define "master" do |master|
      master.vm.provider "virtualbox" do |vb|
          vb.memory = "2048"
          vb.cpus = 1
          vb.name = "master"
      end
    master.vm.box = "#{lin_os}"
    master.vm.hostname = 'saltmaster.local'
    master.vm.network "private_network", ip: "#{net_ip}.10"
    #master.vm.synced_folder "saltstack/pillar/", "/srv/pillar"
    ## For masterless, mount your salt file root
    master.vm.synced_folder "salt/roots/", "/srv/salt/", create: true
    
    master.vm.provision :salt do |salt|
      salt.install_master = true
      salt.no_minion = true
      salt.install_type = "stable"
    end
  end

  # WithMaster Windows Minion
  config.vm.define "win_ml" do |win_ml|
    win_ml.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
      vb.name = "win_ml"
  end
    win_ml.vm.box = "#{win_os}"
    win_ml.vm.communicator = "winrm"
    win_ml.vm.hostname = "VADDEFAU01MS001"
    win_ml.vm.network "private_network", ip: "#{net_ip}.11"
    win_ml.vm.provision :salt do |salt|
      salt.minion_config = "salt/win_minion"
      salt.run_highstate = true
      #salt.version = "2017.7.1" # Does not currently work with 2017.7.1
      salt.minion_id = "VADDEFAU01MS001"
    end
  end

  # WithMaster Linux Minion
  config.vm.define "lin_ml" do |lin_ml|
    lin_ml.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
      vb.name = "lin_ml"
    end
    lin_ml.vm.box = "#{lin_os}"
    lin_ml.vm.hostname = "VADDEFAU01AX001"
    lin_ml.vm.network "private_network", ip: "#{net_ip}.12"
    lin_ml.vm.provision :salt do |salt|
      salt.minion_config = "salt/lin_minion"
      salt.run_highstate = true
      #salt.version = "2017.7.1" # Does not currently work with 2017.7.1
      salt.minion_id = "VADDEFAU01AX001"
    end
  end
end