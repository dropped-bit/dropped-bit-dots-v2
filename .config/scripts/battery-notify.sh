#!/bin/bash

# Set the threshold for battery level
THRESHOLD=20

# Get the current battery level
BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)

# Check if the battery level is below the threshold
if [ "$BATTERY_LEVEL" -le "$THRESHOLD" ]; then
    # Send a notification
    notify-send --urgency=critical "Low Battery" "Your battery is low (${BATTERY_LEVEL}%)!"
fi
