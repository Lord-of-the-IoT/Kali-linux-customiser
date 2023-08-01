#!/bin/bash
#get username
read -p 'username: ' username
#check if root
if (whoami != root)
then
        echo "\033[31;1m Programn must be run as root\033[0m"
        exit
fi

#################
# system config #
#################
#set date and time
timedatectl set-timezone Europe/London
#set keyboard layout
echo "# KEYBOARD CONFIGURATION FILE\n# Consult the keyboard(5) manual page.\nXKBMODEL=\"pc105\"\nXKBLAYOUT=\"uk\"\nXKBVARIANT=\"\"\nXKBOPTIONS=\"\"\nBACKSPACE=\"guess\"" > /etc/default/keyboard



#####################
# tool installation #
#####################
#update and upgrade apt
apt-get update && apt upgrade
#downloads packages from apt and pip
apt-get install git silenttrinity cyberchef gobuster armitage seclists graphicsmagick-imagemagick-compat cmatrix
pip install PyCryptodome pwntools scapy git-dumper
#install tools from git
mkdir ~/tools
cd ~/tools
git clone https://github.com/Sybil-Scan/imagemagick-lfi-poc.git
git clone https://github.com/ly4k/PwnKit.git
git clone https://github.com/carlospolop/PEASS-ng.git

#install atom
apt-get install git libasound2 libcurl4 libgbm1 libgcrypt20 libgtk-3-0 libnotify4 libnss3 libglib2.0-bin xdg-utils libx11-xcb1 libxcb-dri3-0 libxss1 libxtst6 libxkbfile1 #prequisites
echo "downloading atom..."
wget https://github.com/atom/atom/releases/download/v1.60.0/atom-amd64.tar.gz
echo "unzipping atom..."
gzip -d atom-amd64.tar.gz
tar -xf atom-amd64.tar
echo "moving atom to tool dir..."
if ! [ -d "/bin/atom" ]
then
        cp -r atom-*amd64 atom
        rm -r atom-*amd64
        mv atom /bin
        chown $username /bin/atom -R
        chgrp $username /bin/atom -R
else
        rm -r atom
fi
echo "alias atom='/bin/atom/atom'" >> /home/$username/.bashrc



########################
# visual customisation #
########################
#download assets from github
if ! [ -d "assets" ]
then
        echo "cloning assets directory..."
        git clone https://github.com/Lord-of-the-IoT/Kali-linux-customiser.git
        mv Kali-linux-customiser/assets $(pwd)
        rm -r Kali-linux-customiser
fi
cd assets
# set backgrounds
cp kali-red-sticker-16x9.jpg /usr/share/backgrounds/kali
cp kali-red-sticker-16x9.jpg /usr/share/backgrounds/kali/login.svg
cp kali-red-sticker-16x9.jpg /usr/share/images/desktop-base/desktop-grub/desktop-grub.png
cp kali-red-sticker-16x9.jpg /usr/share/images/desktop-base/desktop-grub/default
cp kali-red-sticker-16x9.jpg /usr/share/images/desktop-base/desktop-grub/desktop-background
gsettings set org.gnome.desktop.background picture-uri file:////usr/share/backgrounds/kali/kali-red-sticker-16x9.jpg



###########
# cleanup #
###########
cd ..
#delete assets
rm -r assets
#reboot
echo "reboot required for some changes to come into effect"

