# MIWIFI_R3D_SETUP
Steps to fix opkg package manager on XIAOMI Mi Router HD (R3D)  
If you have an error "'xterm-256color': unknown terminal type." run the following command:
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
Do not care about error 127 that occurs during installation process. 
```
opkg install libc libncursesw busybox opkg
```

### Mount points creation inside /data/ directory
```
mkdir /data/etc
mkdir /data/sys
mkdir /data/proc
mkdir /data/dev
mkdir /data/tmp
mkdir /data/var
```

### Startup mounts to /data/
Place ```data_mounts.sh``` script from this repo into ```/etc/init.d``` directory and run:
```
chmod +x /ect/init.d/data_mounts.sh
```
Restart the router

### OpenWRT packages environment usage
To use packages installed from OpenWRT repositories with ```opkg``` can be run as follows:
```
chroot /data/ htop
```

### OpenWRT packages installation
OpenWRT packages can be installed from standard environment with ```opkg```:
```
opkg install transmission-cli-openssl
```
or directly from the ```chroot``` environment:
```
chroot /data/ opkg update && opkg install transmission-cli-openssl
```
Some packages may require imposible dependencies (for example, newer kernel version) - 
try to use ```--force-depends``` option for ```opkg```
