#!/bin/env bash
#
# Read this article: htttps://linuxiac.com/nvidia-with-wayland-on-arch-setup-guide"
grpahic_packages=(
	"nvidia"
	"nvidia-utils"
	"lib32-nvidia-utils"
	"vulkan-tools"
	)

# Update the system adn install the packages, --needed ensures that installed packages aren't reinstalled
sudo pacman -S --needed "${graphic_packages[@]}"

sleep 4
echo "here comes instructions for manual part"
sleep 4

# Copy modprobe for drm
nvidia_graphics="/etc/modprobe.d/nvidia_graphics.conf"
if [ ! -f "$nvidia_graphics" ]; then
	touch /etc/modprobe.d/nvidia_graphics.conf
else
	echo "modprobe file already exists"
fi

echo "options nvidia_drm modeset=1 fbdev=1" >> /etc/modprobe.d/nvidia_graphics.conf

sleep 4

echo "Please edit /etc/mkinitcpio.conf"
echo "nvidia nvidia_modset nvidia_uvm nvidia_drm" >> /etc/mkinitcpio.conf
echo "remove kms from HOOKS array"
echo "then run sudo mkinitcpio -P"

yay_graphic_packages=(
	"envycontrol"
	)


