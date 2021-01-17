#!/bin/sh /etc/rc.common

START=5
STOP=5

start() {
    export TERM=xterm

    mount --bind /tmp /data/tmp
    mount --bind /dev /data/dev
    mount --bind /proc /data/proc
    mount --bind /etc /data/etc
    mount --bind /sys /data/sys
    mount --bind /var /data/var
    mount --bind /userdisk/data /data/userdisk/data
}

stop() {
    umount /data/tmp
    umount /data/dev
    umount /data/proc
    umount /data/etc
    umount /data/sys
    umount /data/var
    umount /data/userdisk/data
}
