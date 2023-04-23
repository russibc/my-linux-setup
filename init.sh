#!/bin/bash

echo "Starting setup..."

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

# Install RPM Fusion repository
echo "Installing RPM Fusion repository..."
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Update core group
echo "Updating Fedora's core group..."
sudo dnf group update core -y

# Clean dnf cache, update, and upgrade packages
echo "Cleaning dnf cache, updating, and upgrading packages..."
sudo dnf clean all && sudo dnf update -y && sudo dnf upgrade -y

echo "Setup completed."
echo "Rebooting in..."
for i in {3..1}
do
    echo "$i..."
done
reboot now
