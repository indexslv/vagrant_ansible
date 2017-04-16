#!/bin/bash
# Clear console/terminal
clear

# First update Centos 7 if not done
echo "--> 1. Updating server software"
sudo yum update

# Install EPEL-RELEASE
echo "--> 2. Installing EPEL-RELEASE"
sudo yum install epel-release -y

echo "--> 3. Installing WGET"
yum install wget nano -y

echo "--> 4. Installing VirtualBox"

cd /etc/yum.repos.d/

sudo wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo

sudo yum groupinstall "Development Tools" -y

sudo yum install kernel-devel VirtualBox-5.1 -y

usermod -a -G vboxusers root

echo "--> 5. Download vagrant"
wget https://releases.hashicorp.com/vagrant/1.9.3/vagrant_1.9.3_x86_64.rpm?_ga=1.85854363.326290385.1491661401

echo "--> 6. Rename download file for install from RPM"
mv vagrant_1.9.3_x86_64.rpm?_ga=* vagrant_1.9.3_x86_64.rpm

echo "--> 7. Install Vagrant"
sudo yum install vagrant_1.9.3_x86_64.rpm -y

rm -f vagrant_1.9.3_x86_64.rpm

# Update EPEL-RELEASE
echo "--> 8. Updating EPEL-RELEASE"
sudo yum update

echo "--> 9. Install Ansible"
sudo yum install ansible

#echo "--> 10. Generate SSH private keys"
#sudo ssh-keygen


