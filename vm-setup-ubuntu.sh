# configure repos
sudo apt -y config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
DEBIAN_FRONTEND=noninteractive sudo apt install unattended-upgrades apt-listchanges bsd-mailx -y
sudo dpkg-reconfigure -plow unattended-upgrades -y
sudo apt -y update
sudo apt full-upgrade -y

# usual dependencies
sudo apt -y install build-essential 
sudo apt -y install linux-headers-$(uname -r) dkms zlib1g
sudo apt -y install libelf-dev

#
#Application Configuration
#

# google chromium 
sudo apt -y install chromium-browser


#docker
sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --yes --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# 1Password Command Line
sudo curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
 sudo gpg --yes --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | \
sudo tee /etc/apt/sources.list.d/1password.list
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
 sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
 sudo gpg --yes --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
sudo apt update && sudo apt install 1password-cli
op --version

#Desktop Config
gsettings set org.gnome.desktop.background picture-options "scaled"

# Remove unnecessary components
sudo apt autoremove
