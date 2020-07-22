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

### mpv
`A-f` navigator

### chromium
`C-t` new tab

`C-w` close tab

`C-tab` | `C-PageDown` cycle tabs to the right

`C-S-tab` | `C-PageUp` cycle tabs to the left

`A-j` open downloads list

`A-c` clear downloads list

#### vimium
`d` half page down

`u` half page up

`S-g` go to bottom

`gg` go to top

`f` links

`/` search on page

`n` next search on page result

## nice firmware - the easy way
download debian **non-free** iso e.g. [amd64](http://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/10.4.0+nonfree/amd64/iso-cd/firmware-10.4.0-amd64-netinst.iso)

write iso to usb flash memory
```
find usb flash memory device: e.g. /dev/sdb
# lsblk 
write iso to flash memory device
# dd if=firmware-10.4.0-amd64-netinst.iso of=/dev/sdb status=progress && sync
or
# cp firmware-10.4.0-amd64-netinst.iso /dev/sdb
```

## nice firmware - the hard way
download debian iso e.g. [amd64](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.4.0-amd64-netinst.iso)

write iso to usb flash memory

identify non-free firmware for devices in your machine: wifi, 
blueman

bluez-firmware

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

### appearance
`$ lxappearance`

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
redshift -P -O 5000 &
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

### nice bluetooth
use [cli](https://wiki.archlinux.org/index.php/Bluetooth_headset) to discover, pair and connect 

```
$ bluetoothctl

>> agent on
>> scan on
>> pair MAC --tab to autocomplete
>> connect MAC
>> trust MAC
```

use Bluetooth Manager to setup (try as Active Sink if it keeps connecting and disconnecting)

read on [debian BluetoothUser](https://wiki.debian.org/BluetoothUser) [a2dp](https://wiki.debian.org/BluetoothUser/a2dp) for alternative solutions

### nice keyboard volume control
#### rc.xml
edit file with your sink: 0, 1 etc

choose your control utility: amixer, pactl

```
    <keybind key="XF86AudioRaiseVolume">
      <action name="Execute">
        <command>pactl set-sink-volume 1 +5%</command>
      </action>
    </keybind>
    <keybind key="XF86AudioLowerVolume">
      <action name="Execute">
        <command>pactl set-sink-volume 1 -5%</command>
     </action>
    </keybind>
    <keybind key="XF86AudioMute">
      <action name="Execute">
        <command>pactl set-sink-mute 1 toggle</command>
      </action>
    </keybind>

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
