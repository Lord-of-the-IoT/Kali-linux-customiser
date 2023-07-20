#!/bin/bash
#set date and time
timedatectl set-timezone Europe/London



#set keyboard layout
echo "# KEYBOARD CONFIGURATION FILE\n# Consult the keyboard(5) manual page.\nXKBMODEL=\"pc105\"\nXKBLAYOUT=\"uk\"\nXKBVARIANT=\"\"\nXKBOPTIONS=\"\"\nBACKSPACE=\"guess\"" > /etc/default/keyboard



#downloads packages from apt
#apt-get install git, silenttrinity



#download assets from github
if ! [ -d "assets" ]                                                                                                                                                                                                                       
then                                                                                                                                                                                                                                       
        git clone https://github.com/Lord-of-the-IoT/Kali-linux-customiser.git                                                                                                                                                             
        mv Kali-linux-customiser/assets $(pwd)                                                                                                                                                                                             
        rm -r Kali-linux-customiser                                                                                                                                                                                                        
fi                                                                                                                                                                                                                                         
                                                                                                                                                                                                                                           
                                                                                                                                                                                                                                           
                                                                                                                                                                                                                                           
# set backgrounds                                                                                                                                                                                                                          
cp assets/kali-red-sticker-16x9.jpg /usr/share/backgrounds/kali                                                                                                                                                                            
cp assets/kali-red-sticker-16x9.jpg /usr/share/backgrounds/kali/login.svg                                                                                                                                                                  
gsettings set org.gnome.desktop.background picture-uri file:////usr/share/backgrounds/kali/kali-red-sticker-16x9.jpg                                                                                                                       
                                                                                                                                                                                                                                           
                                                                                                                                                                                                                                           
                                                                                                                                                                                                                                           
#delete assets                                                                                                                                                                                                                             
#rm -r assets
