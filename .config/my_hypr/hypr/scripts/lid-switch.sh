#!/bin/env bash

#CHECK IF EXTERNAL MONITOR IS PLUGGED IN
EXTERNAL_MONITOR=$(hyprctl monitors | grep "Monitor" | grep -v "eDP-1")

if [[ -n $EXTERNAL_MONITOR ]]; then
    hyprctl dispatch dpms toggle eDP-1
  for i in {1..6}; do
      hyprctl dispatch moveworkspacetomonitor "$i" DP-4
  done
else
    hyprlock
fi
