#!/bin/bash

echo ""
   echo ""
   echo ""
   sudo echo 'deb http://deb.debian.org/debian bookworm-backports main' | sudo tee /etc/apt/sources.list.d/bookworm-backports.list &&
   sudo apt update
   echo ""
   echo ""
   echo ""
   echo "-------------------------------------------------------------------------------"
   read -r -p "
   
               [0;33m---BOOKWORM BACKPORTS ENABLED AND UPDATED---[0m
           
      
          
   Repository added to /etc/apt/sources.list.d/bookworm-backports.list 
   For available packages try: https://backports.debian.org/Packages/
    
   In order to install a package from bookworm backports: 
   sudo apt install <package>/bookworm-backports
   

   ---------------------------------------------------------------------
   
   [0;31mIf you ONLY want Bookworm Backports, exit now by closing this window.[0m
   
   ---------------------------------------------------------------------
   
   
   [0;32mIf you would also like to ADD the Debian Fast Track repositories,
   please press Enter to continue.[0m




   "
   echo "" 
   echo ""
   echo ""
   echo ""
   sudo apt install fasttrack-archive-keyring &&
   sudo echo 'deb https://fasttrack.debian.net/debian-fasttrack/ bookworm-fasttrack main contrib' | sudo tee /etc/apt/sources.list.d/fasttrack.list;
   sudo echo 'deb https://fasttrack.debian.net/debian-fasttrack/ bookworm-backports-staging main contrib' | sudo tee -a /etc/apt/sources.list.d/fasttrack.list &&
   sudo apt update
   echo ""
   echo ""
   echo ""
   echo "-------------------------------------------------------------------------------"
   echo ""
   echo "               [0;33m---FAST TRACK REPOSITORIES ENABLED AND UPDATED---[0m"
echo ""
   echo "
   [0;32mFast Track repos have been added to /etc/apt/sources.list.d/fasttrack.list
   Bookworm Backports must also remain enabled for Fast Track to work.[0m 
   
   To install from Fast Track: sudo apt install <package>/bookworm-fasttrack

   ----------------------------------------------------------------------------


   [0;32mIf you want to remove the Fast Track sources from your sources list:[0m

   sudo rm /etc/apt/sources.list.d/fasttrack.list && 
   sudo apt remove fasttrack-archive-keyring
   "
   echo ""
else
echo ""
 echo "   [0;31m-----------------------------------------------------[0m"
 echo ""
 echo "   [0;33mNo Internet connection. Please connect and try again.[0m"
 echo ""
 echo "   [0;31m-----------------------------------------------------[0m"
echo ""

sudo apt update 
sudo apt upgrade -y
chmod 777 bpk.sh
sleep 1
./bpk.sh
