# ------------------------------------------------------
# Check if yay is installed
# ------------------------------------------------------
if sudo pacman -Qs yay > /dev/null ; then
    echo ":: yay is already installed!"
else
    echo ":: yay is not installed. Starting the installation!"
	mkdir $HOME/Builds
    git clone https://aur.archlinux.org/yay-git.git $HOME/Builds/yay-git
    cd $HOME/Builds/yay-git
    makepkg -si
    echo ":: yay has been installed successfully."
fi
echo ""
