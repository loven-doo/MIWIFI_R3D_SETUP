#!/bin/sh

TO_REPLACE=/lib/functions.sh
REPLACE_WITH=/data/lib/functions.sh

for FPATH in $(ls -d /data/usr/lib/opkg/info/*.postinst)
do
    sed -i s#$TO_REPLACE#$REPLACE_WITH#g $FPATH
done

for FPATH in $(ls -d /data/usr/lib/opkg/info/*.prerm)
do
    sed -i s#$TO_REPLACE#$REPLACE_WITH#g $FPATH
done
