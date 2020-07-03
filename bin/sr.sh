#!/bin/sh
clear
echo '\nSTATUS REPORT\n'
date +'%t%t%H:%M'
echo
ncal -b -M
echo
echo -n 'Keyboard '
setxkbmap -query | grep 'layout'
echo
DISPLAY=:0 xset q | grep -i 'caps'| sed -e 's/^\s*//' | tr -s [:blank:] | sed -e 's/00: //g' | sed -e "s/0[1-2]: /\t\t\t/g"
echo 
wicd-cli -i
echo '\n'
stty -icanon; dd ibs=1 count=1 >/dev/null 2>&1
