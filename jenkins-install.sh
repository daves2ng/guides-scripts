#! /bin/bash

# Pre-requisite installation

# First, run apt update
sudo apt-get update

# Install Default Java Version
sudo apt install default-jdk -y

# add jenkins key
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg

# add jenkins library
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update app again
sudo apt update

# Main Jenkins installation

# Install Jenkins

sudo apt install jenkins -y

#Optional step - open port 8080 in the firewall

sudo ufw allow 8080

echo 'now setting jenkins boot parameters, please wait' && sleep 5

# Set jenkins to load onn startup

sudo systemctl enable jenkins

echo 'The installation is successful...'
echo 'performing cleanup, please wait...' && sleep 8

# Display the default jenkins password

clear
echo 'Jenkins is now installed. The default password is:' $(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)