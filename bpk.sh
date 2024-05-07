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
   echo "
                     [0;33m---Bookworm Backports Enabled---[0m
         
   [0;36mRepository added to /etc/apt/sources.list.d/bookworm-backports.list[0m"
   echo ""
   echo "-------------------------------------------------------------------------------"
   echo ""
   sudo apt install -t bookworm-backports linux-image-amd64 linux-headers-amd64 firmware-linux -y
   echo ""
   echo "[0;33mPlease reboot into your new kernel when able.[0m"
echo ""
echo "[0;36mYou may need to look in 'Advanced Options' upon reboot if you"
echo "have installed a higher numbered kernel version previously."
echo "Grub will boot the highest numbered kernel version automatically.[0m"
echo ""
echo "To remove this kernel, reboot to your old kernel through"
echo "the advanced menu at the grub boot screen."
echo ""
echo "Then use apt or the kernel remover located in the menu"
echo "under utilities to remove the offending kernel."
echo ""
echo ""
echo ""
echo ""
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
fi
