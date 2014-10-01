# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "loopback"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.hostname = "loopback.box"

  #config.vm.forward_port("node-inspector", 8080, 8080)
  config.vm.network :forwarded_port, host:8080, guest:8080

  #config.vm.forward_port("node-debugger", 5858, 5858)
  config.vm.network :forwarded_port, host:5858, guest:5858

  config.vm.synced_folder "salt/roots/", "/srv/"

  config.vm.provision :salt do |salt|
    salt.minion_config = "salt/minion"
    ## Installs from top.sls in "salt/roots/salt"
    salt.run_highstate = true
    ## Echos all the things
    salt.verbose = true
  end

  config.vm.provider :virtualbox do |vb, override|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

end
