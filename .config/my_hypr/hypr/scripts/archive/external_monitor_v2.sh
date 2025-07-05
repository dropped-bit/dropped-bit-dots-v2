#!/bin/bash

sleep 6 
# This relies on udev rule that is found here /etc/udev/rules.d/99-monitor-hotplug.rules
# DO NOT USE AS THIS IS HANDLED BY monitor_switch.sh

connected_monitors=$(grep -w connected /sys/class/drm/*/status | wc -l)
log_file="/home/holmes/.tmp/external_monitor"
if [ "$connected_monitors" -gt 1 ]; then
	echo "$(date): external monitor was connected" >> $log_file
	for i in {1..6}; do
		hyprctl dispatch moveworkspacetomonitor "$i" DP-4 >> $log_file
	done
elif [ "$connected_monitors" -eq 1 ]; then
	echo "$(date): only internal monitor active" >> $log_file
	for i in {1..6}; do
		hyprctl dispatch moveworkspacetomonitor "$i" eDP-1 >> $log_file
	done
else
	echo "$(date): don't know what happend" >> $log_file
fi

