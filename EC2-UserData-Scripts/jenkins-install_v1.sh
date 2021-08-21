#! /bin/bash
sudo yum update -y
sudo yum install -y java-1.8*
echo 'JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.302.b08-0.amzn2.0.1.x86_64' >> ~/.bash_profile
echo 'PATH=$PATH:$JAVA_HOME' >> ~/.bash_profile
source ~/.bash_profile
sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install -y jenkins
sudo service jenkins start
sudo chkconfig jenkins on
