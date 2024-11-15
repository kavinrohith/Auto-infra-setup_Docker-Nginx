# Infrastructure Setup

This repository contains an automated script to set up a basic infrastructure environment using Docker through git clone.

## Overview

The `setup-infrastructure.sh` script:
- Installs Docker if not already present on your machine.
- Sets up a custom Docker network.
- Runs a basic Nginx web server inside a Docker container.
- Configures firewall rules to allow web traffic on port 80.

## Prerequisites

- Linux (Ubuntu recommended) or macOS, we are using Ubuntu 24.04 latest version.
- Root or sudo access to install Docker and configure the firewall.
- Docker must be installed.

## Instructions
### Step 1: Create Repository
Enter a name for your project (Auto-infra-setup_Docker-Nginx)

### Step 2: Create a file containing the setup code for Automated infrastructure setup
setup_infrastructure.sh and enter the code and commit changes

### Step 3: Connect to Ec2 machine or any other instances or locally
install git in the Machine

### Step 4: Clone the Repository
git clone  https://github.com/kavinrohith/Auto-infra-setup_Docker-Nginx.git
cd Auto-infra-setup_Docker-Nginx

### Step 5: change the script to execute state
chmod +x setup_infrastructure.sh

### Step 6: Execute the scipt
./setup_infrastructure.sh
### the script will install all the required docker images and ngnix

### Step 4: Browse in webpage and check the status of Nginx
### Now after the script have executed successfully we can browse the webpage URl
http://"public Ip of the server" --> It will show Nginx web page that denotes nginx successfully installed and running.
