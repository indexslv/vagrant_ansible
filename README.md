# Starter project on Vagrant & Ansible

## About project
This is demo/test project based on Vagrant and Ansible tools. You will be able to setup:
#### Loadbalancer and two web servers are using SSL Certs (all included in project)
#### 1 x LoadBalancer HAProxy
#### 2 x Nginx + Tomcat + demo tomcat app (with reverse proxy)
#### (TODO) 2 x PostgresSQL server master and slave with async database

**!!! Do NOT use this example project in Production ENV. as it has not been tested properly and has no firewall setting, except SELinux enalbled !!!**

#### All above mentioned will use Centos 7 minimal "centos/7 CentOS Linux 7 x86_64 Vagrant Box" from [ Vagrant boxes Atlas ]  (https://atlas.hashicorp.com/boxes/search)

## Before :
###### PC or Laptop with virtualization

## Hardware Requirement:
###### PC or Laptop with virtualization

## OS Requirement:
###### [ Centos 7 minimal ] (https://www.centos.org/)

## Software Requirement:
###### [ VirtualBox by Oracle ] (https://www.virtualbox.org/)
###### [ Vagrant ] (https://www.vagrantup.com/)
###### [ Ansible ] (https://www.centos.org/)

* I assume you have already installed Required OS and Software then skip to step 2. if not then install Cenots 7 minimal and start with step 1. <br />

**1. Project setup process:**<br />
1.1. When installing centos 7 create user vagrant with administrator privileges.<br />
1.2. After copy GitHub project to your server and put it in your working directory, for exmaple "myproject" <br />
1.3. Then set chmod to bash script "server_setup.sh" and run the script:
```
chmod 0700 server_setup.sh
./server_setup.sh
```
* This script will install all nessasary software to run the Vagrant & Ansible project <br />

**2. Running the project:**<br />
2.1. Before you start project please edit:<br />
2.1.1. IP used in this project:<br />
Loadbalancer server Public network IP\`s: 10.10.20.111<br />
Loadbalancer server Private network IP\`s: 192.168.56.11<br /><br />
WEB servers Public network IP\`s: 10.10.20.121 - 122<br />
WEB servers Private network IP\`s: 192.168.56.21 - 22<br /><br />
Database servers Public network IP\`s: 10.10.20.131 - 122<br />
Database servers Private network IP\`s: 192.168.56.31 - 32<br /><br />

2.1.2. **hosts** file in direcotry "provisioning/src/hosts" and edit IP\`s you will use in you project. Edit only first part of IP, example "10.10.20.111" -> "10.20.30.111"<br />
2.1.3. Copy edited content to you local **hosts** file /etc/hosts<br />
2.2. **Vagrantfile** file in main project direcotry change IP\`s according to hosts file.<br />
2.3. Run command: 
```
vagrant up
```
and you will setup all server automaticly.<br />
2.5. Access machines by domain name:<br />
HAProxy: node.bz/stats<br />
Web page: node.bz | This domain will be redirected to secure SSL connection -> https://node.bz<br />

2.6. Access machines using via SSH:<br />
If you are not in your project working directory, please, go to it, and see first machines you have setup and make shure they are running before try to acccess them:
```
vagrant status
```
To access any of VM machines, type following command, for example machine **"loadbalancer"**:<br />
```
vagrant ssh loadbalancer
```
Default username for all VM machines is **vagrant** and password also is **vagrant**

2.7. Stop all VM machines:<br />
```
vagrant halt
```
2.8. Stop one or several VM machines:<br />
```
vagrant halt web1
```

2.8. Destory one or several VM machines:<br />
```
vagrant destroy web1
vagrant destroy web1 web2 db1 db2
```
