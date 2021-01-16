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
Do not care about error 127 that occurs during installation process. 
```
opkg install libc libncursesw busybox opkg
```  
Place ```functions.sh``` script from this repo into ```/data/lib```

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
If you added new mount points add them to ```/ect/init.d/data_mounts.sh```

### OpenWRT packages environment usage
Packages installed from OpenWRT repositories with ```opkg``` can be run as follows:
```
chroot /data/ <the command>
```
or you can enter the environment:
```
chroot /data
```
then run ```<the command>```

### OpenWRT packages installation
Enter the environment:
```
chroot /data
```
or use the environment prefix before each your command  
OpenWRT packages can be installed from standard environment with ```opkg```:
```
opkg update
opkg install transmission-cli-openssl
```
If you have problems with libc install it as follows:
```
opkg install http://archive.openwrt.org/snapshots/trunk/ipq806x/generic/packages/base/libc_1.1.16-1_ipq806x.ipk
```
