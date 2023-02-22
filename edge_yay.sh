#!/bin/bash

# Disable readonly mode
sudo steamos-readonly disable

# Initiate Pacman Keys
sudo pacman-key --init
sudo pacman-key --populate archlinux

# install git
sudo pacman -S base-devel git --noconfirm

# Clone yay
cd /opt
#sudo git clone https://aur.archlinux.org/yay.git
sudo git clone https://aur.archlinux.org/yay-bin.git
sudo chown -R "$USER:users" /opt/yay-bin
cd /opt/yay-bin
makepkg -si --noconfirm

# Install Microsoft Edge browser by compiling
cd /opt
git clone https://aur.archlinux.org/microsoft-edge-stable-bin.git
sudo chown -R "$USER:users" microsoft-edge-stable-bin
cd microsoft-edge-stable-bin/
makepkg -si --noconfirm

# Recover from readonly mode
sudo steamos-readonly enable

# Finishing
echo ""
echo "Done! Please reboot"
echo ""
