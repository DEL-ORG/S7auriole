#!/bin/bash

#packer recommand to sleep 30 seconds before run this script
sleep 30

sudo apt-get install apt-utils -y
sudo apt-get update -y
sudo apt install snapd -y

sudo apt-get install tree -y

sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl status docker

sudo snap install kubectl --classic
kubectl version --output=yaml

#deb [trusted=yes] http://ftp.de.debian.org/debian buster main
#sudo apt-get update
#sudo apt install kubectx -y

sudo snap install kubectx --classic
sudo snap install helm --classic
sudo apt install awscli --classic -y

sudo apt install git -y
git --version

apt install python3.8 -y
python3 --version

sudo apt-get install python3-pip

sudo apt-get install wget -y
sudo apt-get install curl -y
sudo apt-get install vim -y

sudo apt-get install nodejs -y
sudo apt-get install npm -y

sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install ansible -y

wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update -y
sudo apt-get install terraform -y


