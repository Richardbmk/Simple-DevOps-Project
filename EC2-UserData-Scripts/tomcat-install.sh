#! /bin/bash
sudo yum update -y
# Installing Java
sudo yum install -y java-1.8*
# Persisting Environment Variables for a User
echo 'JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.302.b08-0.amzn2.0.1.x86_64' >> ~/.bash_profile
echo 'PATH=$PATH:$JAVA_HOME' >> ~/.bash_profile
source ~/.bash_profile
# Tomcat installation
cd /opt
sudo wget https://ftp.cixug.es/apache/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz
sudo tar -xvzf apache-tomcat-8.5.69.tar.gz
sudo mv apache-tomcat-8.5.69 tomcat
sudo su
cd tomcat/bin
sudo chmod +x /opt/tomcat/bin/startup.sh 
sudo chmod +x /opt/tomcat/bin/shutdown.sh
sudo ./startup.sh
cd ..
echo '<role rolename="manager-gui"/>' >> tomcat/conf/tomcat-users.xml
echo '<role rolename="manager-script"/>' >> tomcat/conf/tomcat-users.xml
echo '<role rolename="manager-jmx"/>' >> tomcat/conf/tomcat-users.xml
echo '<role rolename="manager-status"/>' >> tomcat/conf/tomcat-users.xml
echo '<user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status"/>' >> tomcat/conf/tomcat-users.xml
echo '<user username="deployer" password="deployer" roles="manager-script"/>' >> tomcat/conf/tomcat-users.xml
echo '<user username="tomcat" password="s3cret" roles="manager-gui"/>' >> tomcat/conf/tomcat-users.xml

