#!/bin/env bash
set -euo pipefail

echo "🛠️  Setting up Kanata with uinput access..."

# 1. Create uinput group if missing
if ! getent group uinput > /dev/null; then
    echo "➕ Creating 'uinput' group..."
    sudo groupadd uinput
else
    echo "✅ 'uinput' group already exists"
fi

# 2. Add current user to uinput group
if id -nG "$USER" | grep -qw uinput; then
    echo "✅ User '$USER' already in 'uinput' group"
else
    echo "➕ Adding user '$USER' to 'uinput' group..."
    sudo usermod -aG uinput "$USER"
fi

# 3. Load uinput kernel module now and on boot
echo "📦 Ensuring uinput module is loaded..."
sudo modprobe uinput
echo uinput | sudo tee /etc/modules-load.d/uinput.conf > /dev/null

# 4. Create udev rule if it doesn't exist or differs
UDEV_RULE='/etc/udev/rules.d/99-uinput.rules'
UDEV_CONTENT='KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"'

if [[ -f "$UDEV_RULE" && "$(cat "$UDEV_RULE")" == "$UDEV_CONTENT" ]]; then
    echo "✅ udev rule already exists and is correct"
else
    echo "⚙️  Writing udev rule to $UDEV_RULE"
    echo "$UDEV_CONTENT" | sudo tee "$UDEV_RULE" > /dev/null
    sudo udevadm control --reload-rules
    sudo udevadm trigger
fi

# 5. Reload systemd user units
echo "🔄 Reloading user systemd daemon..."
systemctl --user daemon-reexec
systemctl --user daemon-reload

# 6. Enable and start kanata.service
echo "🚀 Enabling and starting Kanata user service..."
systemctl --user enable --now kanata.service

# 7. Check status
echo "📋 Kanata service status:"
systemctl --user status kanata.service --no-pager
