# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure(2) do |config|

###################################################
# How many WEB servers to install?
################################################### 
	WEBSERVERS = 2
###################################################
# How many DB servers to install?
################################################### 
	DBSERVERS = 2

###################################################
# LoadBalancer
################################################### 		
	config.vm.define :loadbalancer do |lb_config|
		lb_config.vm.box = "centos/7"
		lb_config.vm.hostname = "loadbalancer"
		lb_config.vm.synced_folder "vmextHDD", "/vagrant", disabled: false
		lb_config.vm.network "private_network", ip: "192.168.56.11"
		lb_config.vm.network "public_network", ip: "10.10.20.111"
		
		lb_config.vm.provider :virtualbox  do |vb|
			vb.name = "server_mgm"
			vb.memory = 1024
			vb.cpus = 1
		end
		lb_config.ssh.forward_agent    = true
		lb_config.ssh.insert_key       = false
		lb_config.ssh.private_key_path =  ["~/.vagrant.d/insecure_private_key","~/.ssh/id_rsa"]
		lb_config.vm.provision :shell, privileged: false do |s|
		  ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
		  s.inline = <<-SHELL
			 echo #{ssh_pub_key} >> /home/$USER/.ssh/authorized_keys
			 #sudo bash -c "echo #{ssh_pub_key} >> /root/.ssh/authorized_keys"
			 sudo bash -c "echo #{ssh_pub_key} >> /home/$USER/.ssh/authorized_keys"
		  SHELL
		end
		lb_config.vm.provision :ansible do |ansible|
			ansible.playbook = "provisioning/playbook_loadbalancer.yml"
		end
	end
	
###################################################
# WEB servers NGINX
###################################################
	(1..WEBSERVERS).each do |i|
		config.vm.define "web#{i}" do |web_config|
			web_config.vm.box = "centos/7"
			web_config.vm.hostname = "web#{i}"
			web_config.vm.synced_folder "vmextHDD", "/vagrant", disabled: false
			web_config.vm.network :private_network, ip: "192.168.56.2#{i}"
			web_config.vm.network "public_network", ip: "10.10.20.12#{i}"
			web_config.vm.provider "virtualbox" do |vb|
				vb.name = "nginx_#{i}"
				vb.memory = "1024"
			end
			web_config.ssh.forward_agent    = true
			web_config.ssh.insert_key       = false
			web_config.ssh.private_key_path =  ["~/.vagrant.d/insecure_private_key","~/.ssh/id_rsa"]
			web_config.vm.provision :shell, privileged: false do |s|
			  ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
			  s.inline = <<-SHELL
				 echo #{ssh_pub_key} >> /home/$USER/.ssh/authorized_keys
				 sudo bash -c "echo #{ssh_pub_key} >> /home/$USER/.ssh/authorized_keys"
			  SHELL
			end
			web_config.vm.provision :ansible do |ansible|
				ansible.playbook = "provisioning/playbook_web.yml"
			end
		end
	end
	
###################################################
# DB servers PostgresSQL
###################################################
#	(1..DBSERVERS).each do |i|
#		config.vm.define "db#{i}" do |db_config|
#			db_config.vm.box = "centos/7"
#			db_config.vm.hostname = "db#{i}"
#			db_config.vm.synced_folder "vmextHDD", "/vagrant", disabled: false
#			db_config.vm.network :private_network, ip: "192.168.56.3#{i}"
#			db_config.vm.network "public_network", ip: "10.10.20.13#{i}"
#			db_config.vm.network "forwarded_port", guest: 80, host: "808#{i}"
#			db_config.vm.provider "virtualbox" do |vb|
#				vb.memory = "1024"
#			end
#			db_config.ssh.forward_agent    = true
#			db_config.ssh.insert_key       = false
#			db_config.ssh.private_key_path =  ["~/.vagrant.d/insecure_private_key","~/.ssh/id_rsa"]
#			db_config.vm.provision :shell, privileged: false do |s|
#			  ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
#			  s.inline = <<-SHELL
#				 echo #{ssh_pub_key} >> /home/$USER/.ssh/authorized_keys
#				 sudo bash -c "echo #{ssh_pub_key} >> /home/$USER/.ssh/authorized_keys"
#			  SHELL
#			end
#			db_config.vm.provision :ansible do |ansible|
#				ansible.playbook = "provisioning/playbook_postgressql.yml"
#			end
#		end
#	end

end
