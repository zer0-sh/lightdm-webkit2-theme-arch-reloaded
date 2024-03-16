#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root, use sudo $0 instead." 
   exit 1
fi

THEME_DIR="/usr/share/lightdm-webkit/themes"
THEME_NAME="arch-reloaded"

if [ -d "$THEME_DIR/$THEME_NAME" ]; then
    echo "Theme already installed."
    read -p "Do you want reinstall? (y/n): " reinstall
    if [[ $reinstall != "y" ]]; then
        exit 0
    fi
    rm -rf $THEME_DIR/$THEME_NAME
fi

cp -r . $THEME_DIR/$THEME_NAME

chown -R lightdm:lightdm $THEME_DIR/$THEME_NAME

echo "[Seat:*]" >> /etc/lightdm/lightdm.conf
echo "webkit-theme=$THEME_NAME" >> /etc/lightdm/lightdm.conf

echo "Theme installed successfully. :P"
