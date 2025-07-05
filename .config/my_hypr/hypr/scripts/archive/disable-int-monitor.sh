#!/bin/env bash

# CHECK IF MONITORS ARE ENABLED
EXTERNAL_MONITOR=$(hyprctl monitors | grep -v "eDP-1" | grep "active")
INTERNAL_MONITOR=$(hyprctl monitors | grep "eDP-1" | grep "active")

# Path to the monitor config file
MONITOR_CONFIG=$HOME/.config/hypr/conf/monitor.conf

if [[ -n $EXTERNAL_MONITOR && -n $INTERNAL_MONITOR ]]; then
    # Both external and internal monitors are active
    echo "Both external and internal monitors are active"
    # Add logic to handle this case (e.g., updating monitor config)
elif [[ -n $EXTERNAL_MONITOR && -z $INTERNAL_MONITOR ]]; then
    # External monitor is active, internal monitor is disabled
    echo "External monitor is active, internal monitor is disabled"
    # Update the config to reflect this
    # echo "monitor=eDP-1,disabled" > $MONITOR_CONFIG
elif [[ -z $EXTERNAL_MONITOR && -n $INTERNAL_MONITOR ]]; then
    # Internal monitor is active, external monitor is not connected
    echo "Internal monitor is active, external monitor is not connected"
    # Update the config to reflect this
else
    # Neither monitor is active
    echo "No monitors are active"
fi
