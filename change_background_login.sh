#!/bin/bash

set -eux

WALL_DIR=/usr/share/backgrounds/
# need permission for read this file
CONFIG_FILE=/etc/lightdm/lightdm-gtk-greeter.conf

walpallers=($(find $WALL_DIR -name "custom*"))
RANDOM_WALL=${walpallers[$((RANDOM % ${#walpallers[@]}))]}

printf "%s\n" ",s|^background = .*|background = $RANDOM_WALL|g" wq | ed -s $CONFIG_FILE

# sed -i "s|^background = .*|background = $RANDOM_WALL|g" $CONFIG_FILE
echo "new background $RANDOM_WALL"
