# MIWIFI_R3D_SETUP
Steps to fix opkg package manager on XIAOMI Mi Router HD (R3D)  
If you have an error ```'xterm-256color': unknown terminal type.``` run the following command:
```
export TERM=xterm
```
### Configure proper OpenWRT packages repositories
Open ```/etc/opkg.conf``` for editting. Comment default repo link and insert proper links as follows:
```
# src/gz standard http://downloads.openwrt.org/attitude_adjustment/12.09-rc1/ipq806x/MiWiFi/packages
src/gz standard http://archive.openwrt.org/snapshots/trunk/ipq806x/generic/packages/base
src/gz packages http://archive.openwrt.org/snapshots/trunk/ipq806x/generic/packages/packages
```
Run ```opkg update``` (twice if first run failed)
### Essential libs installation
Place ```functions.sh``` and ```redirect_functions.sh``` scripts from this repo into ```/data/lib``` directory and run:
```
chmod +x /data/lib/functions.sh
chmod +x /data/lib/redirect_functions.sh
```
Install ```libc```, ```libncurses``` and ```busybox```:
```
opkg install http://archive.openwrt.org/snapshots/trunk/ipq806x/generic/packages/base/libc_1.1.16-1_ipq806x.ipk libncursesw busybox
/data/lib/redirect_functions.sh
opkg install libc libncursesw busybox
```
### Mount points creation inside /data/ directory
Create mount points inside ```/data/``` directory:
```
mkdir /data/etc
mkdir /data/sys
mkdir /data/proc
mkdir /data/dev
mkdir /data/tmp
mkdir /data/var
```
If you need to add new mount point create its destination inside ```/data/``` directory:
```
mkdir /data/<new_mount_point>
```
### Startup mounts to /data/
Place ```data_mounts.sh``` script from this repo into ```/etc/init.d``` directory and run:
```
chmod +x /ect/init.d/data_mounts.sh
/ect/init.d/data_mounts.sh enable
```
Restart the router.

If the mount script does not start automatically on the boot run:
```
/ect/init.d/data_mounts.sh start
```
To unmount, if needed, run:
```
/ect/init.d/data_mounts.sh stop
```
If you added new mount points add them to ```/ect/init.d/data_mounts.sh```
### OpenWRT packages environment usage
To use packages installed from OpenWRT repositories with ```opkg``` can be run as follows:
```
chroot /data/ <the command>
```
### OpenWRT packages installation
OpenWRT packages can be installed from standard environment with ```opkg```:
```
opkg update
opkg install transmission-cli-openssl  # example
/data/lib/redirect_functions.sh
opkg install transmission-cli-openssl  # repeat after redirection
```
To clear opkg log from ```127``` errors (strongly not recommended):
```
rm /data/usr/lib/opkg/info/*
echo "" > /data/usr/lib/opkg/status
```
If you have problems with ```libc``` install it as follows:
```
opkg install http://archive.openwrt.org/snapshots/trunk/ipq806x/generic/packages/base/libc_1.1.16-1_ipq806x.ipk
/data/lib/redirect_functions.sh
opkg install libc
```
