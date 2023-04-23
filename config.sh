#!/bin/bash

echo "Starting packages install..."

# Install OpenJDK, PyQt5, Qt Designer, Node.js and npm
echo "Installing OpenJDK, PyQt5, Qt Designer, Node.js and npm..."
sudo dnf install java-latest-openjdk.x86_64 -y
sudo dnf install pip PyQt5 qt5-designer.x86_64 -y
sudo dnf install nodejs npm -y

# Install Development Tools group
echo "Installing Development Tools group..."
sudo dnf groupinstall 'Development Tools' -y

# Install additional packages
echo "Installing additional packages..."
sudo dnf install gthumb kdenlive fritzing simplescreenrecorder drawing vlc audacity inkscape gimp -y

# Install system packages
echo "Installing system packages..."
sudo dnf install gnome-extensions-app xkill okular gparted gnome-tweak-tool alacarte transmission -y 

# Install Steam
echo "Installing Steam..."
sudo dnf install steam -y

# Install Spotify
echo "Installing Spotify..."
sudo dnf config-manager --add-repo=https://negativo17.org/repos/fedora-spotify.repo -y
sudo dnf install spotify-client -y

# Install GitKraken
echo "Installing GitKraken..."
wget https://release.gitkraken.com/linux/gitkraken-amd64.rpm -P /tmp/
sudo dnf install /tmp/gitkraken-amd64.rpm -y

# Install Visual Studio Code
echo "Installing Visual Studio Code..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo tee /etc/yum.repos.d/vscode.repo <<EOF
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
sudo dnf install code -y

echo "Configuration completed."
