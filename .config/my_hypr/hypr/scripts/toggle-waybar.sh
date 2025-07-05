APP="waybar"

# PID=$(pgrep $APP)
# check if hyprctl clients is running in full screen

# status_check

# Toggle waybar with full screen
# result="$(hyprctl activewindow -j | jq -r ".fullscreen")"
# echo $result
# if [ "$(hyprctl activewindow -j | jq -r ".fullscreen")" = "true" ];
# then
#     echo "Full screen mode active, killing waybar"
#     pkill -f waybar
# else
#     echo "Full screen mode not active, starting waybar"
#     waybar
# fi
#
#
# Simple TOGGLE waybar
#
WAYBAR_PID=$(pgrep -x waybar)

if [ -z "$WAYBAR_PID"]; then # test if variable has a value -z and if not returns true
    echo "Waybar is not running"
    waybar &
    exit 0
else
    echo "Stopping Waybar with PID: $WAYBAR_PID"
    kill -TERM $WAYBAR_PID
fi

