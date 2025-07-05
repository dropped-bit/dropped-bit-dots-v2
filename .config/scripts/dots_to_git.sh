#!/bin/env bash

alias config='/usr/bin/git --git-dir=$HOME/Builds/dropped-bit-dots --work-tree=$HOME'

root_dir="$HOME/.config"

config_array=(
    "$HOME/.zsh_aliases"
    "$HOME/.zshrc"
    "$HOME/.bashrc"
    "$root_dir/alacritty/*"
    "$root_dir/chrome-flags.conf"
    "$root_dir/fastfetch/*"
    "$root_dir/fish/*"
    "$root_dir/holmes_iterm_profile.json"
    "$root_dir/hypr/*"
    "$root_dir/mako/*"
    "$root_dir/neofetch/config.conf"
    "$root_dir/scripts/*"
    "$root_dir/skhd/*"
    "$root_dir/starship.toml"
    "$root_dir/swaylock/*"
    "$root_dir/tmux/tmux.conf"
    "$root_dir/wallpapers/*"
    "$root_dir/waybar/*"
    "$root_dir/wofi/*"
    "$root_dir/xremap/*"
    "$root_dir/yabai/yabairc"
    )

for i in "${config_array[@]}"
do
    /usr/bin/git --git-dir=$HOME/Builds/dropped-bit-dots --work-tree=$HOME add $i
    # echo $i
done
