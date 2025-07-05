connected_monitors=$(grep -w connected /sys/class/drm/*/status | wc -l)
log_file="/home/holmes/.tmp/external_monitor"
if [ "$connected_monitors" -gt 1 ]; then
	pkill ags
	ags -c $HOME/.config/ags/config-ext-monitor.js
elif [ "$connected_monitors" -eq 1 ]; then
	pkill ags
	ags -c $HOME/.config/ags/config.js
else
	echo "$(date): don't know what happend" >> $log_file
fi

