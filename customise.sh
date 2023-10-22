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
apt-get install git silenttrinity cyberchef gobuster armitage seclists graphicsmagick-imagemagick-compat  maltego remmina putty-tools chisel sshuttle backdoor-factory veil powershell-empire starkiller
apt-get install gdb gpg notepaddqq cheese cupp
pip install PyCryptodome pwntools scapy git-dumper textual art rich
#install tools from gem
gem install evil-winrm
#install tools from git
mkdir ~/tools
cd ~/tools
git clone https://github.com/Sybil-Scan/imagemagick-lfi-poc.git
git clone https://github.com/ly4k/PwnKit.git
git clone https://github.com/carlospolop/PEASS-ng.git
#install sagemath for cryptograpy- this will taake forever, as of writing it has been 1hr 30 for this step and it is still going
sudo apt install bc binutils bzip2 ca-certificates cliquer cmake curl ecl eclib-tools fflas-ffpack flintqs g++ gengetopt gfan gfortran
        git glpk-utils gmp-ecm lcalc libatomic-ops-dev libboost-dev libbraiding-dev libbz2-dev libcdd-dev libcdd-tools libcliquer-dev
        libcurl4-openssl-dev libec-dev libecm-dev libffi-dev libflint-arb-dev libflint-dev libfreetype6-dev libgc-dev libgd-dev libgf2x-dev
        libgiac-dev libgivaro-dev libglpk-dev libgmp-dev libgsl-dev libhomfly-dev libiml-dev liblfunction-dev liblrcalc-dev liblzma-dev
        libm4rie-dev libmpc-dev libmpfi-dev libmpfr-dev libncurses5-dev libntl-dev libopenblas-dev libpari-dev libpcre3-dev libplanarity-dev
        libppl-dev libprimesieve-dev libpython3-dev libqhull-dev libreadline-dev librw-dev libsingular4-dev libsqlite3-dev libssl-dev
        libsuitesparse-dev libsymmetrica2-dev libz-dev libzmq3-dev libzn-poly-dev m4 make nauty openssl palp pari-doc pari-elldata pari-galdata
        pari-galpol pari-gp2c pari-seadata patch perl pkg-config planarity ppl-dev python3-distutils python3-venv r-base-dev r-cran-lattice singular
        sqlite3 sympow tachyon tar tox xcas xz-utils
git clone --branch master https://github.com/sagemath/sage.git
cd sage
make configure
./configure
MAKE="make -j8" make

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

