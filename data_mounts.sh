#!/bin/sh /etc/rc.common

start() {
    export TERM=xterm

    mount --bind /tmp /data/tmp
    mount --bind /dev /data/dev
    mount --bind /proc /data/proc
    mount --bind /etc /data/etc
    mount --bind /sys /data/sys
    mount --bind /var /data/var
}
