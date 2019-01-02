#!/bin/bash

res=$(dmenu -p "EXIT" -nb "#ef8040" -sb "#db3b3b" -sf "#000" -nf "#000" < $HOME/.config/i3/dmenu-exit)

if [ $res = "logout" ]; then
    i3-msg exit
elif [ $res = "reboot" ]; then
    reboot
elif [ $res = "shutdown" ]; then
    poweroff
fi
exit 0
