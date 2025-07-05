#!/bin/env bash

pkill ags
#TODO: MAKE IT WORK ON EXTERNAL MONITOR
ags -c $HOME/.config/ags/config.js



# if [ -z "$WAYBAR_PID"]; then # test if variable has a value -z and if not returns true
#     echo "Waybar is not running"
#     waybar &
#     exit 0
# else
#     echo "Stopping Waybar with PID: $WAYBAR_PID"
#     kill -TERM $WAYBAR_PID
# fi

