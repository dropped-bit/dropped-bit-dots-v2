#!/usr/bin/env bash
#

ln -s /run/current-system/sw/share/X11/fonts ~/.local/share/fonts

flatpak --user override --filesystem=$HOME/.local/share/fonts
flatpak --user override --filesystem=$HOME/.icons
