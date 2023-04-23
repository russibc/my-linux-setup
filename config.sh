#!/bin/bash

echo "Starting packages install..."

# Development Tools
echo "Installing Development Tools group..."
sudo dnf groupinstall 'Development Tools' -y

# Java and Node.js
echo "Installing OpenJDK, PyQt5, Qt Designer, Node.js and npm..."
sudo dnf install java-latest-openjdk.x86_64 -y
sudo dnf install pip PyQt5 qt5-designer.x86_64 -y
sudo dnf install nodejs npm -y

# Multimedia
echo "Installing multimedia packages..."
sudo dnf install gthumb kdenlive fritzing simplescreenrecorder drawing vlc audacity inkscape gimp -y

# System packages
echo "Installing system packages..."
sudo dnf install gnome-extensions-app xkill okular gparted gnome-tweak-tool alacarte transmission -y 

# Web browsers
echo "Installing web browsers..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -P /tmp/
sudo dnf install /tmp/google-chrome-stable_current_x86_64.rpm -y

# Database management
echo "Installing database management packages..."
sudo dnf install mysql-server mysql-workbench -y

# Communication
echo "Installing communication packages..."
wget https://dl.discordapp.net/apps/linux/0.0.16/discord-0.0.16.rpm -P /tmp/
sudo dnf install /tmp/discord-0.0.16.rpm -y

# Remote control
echo "Installing remote control packages..."
wget https://www.unifiedremote.com/download/linux-deb/urserver-3.7.1.2381-amd64.deb -P /tmp/
sudo dnf install /tmp/urserver-3.7.1.2381-amd64.deb -y

# Productivity tools
echo "Installing productivity tools..."
sudo dnf install eclipse-jdt -y
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

echo "Installation completed."
