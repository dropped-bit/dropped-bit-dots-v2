#!/usr/bin/env bash

conf_file="$HOME/.config/hypr/conf/toggle_internal_monitor.conf"

if hyprctl monitors | grep "DP-4"; then
    echo "monitor is connected"
    sed -i '1s/#//' $conf_file
else
    echo "monitor is not connected, exiting"
    sed -i '1s/^/#/' $conf_file
fi
