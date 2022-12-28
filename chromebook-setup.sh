#!/bin/bash

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
sudo cp /etc/libvirt/qemu.conf /qemu.conf.backup
sudo sed -i 's/#user/user/g' /etc/libvirt/qemu.conf
sudo sed -i 's/#group/group/g' /etc/libvirt/qemu.conf

#End
