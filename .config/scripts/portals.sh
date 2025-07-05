#!/usr/bin/env bash

# this script doesn't really work for nixos
sleep 1
killall -e xdg-desktop-portal-gnome
killall -e xdg-desktop-portal-gtk
killall -e xdg-desktop-portal-hyprland
killall -e xdg-desktop-portal-wlr
killall xdg-desktop-portal
/usr/lib/xdg-desktop-portal-hyprland &
sleep 2
/usr/lib/xdg-desktop-portal &
#
