#!/bin/sh

TO_REPLACE=/lib/functions.sh
REPLACE_WITH=/data/lib/functions.sh

ls /data/usr/lib/opkg/info/*.postinst
ls /data/usr/lib/opkg/info/*.prerm
