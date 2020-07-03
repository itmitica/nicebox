# nicebox
nice openbox

## nice debian
download debian netinst iso  
write iso to usb portable memory stick  

## nice firmware
identify non-free firmware for devices in your machine: wifi, bluetooth etc  
look for it in the non-free archive: http://cdimage.debian.org/cdimage/unofficial/non-free/firmware/  
look for it in the kernel subsection: https://packages.debian.org/buster/kernel/  
download and copy to `firmware` directory on the usb portable memory stick  

## nice install
boot from usb and install only system utilities: uncheck Debian desktop environ etc  

## nice ad-hoc wifi
go back on the last step, to a shell  
if `target` directory has no `etc/network`, create it  
`cp /etc/network/interfaces /target/etc/network/`  
reboot  

## nice apps

### security
clamav / clamav-daemon / clamtk  
(`su`) gufw  

### sysutils
htop  
numlockx  
rofi (`rofi-theme-selector`)  
vim-gtk (clipboard+: `Shift + " + +, y`)  
vifm  
xfce4-power-manager  
xfce4-terminal (`xfce4-terminal --tab --command ' ' &`)  

### device utils
blueman  
intel-microcode  
pavucontrol  
pulseaudio-module-bluetooth  
wicd / wicd-curses / wicd-cli (maybe change to `nl80211`)  

### nice utils
feh  
galculator  
git  
gucharmap  
links2 (`link2 -g`)  
mpv  
vivaldi ("sbin folder not in path" issue with missing libraries, use `su -l` then `dpkg -i ~/Downloads/vivaldi-stable_3.1.1929.45-1_amd64.deb`)  

## nice setup
### missing sbin in path
run su with login: `su -l`  

### power management
`xfce4-power-manager`

### timezone
`timedatectl set-timezone Europe/Bucharest`

### locales TBD
to change first day of the week to Monday  
`dpkg-reconfigure locales`  
add `ro`  
set `LC_TIME` in `.xsessionrc`  

### openbox
#### autostart
```
feh --bg-fill ~/bin/media/walls/simpledesktops.png &
numlockx on &
redshift -P -O 5500 &
# setxkbmap -layout "us,ro(std)" -option "grp:alt_shift_toggle" &
# compton -b -cC -r2 -o0.5 -l-2 -t-2 -m0.95 -i0.95 -e0.95 -z &
```
#### rc.xml
comment out `<menu, context:root>` branch to disable the right-click pipe menu  
use rofi  
```
    <keybind key="W-r">
      <action name="Execute">
        <command>rofi -combi-modi "window,drun,run" -show combi -modi combi</command>
      </action>
    </keybind>
```

### ~/bin utils, run with rofi

#### openbox exit
##### obe.sh
```
#!/bin/sh
openbox --exit
```

#### openbox restart
##### obr.sh
```
#!/bin/sh
openbox --restart
```

#### keyboard layouts
##### kbden.sh
```
#!/bin/sh
setxkbmap -layout "us"
```

##### kbdro.sh
```
#!/bin/sh
setxkbmap -layout "ro(std)" 
```

#### status report
##### sr.sh
```
#!/bin/sh
clear
echo '\nSTATUS REPORT\n'
date +'%a %_d   %H:%M'
echo
cal
echo
echo -n 'Keyboard '
setxkbmap -query | grep 'layout'
echo
DISPLAY=:0 xset q | grep -i 'caps'| sed -e 's/^\s*//' | tr -s [:blank:] | sed -e 's/00: //g' | sed -e "s/0[1-2]: /\t\t\t/g"
echo
wicd-cli -i
echo '\n'
stty -icanon; dd ibs=1 count=1 >/dev/null 2>&1
```

#### run status report
##### rsr.sh
```
#!/bin/sh
xfce4-terminal -x ~/bin/sr.sh
```
