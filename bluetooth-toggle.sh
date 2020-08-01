#!/bin/bash
sleep 1
bstatus=$(rfkill |grep 'tpacpi_bluetooth_sw' |awk '{print $4}')

function bt_start {
	sudo systemctl start bluetooth > /dev/null 2>&1
}

function bt_off {
	sudo systemctl stop bluetooth > /dev/null 2>&1
}

icon=
color="#1AE300"

if [ "$bt_status" = 'blocked' ]; then
	bt_off
    icon=
	color="#969997"
	echo "$icon Off\n"
	echo $color
else
    bt_start
	echo "$icon On\n"
	echo $color
fi
#[ $bstatus = "blocked" ] && bt_off || bt_start

