#! /bin/bash
# Updating the system
sudo yum update -y
# Installing Java
sudo yum install -y java-1.8*
# Persisting Environment Variables for a User
echo 'JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.302.b08-0.amzn2.0.1.x86_64' >> ~/.bash_profile
echo 'PATH=$PATH:$JAVA_HOME' >> ~/.bash_profile
source ~/.bash_profile
# Installation and Jenkins configuration
sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install -y jenkins
sudo service jenkins start
sudo chkconfig jenkins on
# Git installation
sudo yum install -y git
git config --global user.email "rdobmk@gmail.com"
git config --global user.name "Richardbmk"
# Maven installation and configuration
sudo mkdir /opt/maven
cd /opt/maven
sudo wget https://ftp.cixug.es/apache/maven/maven-3/3.8.2/binaries/apache-maven-3.8.2-bin.tar.gz
sudo tar -xvzf apache-maven-3.8.2-bin.tar.gz
echo 'M2_HOME=/opt/maven/apache-maven-3.8.2' >> ~/.bash_profile
echo 'M2=$M2_HOME/bin' >> ~/.bash_profile
echo 'PATH=$PATH:$M2_HOME:$M2' >> ~/.bash_profile



