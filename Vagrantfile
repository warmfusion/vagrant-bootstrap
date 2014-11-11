# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"

  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
     vb.gui = false
     vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  
  config.vm.provision "puppet" do |puppet|
    puppet.hiera_config_path = "puppet/hiera.yaml"
    puppet.manifests_path    = "puppet/manifests"
    puppet.module_path       = "puppet/modules"
    puppet.manifest_file     = "default.pp"
    # puppet.options           = "--debug"
  end


  # So you want to have a bunch of vm's? no worries...
  (1..3).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.hostname = "node#{i}.tobyjackson.net"
      node.vm.network "private_network", ip: "192.168.33.1#{i}"
    end
  end


end
