#!/bin/bash

# Define the target file path
FILE="$HOME/.config/hypr/conf/monitor.conf"

# Define the content to be written into the file
CONTENT="monitor=eDP-1,3456x2160,-1728x400,2
monitor=DP-4,3840x2160@60,0x0,1.5"

# Ensure the directory exists
mkdir -p "$(dirname "$FILE")"

# Write the content to the file (overwriting any existing content)
echo "$CONTENT" > "$FILE"

echo "Content written to $FILE"

# echo "monitor=eDP-1, disable" > "$HOME/dropped-bit-dots/.config/hypr/conf/monitors/monitor-int.conf" 
