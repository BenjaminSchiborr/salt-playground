# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ferventcoder/win2008r2-x64-nocm"
  config.vm.communicator = "winrm"

  ## For masterless, mount your salt file root
  config.vm.synced_folder "salt/roots/", "C:/salt/roots/", create: true

  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
    #salt.version = "2017.7.1" # Does not currently work with 2017.7.1
    salt.minion_id = "VADDEFAU01MS001"
  end
end
