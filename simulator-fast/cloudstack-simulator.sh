#!/bin/bash

(killall java || true) > /dev/null 2>&1

(echo "drop database cloud;" | mysql -u root || true) > /dev/null 2>&1
(echo "drop database simulator;" | mysql -u root || true) > /dev/null 2>&1
(echo "drop user 'cloud'@'%';" | mysql -u root || true) > /dev/null 2>&1

(echo "create database cloud;" | mysql -u root) > /dev/null 2>&1 
(echo "create user 'cloud'@'%' identified by 'cloud';" | mysql -u root) > /dev/null 2>&1
(echo "grant all privileges on cloud.* to 'cloud'@'%';" | mysql -u root) > /dev/null 2>&1
(echo "create database simulator;" | mysql -u root)  > /dev/null 2>&1
(echo "grant all privileges on simulator.* to 'cloud'@'%';" | mysql -u root) > /dev/null 2>&1
(echo "flush privileges;" | mysql -u root) > /dev/null 2>&1 

mysql -u root cloud < /vagrant/cloudstack/cloud.sql
mysql -u root simulator < /vagrant/cloudstack/simulator.sql

nohup java -Xmx512m -XX:MaxPermSize=512m -jar /vagrant/cloudstack/jetty-runner.jar --path /client /vagrant/cloudstack/cloud-client.war --lib /vagrant/cloudstack/lib > cloudstack.log 2>&1 &

echo "☁️  Cloud is starting..."

while ! nc -vz localhost 8096 > /dev/null 2>&1; do sleep 10; done

echo "Huzza! Your ☁️  cloud lives, open http://localhost:8080 in your browser..."
