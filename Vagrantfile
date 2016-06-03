# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|


####################################################
##
##  Master will be the indexer master as well as the
##  Deployer for the search head cluster
##
####################################################
   # cluster master
  config.vm.define "master" do |master|
   master.vm.box = "centos/7"
   master.vm.hostname = "master"
   master.vm.network :forwarded_port, guest: 8000, host: 8001
   master.vm.network "private_network", ip: "192.168.33.101"
   master.vm.provider :virtualbox do |vb|
    vb.gui = false
   end
    # provision with ansible
   master.vm.provision "ansible" do |ansible|
    ansible.playbook          = "playbook.yml"
    ansible.sudo              = true
    ansible.host_key_checking = false
    # ansible.extra_vars        = { installapps: false }
   end
  end
    
  ####################################################
  # indexer
  config.vm.define "index1" do |index1|
   index1.vm.box = "centos/7"
   index1.vm.hostname = "index1"
   index1.vm.network :forwarded_port, guest: 8000, host: 8002
   index1.vm.network "private_network", ip: "192.168.33.102"
   index1.vm.synced_folder "splunklogs/", "/splunklogs"
   index1.vm.provider :virtualbox do |vb|
     vb.gui = false
   end
     # provision with ansible
   index1.vm.provision "ansible" do |ansible|
     ansible.playbook          = "playbook.yml"
     ansible.sudo              = true
     ansible.host_key_checking = false
     # ansible.extra_vars        = { installapps: false }
   end
   end
  
   ####################################################
   # indexer
  config.vm.define "index2" do |index2|
   index2.vm.box = "centos/7"
   index2.vm.hostname = "index2"
   index2.vm.network :forwarded_port, guest: 8000, host: 8003
   index2.vm.network "private_network", ip: "192.168.33.103"
   index2.vm.provider :virtualbox do |vb|
    vb.gui = false
   end
  
   # provision with ansible
   index2.vm.provision "ansible" do |ansible|
     ansible.playbook          = "playbook.yml"
     ansible.sudo              = true
     ansible.host_key_checking = false
   # ansible.extra_vars        = { installapps: false }
    end
  end

  ####################################################
  # indexer
  config.vm.define "index3" do |index3|
   index3.vm.box = "centos/7"
   index3.vm.hostname = "index3"
   index3.vm.network :forwarded_port, guest: 8000, host: 8004
   index3.vm.network "private_network", ip: "192.168.33.104"
   index3.vm.provider :virtualbox do |vb|
     vb.gui = false
   end
  
   # provision with ansible
   index3.vm.provision "ansible" do |ansible|
     ansible.playbook          = "playbook.yml"
     ansible.sudo              = true
     ansible.host_key_checking = false
   # ansible.extra_vars        = { installapps: false }
   end
   end
 
   ####################################################
  # indexer
  config.vm.define "index4" do |index4|
   index4.vm.box = "centos/7"
   index4.vm.hostname = "index4"
   index4.vm.network :forwarded_port, guest: 8000, host: 8005
   index4.vm.network "private_network", ip: "192.168.33.105"
   index4.vm.provider :virtualbox do |vb|
     vb.gui = false
   end
  
   # provision with ansible
   index4.vm.provision "ansible" do |ansible|
     ansible.playbook          = "playbook.yml"
     ansible.sudo              = true
     ansible.host_key_checking = false
   # ansible.extra_vars        = { installapps: false }
   end
  end
 
   ####################################################
   ##
   ## Search head cluster needs 3 nodes for captain
   ## election process to work properly
   ##
   ####################################################
   # Search head
  config.vm.define "search1" do |search1|
   search1.vm.box = "centos/7"
   search1.vm.hostname = "search1"
   search1.vm.network :forwarded_port, guest: 8000, host: 8006
   search1.vm.network "private_network", ip: "192.168.33.106"
   search1.vm.provider :virtualbox do |vb|
   search1.vm.synced_folder "splunklogs/", "/splunklogs"
    vb.gui = false
   end

   # provision with ansible
   search1.vm.provision "ansible" do |ansible|
    ansible.playbook          = "playbook.yml"
    ansible.sudo              = true
    ansible.host_key_checking = false
   # ansible.extra_vars        = { installapps: false }
   end
  end

   ####################################################
   # Search head
  config.vm.define "search2" do |search2|
   search2.vm.box = "centos/7"
   search2.vm.hostname = "search2"
   search2.vm.network :forwarded_port, guest: 8000, host: 8007
   search2.vm.network "private_network", ip: "192.168.33.107"
   search2.vm.synced_folder "splunklogs/", "/splunklogs"
   search2.vm.provider :virtualbox do |vb|
    vb.gui = false
   end

   # provision with ansible
   search2.vm.provision "ansible" do |ansible|
    ansible.playbook          = "playbook.yml"
    ansible.sudo              = true
    ansible.host_key_checking = false
    # ansible.extra_vars        = { installapps: false }
   end
  end

  ####################################################
  # Search head
  config.vm.define "search3" do |search3|
   search3.vm.box = "centos/7"
   search3.vm.hostname = "search3"
   search3.vm.network :forwarded_port, guest: 8000, host: 8008
   search3.vm.network "private_network", ip: "192.168.33.108"
   search3.vm.synced_folder "splunklogs/", "/splunklogs"
   search3.vm.provider :virtualbox do |vb|
     vb.gui = false
   end

   # provision with ansible
   search3.vm.provision "ansible" do |ansible|
     ansible.playbook          = "playbook.yml"
     ansible.sudo              = true
     ansible.host_key_checking = false
   # ansible.extra_vars        = { installapps: false }
   end
  end
  
  ####################################################
  # Universal Forwarder client
  config.vm.define "uf1" do |uf1|
   uf1.vm.box = "centos/7"
   uf1.vm.hostname = "uf1"
   uf1.vm.network "private_network", ip: "192.168.33.109"
   uf1.vm.provider :virtualbox do |vb|
     vb.gui = false
   end

   # provision with ansible
   uf1.vm.provision "ansible" do |ansible|
     ansible.playbook          = "uf-playbook.yml"
     ansible.sudo              = true
     ansible.host_key_checking = false
   end
   uf1.vm.synced_folder "splunklogs/", "/splunklogs"
  end

end
