#!/bin/bash

echo "Starting configuration..."

# Remove unwanted packages
echo "Removing unwanted packages..."
sudo dnf remove eog -y
sudo dnf remove evince -y
sudo dnf remove rhythmbox -y
sudo dnf remove libreoffice* -y
sudo dnf remove totem -y
sudo dnf remove gnome-maps -y
sudo dnf remove gnome-contacts -y
sudo dnf remove gnome-weather -y
sudo dnf remove gnome-boxes -y
sudo dnf remove gnome-photos -y

# Clean dnf cache, update, and upgrade packages
echo "Cleaning dnf cache, updating, and upgrading packages..."
sudo dnf clean all && sudo dnf update -y && sudo dnf upgrade -y

# Install RPM Fusion repository
echo "Installing RPM Fusion repository..."
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Update core group
echo "Updating Fedora's core group..."
sudo dnf group update core -y

# Install dev tools
echo "Install dev tools..."
sudo dnf install java-latest-openjdk.x86_64 -y
sudo dnf install pip PyQt5 qt5-designer.x86_64 -y
sudo dnf install nodejs npm -y
sudo dnf groupinstall 'Development Tools' -y

# Install additional packages
echo "Installing graphical packages..."
sudo dnf install gthumb kdenlive fritzing simplescreenrecorder drawing vlc audacity inkscape gimp -y

# Install system packages
echo "Installing utilitaries packages..."
sudo dnf install gnome-extensions-app xkill okular gparted gnome-tweak-tool alacarte transmission -y 

echo "Configuration completed."
