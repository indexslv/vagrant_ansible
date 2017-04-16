# Starter project on Vagrant & Ansible

## About project
This is demo / test project is for Vagrant and Ansible tools. You will be able to setup:
1 x LoadBalancer HAProxy
2 x Nginx + Tomcat + demo tomcat app (with reverse proxy)
(TODO) 2 x PostgresSQL server master and slave with async database


## Hardware Requirement:
###### PC or Laptop with virtualization

## OS Requirement:
###### [ Centos 7 minimal ] (https://www.centos.org/)

## Software Requirement:
###### [ VirtualBox by Oracle ] (https://www.virtualbox.org/)
###### [ Vagrant ] (https://www.vagrantup.com/)
###### [ Ansible ] (https://www.centos.org/)

* I assume you have already installed Required OS and Software then skip to step X if not then install Cenots 7 minimal and start with step 1.

**1. Project setup process:**
1.1. When installing centos 7 create user vagrant with administrator privilages 
1.2. After copy GitHub projec to your server and put it created directory, for exmaple "myproject" 
1.3. Then set chmod to bash script "server_setup.sh" and run the script:  
```
chmod 0700 server_setup.sh
./server_setup.sh
```
* This script will install all nessasary software to run the Vagrant & Ansible project

**2. Running the project:**
2.1. Before you start project please edit:
2.1.1. **hosts** file in direcotry "provisioning/src/hosts" and edit IP\`s you will use in you project. Edit only first part of IP, example "10.10.20.111" -> "10.20.30.111"
2.1.2. Copy edited content to you local **hosts** file /etc/hosts
2.2.2. **Vagrantfile** file in main project direcotry change IP\`s according to hosts file.
2.3. Run command: 
```
vagrant up
```
and you will setup all server automaticly.

2.4. Stop all machines:
```
vagrant halt
```

2.4. Destory one or several machines:
```
vagrant destroy web1
vagrant destroy web1 web2 db1 db2
```
