# configure repos
sudo dnf -y install fedora-workstation-repositories
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install dnf-automatic
sudo sed -i 's/apply_updates = no/apply_updates = yes/g' /etc/dnf/automatic.conf
sudo dnf -y update
sudo systemctl enable --now dnf-automatic.timer

# usual dependencies
sudo dnf -y install @development-tools
sudo dnf -y install kernel-headers kernel-devel dkms zlib-devel
sudo dnf -y install elfutils-libelf-devel

# google chromium and chrome
sudo dnf -y config-manager --set-enabled google-chrome
sudo dnf -y install chromium

#
#Application Configuration
#

#chromium
sudo dnf -y install chromnium
sudo sed -i 's/chromium-browser /chromium-browser --disable-features=PreloadMediaEngagementData, MediaEngagementBypassAutoplayPolicies /g' /usr/share/applications/chromium-browser.desktop

#docker
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-compose

#Desktop Config
gsettings set org.gnome.desktop.background picture-options "scaled"
