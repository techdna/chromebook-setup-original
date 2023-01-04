# configure repos
sudo apt -y install fedora-workstation-repositories
sudo apt -y install apt-plugins-core
sudo apt config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo apt -y install apt-automatic
sudo sed -i 's/apply_updates = no/apply_updates = yes/g' /etc/apt/automatic.conf
sudo apt -y update
sudo systemctl enable --now apt-automatic.timer

sudo apt full-upgrade -y

# usual dependencies
sudo apt -y install @development-tools
sudo apt -y install kernel-headers kernel-devel dkms zlib-devel
sudo apt -y install elfutils-libelf-devel

#
#Application Configuration
#

# google chromium and chrome
sudo apt -y config-manager --set-enabled google-chrome
sudo apt -y install chromium-browser


#docker
sudo apt -y install docker-ce docker-ce-cli containerd.io docker-compose

# 1Password Command Line
curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
 sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | \
sudo tee /etc/apt/sources.list.d/1password.list
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
 sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
 sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
sudo apt update && sudo apt install 1password-cli
op --version

#Desktop Config
gsettings set org.gnome.desktop.background picture-options "scaled"
gsettings set org.gnome.desktop.interface scaling-factor 1.5

# Remove unnecessary components
sudo apt autoremove
