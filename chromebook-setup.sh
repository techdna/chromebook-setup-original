#!/bin/bash

# Update all
sudo apt update -y
sudo apt upgrade -y

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

# Install Docker
sudo apt install docker docker-compose -y

# Install Cron
sudo apt install cron -y
sudo cp ./tdna-cron /etc/cron.d

# Install Zoom
sudo apt install zoom -y

# Install Slack
sudo wget https://downloads.slack-edge.com/releases/linux/4.29.149/prod/x64/slack-desktop-4.29.149-amd64.deb
sudo apt install slack*.deb -y
sudo rm https://downloads.slack-edge.com/releases/linux/4.29.149/prod/x64/slack-desktop-4.29.149-amd64.deb

#End
