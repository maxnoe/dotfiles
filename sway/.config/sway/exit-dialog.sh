#!/bin/bash

res=$(echo -e "poweroff\nreboot\nlogout" | bemenu)

if [ $res == "logout" ]; then
    swaymsg exit
elif [ $res == "reboot" ]; then
    reboot
elif [ $res == "poweroff" ]; then
    poweroff
fi
exit 0
