#!/bin/bash

res=$(echo -e "lock\npoweroff\nreboot\nlogout" | bemenu)

if [ $res == "lock" ]; then
    playerctl pause
    swaylock -f -c 000000 -i ~/.local/share/Background.jpg
elif [ $res == "logout" ]; then
    swaymsg exit
elif [ $res == "reboot" ]; then
    reboot
elif [ $res == "poweroff" ]; then
    poweroff
fi
exit 0
