# configure repos
sudo dnf -y install fedora-workstation-repositories
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install dnf-automatic
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
sudo dnf -y install chromium
sudo sed -i 's/chromium-browser /chromium-browser --disable-features=PreloadMediaEngagementData, MediaEngagementBypassAutoplayPolicies /g' /usr/share/applications/chromium-browser.desktop

#docker
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-compose

# 1Password Command Line
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf check-update -y 1password-cli && sudo dnf install 1password-cli
op --version

#Desktop Config
gsettings set org.gnome.desktop.background picture-options "scaled"
