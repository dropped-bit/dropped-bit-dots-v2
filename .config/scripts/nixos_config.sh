#!/usr/bin/env bash
#

if [ ! -d $HOME/.config/nixos ];
then
	mkdir $HOME/.config/nixos
fi

cp /etc/nixos/* $HOME/.config/nixos/
