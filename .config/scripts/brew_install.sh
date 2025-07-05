#!/bin/bash

# List of applications to install
apps=(
    # General CLIs
    "btop"
    "fzf"
    "ripgrep"
    "zoxide"
    "bat"
    "eza"
    "stow"
    # Workflow
    "neovim"
    "tmux"
    "yazi"
)

# Function to check if Homebrew is installed
check_brew() {
    if ! command -v brew &> /dev/null
    then
        echo "Homebrew not found. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Homebrew is already installed."
    fi
}

# Function to install applications
install_apps() {
    for app in "${apps[@]}"
    do
        if brew list "$app" &> /dev/null
        then
            echo "$app is already installed."
        else
            echo "Installing $app..."
            brew install "$app"
        fi
    done
}

# Run the functions
check_brew
install_apps

# exceptions

brew install --cask nikitabobko/tap/aerospace

echo "All applications are installed."

