#!/bin/bash

# Update all
sudo apt update -y
sudo apt upgrade -y

# Miscellaneous
sudo apt install dnsutils -y
sudo apt install ack -y

# Install VM capability (does not support windows, use Parallels)
sudo apt install \
	qemu-kvm \
	libvirt-clients \
	libvirt-daemon-system \
	bridge-utils \
	virtinst \
	libvirt-daemon \
	-y

sudo apt install gnome-boxes -y

# Configure QEMU
sudo sed -i 's/#user/user/g' /etc/libvirt/qemu.conf
sudo sed -i 's/#group/group/g' /etc/libvirt/qemu.conf
xhost +

# Start gnome-boxes in background
ghome-boxes &

# Download and create base VM Image (Fedora)

# Install Docker
sudo apt install containerd.io docker-ce docker-ce-client docker-compose -y
sudo systemctl start docker

# Install Cron
sudo apt install cron -y
sudo cp ./tdna-cron /etc/cron.d

# Install Zoom
sudo apt install zoom -y

# Install Slack
sudo wget https://downloads.slack-edge.com/releases/linux/4.29.149/prod/x64/slack-desktop-4.29.149-amd64.deb
sudo apt install ./slack*.deb -y
sudo rm ./*.deb

# Install GCloud
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-418.0.0-linux-x86_64.tar.gz`
tar xf google-cloud-cli-418.0.0-linux-x86_64.tar.gz
cd google-cloud-sdk
./install.sh --usage-reporting false
gcloud init
 

# Install 1Password
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
sudo apt update && sudo apt install 1password


#End
