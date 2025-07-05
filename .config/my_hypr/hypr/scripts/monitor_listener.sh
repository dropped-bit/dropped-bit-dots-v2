#!/bin/env bash

# set -x

handle() {
  case $1 in
    monitoradded*)
      pkill ags
      $(ags -c $HOME/.config/ags/config-ext-monitor.js 3>&- > /dev/null 2>&1 &)
      notify-send "Monitor Connected"
      for i in {1..6}; do
	  hyprctl dispatch moveworkspacetomonitor "$i" DP-4 >> $log_file
      done
      ;;
    monitorremoved*)
      pkill ags
      $(ags -c $HOME/.config/ags/config.js 3>&- > /dev/null 2>&1 &)
      notify-send "Monitor Disconnected"
      for i in {1..6}; do
	  hyprctl dispatch moveworkspacetomonitor "$i" eDP-1 >> $log_file
      done
      ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
# In the autostart section

