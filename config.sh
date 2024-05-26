#!/bin/bash

echo "Starting packages install..."

# Development Tools
echo "Installing Development Tools group..."
sudo dnf groupinstall 'Development Tools' -y
wget https://release.gitkraken.com/linux/gitkraken-amd64.rpm -P /tmp/
sudo dnf install /tmp/gitkraken-amd64.rpm -y
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
sudo dnf install docker -y

# Java and Node.js
echo "Installing OpenJDK, PyQt5, Qt Designer, Node.js and npm..."
sudo dnf install java-latest-openjdk.x86_64 -y
sudo dnf install pip -y # PyQt5 qt5-designer.x86_64
sudo dnf install nodejs npm -y

# Database management
echo "Installing database management packages..."
wget https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm -P /tmp/
sudo dnf install /tmp/dbeaver* -y
# sudo dnf install mysql-server mysql-workbench -y

# Multimedia
echo "Installing multimedia packages..."
sudo dnf install gthumb vlc inkscape gimp -y # kdenlive fritzing simplescreenrecorder drawing audacity

# Web browsers
echo "Installing Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -P /tmp/
sudo dnf install /tmp/google-chrome-stable_current_x86_64.rpm -y

# Remote control
echo "Installing remote control packages..."
wget https://www.unifiedremote.com/download/linux-x64-rpm -P /tmp/
sudo dnf install /tmp/urserver* -y

# Utilitary
echo "Installing utilitary software..."
sudo dnf install gnome-extensions-app gedit xkill okular gparted gnome-tweak-tool alacarte transmission flatpak -y 

echo "Starting installations using Flatpak..."
# Communication
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.slack.Slack -y

# Games
flatpak install flathub com.valvesoftware.Steam -y

# Music
flatpak install flathub com.spotify.Client -y

# Flatpak management
flatpak install flathub io.github.flattool.Warehouse -y

# Academic
flatpak install flathub org.zotero.Zotero -y

# Development
flatpak install flathub org.eclipse.Java -y
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Ultimate -y
flatpak install flathub com.getpostman.Postman -y

echo "Flatpak installations finished!"

# Terminal colors
mkdir -p "$HOME/src"
cd "$HOME/src"
git clone https://github.com/Gogh-Co/Gogh.git gogh
# cd gogh
# cd installs
# ./aci.sh

echo "Full configuration completed."
