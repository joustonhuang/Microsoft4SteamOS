#!/bin/bash

# Disable readonly mode
sudo steamos-readonly disable

# Initiate Pacman Keys
sudo pacman-key --init
sudo pacman-key --populate archlinux


InstallYay(){
# Clone yay
cd /opt
#sudo git clone https://aur.archlinux.org/yay.git
sudo git clone https://aur.archlinux.org/yay-bin.git
sudo chown -R "$USER:users" /opt/yay-bin
cd /opt/yay-bin
makepkg -si --noconfirm
}

InstallEdge(){
# Install Microsoft Edge browser by compiling
cd /opt
git clone https://aur.archlinux.org/microsoft-edge-stable-bin.git
sudo chown -R "$USER:users" microsoft-edge-stable-bin
cd microsoft-edge-stable-bin/
makepkg -si --noconfirm
}

InstallTeams(){
# Install Microsoft Teams from AUR
sudo yay -S aur/teams --noconfirm
}

# confirm which task to proceed
echo -n "Everything(YAY, Edge and Teams)(Y), yay only(a), Edge only(e), Teams only(t) or Quit(q) [Y]: "
DEFAULT="y"
read -e -p "Proceed [Y/a/e/t/q]:" PROCEED
# adopt the default, if 'enter' given
PROCEED="${PROCEED:-${DEFAULT}}"
# change to lower case to simplify following if
PROCEED="${PROCEED,,}"
# condition for specific letter
if [ "${PROCEED}" == "q" ] ; then
  echo "Quitting"
  exit
# condition for non specific letter (ie anything other than q/y)
# if you want to have the active 'y' code in the last section
elif [ "${PROCEED}" == "a" ] ; then
  echo "Install YAY... "
  InstallYay
elif [ "${PROCEED}" == "e" ] ; then
  echo "Installing Microsoft Edge... "
  InstallYay
  InstallEdge
elif [ "${PROCEED}" == "t" ] ; then
  echo "Installing Microsoft Teams... "
  InstallYay
  InstallTeams
else
  echo "Installing Everything..."
  # do proceeding code in here
  InstallYay
  InstallEdge
  InstallTeams
fi

# Recover from readonly mode
sudo steamos-readonly enable

# Finishing
echo ""
echo "Done! Please find Microsoft Edge Broswer from start menu"
echo ""
