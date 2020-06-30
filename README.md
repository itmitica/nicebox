# nicebox
nice openbox

## nice debian
download debian netinst iso  
write iso to usb portable memory stick  

## nice firmware
identify non-free firmware for devices in your machine: wifi, bluetooth etc  
look for it in the non-free archive: http://cdimage.debian.org/cdimage/unofficial/non-free/firmware/  
look for it in the kernel subsection: https://packages.debian.org/buster/kernel/  
download and copy to "firmware" directory on the usb portable memory stick  

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
xfce4-terminal (`xfce4-terminal --tab --command ' ' &`)  

### device utils
blueman  
intel-microcode  
pavucontrol  
pulseaudio-module-bluetooth  
wicd / wicd-curses / wicd-cli  
