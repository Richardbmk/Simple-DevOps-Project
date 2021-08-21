#! /bin/bash
sudo yum update -y
sudo yum install docker -y
sudo service docker start
sudo useradd dockeradmin
sudo usermod -aG docker dockeradmin
sudo docker run -d --name test-tomcat-server -p 8090:8080 tomcat:latest
