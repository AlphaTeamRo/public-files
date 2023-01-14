#!/bin/bash

read -r -p "Who was the script installed as ? ? (User, not root): " install_user

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "This script must be run as root. Exiting..."
    exit
fi

#disable and delete services

#stop
systemctl stop face.service
systemctl stop voice.service
systemctl stop discord.service
systemctl stop appsocket.service

#disable
systemctl disable face.service
systemctl disable voice.service
systemctl disable discord.service
systemctl disable appsocket.service

#delete
rm /lib/systemd/system/face.service
rm /lib/systemd/system/voice.service
rm /lib/systemd/system/discord.service
rm /lib/systemd/system/appsocket.service

#delete the max-scripts folder
rm -rf /home/$install_user/max-scripts