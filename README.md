# nicebox
nice openbox


## nice shortcuts
### openbox

`W-r` rofi: switch running apps, launch apps, run commands, run custom `~/bin` "trick shots" like `kbden.sh` `kbdro.sh` `obe.sh` `obr.sh` `pm.sh` `rsr.sh`

`A-f4` close window

`A-space` window menu

`F10` app menu

`C-A->` next workspace

`C-A-<` previous workspace

`A-tab` cycle apps

### xfce4-terminal
`C-S-t` new tab

`C-S-w` close tab

`C-PageDown` cycle tabs to the right

`C-PageUp` cycle tabs to the left

### vifm
`tab` switch panel

`space` toggle select

`w` toggle preview file in the other panel

`f3` view file in editor

`f4` edit file in editor

`f5` copy to directory in the other panel

`f6` move to directory in the other panel

`f7` create directory

`C-t` new tab

`C-w` close tab

`ngt` go to tab number n, e.g. `2gt`

`s` drop to shell

`delete` delete

### chromium
`C-t` new tab

`C-w` close tab

`C-tab` | `C-PageDown` cycle tabs to the right

`C-S-tab` | `C-PageUp` cycle tabs to the left

#### vimium
`d` half page down

`u` half page up

`S-g` go to bottom

`gg` go to top

`f` links

`/` search on page

`n` next search on page result

## nice debian
download debian netinst iso

write iso to usb flash memory
```
# lsblk --find usb flash memory device: e.g. /dev/sdb
# dd if=debian-10.4.0-amd64-netinst.iso of=/dev/sdb status=progress && sync --write iso
```

## nice firmware
identify non-free firmware for devices in your machine: wifi, bluetooth etc

look for it in the [kernel subsection](https://packages.debian.org/buster/kernel/)

or download the [non-free firmware archive](http://cdimage.debian.org/cdimage/unofficial/non-free/firmware/)

and copy the (extracted) files to the `firmware` directory on the usb flash memory 

## nice install
boot from usb and install only system utilities: uncheck Debian desktop environ etc

create your "user"

## nice ad-hoc wifi
go back on the last step, to a shell

if `target` directory has no `etc/network`, create it

`cp /etc/network/interfaces /target/etc/network/`

## nice download
reboot

login as "user"

```
$ su -l
# cd Downloads
# wget https://github.com/itmitica/nicebox/archive/master.zip
# unzip master.zip
# ./nicebox-master/bin/apps.sh
# cp -r nicebox-master/bin/ /home/"user"/
# cp -rT nicebox-master/bin/setup/home/ /home/"user"/
# rm master.zip
# rm -r nicebox-master
```

## nice apps

### security
clamav / clamav-daemon / clamtk

`# gufw`

### sysutils
firmware-misc-nonfree

htop

numlockx

pmount

rofi `$ rofi-theme-selector`

vim-gtk, has clipboard+ `Shift + " + +, y`

vifm

xfce4-power-manager

xfce4-terminal `$ xfce4-terminal --tab --command ' ' &`

### device utils
blueman

pavucontrol

pulseaudio-module-bluetooth

wicd / wicd-curses / wicd-cli (maybe change to `nl80211`)

### nice utils
chromium

feh

galculator

git

gucharmap

links2 `$ links2 -g`

mpv

## nice setup
### missing sbin in path
run su with login: `su -l`

### power management
`$ xfce4-power-manager`

### timezone
`$ timedatectl set-timezone Europe/Bucharest`

### locales
to add a new locale

```
$ su -l
# dpkg-reconfigure locales
```

add `ro`

as user, you can set `LC_TIME` and other `LC_` in `.xsessionrc`

### openbox
#### autostart
```
feh --bg-fill ~/bin/media/walls/simpledesktops.png &
numlockx on &
redshift -P -O 5500 &
setxkbmap -layout "us"
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

#### park mouse
##### pm.sh
```
#!/bin/sh
xdotool mousemove 5000 5000
```

#### status report
##### sr.sh
```
#!/bin/sh
clear
echo '\nSTATUS REPORT\n'
date +'%a %_d   %H:%M'
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
```

#### run status report
##### rsr.sh
```
#!/bin/sh
xfce4-terminal -x ~/bin/sr.sh
```

### nice mount
```
$ lsblk -- check devs and mount pts
$ pmount /dev/sdb1
$ lsblk -- check if mount point has been created: /media/sdb1
$ -- user play
$ pumount /dev/sdb1
$ lsblk -- check if unmounted succesfully
```

### nice optionals
#### status bar
```
$ i3status | xmobar
```

#### security
`rkhunter` Rootkit Hunter

#### utils
`apparix` console-based bookmark tool for fast file system navigation
