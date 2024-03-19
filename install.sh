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

# Verificar si la línea "webkit-theme" existe en la sección [greeter]
if ! grep -q "^\[greeter\]" /etc/lightdm/lightdm-webkit2-greeter.conf; then
    echo "[greeter]" >> /etc/lightdm/lightdm-webkit2-greeter.conf
fi

# Verificar si la línea no está comentada y agregar o actualizar la configuración del tema
if ! grep -q "^\s*#* *webkit_theme = " /etc/lightdm/lightdm-webkit2-greeter.conf; then
    sed -i '/^\[greeter\]/a webkit_theme = '$THEME_NAME /etc/lightdm/lightdm-webkit2-greeter.conf
    echo "Added webkit_theme configuration to /etc/lightdm/lightdm-webkit2-greeter.conf"
else
    sed -i '/^\[greeter\]/,/^\[/ {/^\s*#* *webkit_theme = /s/.*/webkit_theme = '$THEME_NAME'/}' /etc/lightdm/lightdm-webkit2-greeter.conf
    echo "Updated webkit_theme configuration in /etc/lightdm/lightdm-webkit2-greeter.conf"
fi

echo "Theme installed successfully. :P"
