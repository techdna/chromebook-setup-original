#!/bin/bash

# Update all
sudo apt update -y
sudo apt upgrade -y

# Install Ansible
sudo apt install -y python3 \
	pip3

python3 -m pip install --user ansible

ansible --version

