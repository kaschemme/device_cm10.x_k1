#!/system/bin/sh
#
# Recovery Update
# 
# created by Kascheme
# date: 2013-07-17
# description: This init.d script will upgrade the recovery to the new version and delete it himself
#
dd if=/system/recovery.img of=/dev/block/mmcblk0p1
