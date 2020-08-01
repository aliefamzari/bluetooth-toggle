#!/usr/bin/env bash

#Add this line to your i3 config file
#       bindsym XF86Bluetooth exec --no-startup-id /path/of/this/script/bluetooth-toggle.sh && $refresh_i3status

#Add this line to your i3block config
#       [bluetooth]
#       command=/path/of/this/script/bluetooth-toggle.sh
#       interval=once
#       signal=10
# Icon font is fontawesome 5

sleep 1
#check bluetooth status. Expected value is 'blocked'
bt_status=$(rfkill |grep 'tpacpi_bluetooth_sw' |awk '{print $4}')

# Function to start/stop bluetooth
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
	echo -e "$icon Off\n"
	echo $color
else
    bt_start
	echo -e "$icon On\n"
	echo $color
fi

#Send signal to i3blocks to refresh
pkill -SIGRTMIN+10 i3blocks

#[ $bstatus = "blocked" ] && bt_off || bt_start

