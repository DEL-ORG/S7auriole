#!/bin/bash

#packer recommand to sleep 30 seconds before run this script
sleep 30

echo "installing apt-utils************************************************************************************************************************************************************"
sudo apt-get install apt-utils -y
sudo apt-get update -y
sudo apt install snapd -y
echo "installing tree & curl************************************************************************************************************************************************************"
sudo apt-get install tree -y
sudo apt-get install curl -y
echo "installing docker & docker-compose************************************************************************************************************************************************************"
sudo apt-get update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker
sudo usermod -aG docker ${ubuntu}
sudo apt-get update -y
sudo apt-get install docker-compose-plugin
docker compose version
echo "installing mysql************************************************************************************************************************************************************"
sudo apt install mysql-server
sudo service mysql status
sudo ss -tap | grep mysql
sudo apt install mysql-client
mysql --version
echo "installing postgressql************************************************************************************************************************************************************"
sudo apt install postgresql
echo "installing jre & jdk************************************************************************************************************************************************************"
sudo apt install default-jre
sudo apt install default-jdk
javac -version
sudo apt update
echo "installing kubectl************************************************************************************************************************************************************"
sudo snap install kubectl --classic
kubectl version --output=yaml

#deb [trusted=yes] http://ftp.de.debian.org/debian buster main
#sudo apt-get update
#sudo apt install kubectx -y
echo "installing kubectx & helm & awscli************************************************************************************************************************************************************"
sudo snap install kubectx --classic
sudo snap install helm --classic
sudo apt install awscli --classic -y
helm --version
awscli --version
echo "installing git************************************************************************************************************************************************************"
sudo apt install git -y
git --version
echo "installing pip3************************************************************************************************************************************************************"
sudo apt-get -y install python3-pip
pip3 --version
echo "installing python3************************************************************************************************************************************************************"
apt install python3.8 -y
python3 --version
echo "installing wget & vim ************************************************************************************************************************************************************"
sudo apt-get install wget -y
sudo apt-get install vim -y
echo "installing nodejs & npm ************************************************************************************************************************************************************"
sudo apt-get install nodejs -y
sudo apt-get install npm -y
node -v
echo "installing ansible ************************************************************************************************************************************************************"
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install ansible -y
ansible --version
echo "installing terraform ************************************************************************************************************************************************************"
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update -y
sudo apt-get install terraform -y
terraform --version
echo "installing maven************************************************************************************************************************************************************"
wget https://mirrors.estointernet.in/apache/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
tar -xvf apache-maven-3.9.6-bin.tar.gz
mv apache-maven-3.9.6 /opt/
M2_HOME='/opt/apache-maven-3.9.6'
PATH="$M2_HOME/bin:$PATH"
export PATH
mvn -version
echo "installing htop ************************************************************************************************************************************************************"
sudo apt-get install htop
htop -v
echo "installing watch ************************************************************************************************************************************************************"
sudo apt-get install -y watch
echo "installing build-essential ************************************************************************************************************************************************************"
deb http://de.archive.ubuntu.com/ubuntu/ saucy-updates main restricted
deb-src http://de.archive.ubuntu.com/ubuntu/ saucy-updates main multiverse restricted universe
sudo apt-get update && sudo apt-get install build-essential
echo "installing openssh ************************************************************************************************************************************************************"
sudo apt install openssh-client
sudo apt install openssh-server
