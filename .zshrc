# If you're using macOS, you'll want this enabled
if [[ -f "/opt/homebrew/bin/brew" ]] then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Source Cargo
export PATH="$PATH:$HOME/.cargo"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"
# Add in Powerlevel10k
# zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
# zinit snippet OMZP::docker

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Enable VIM mode:
# set -o vi

# Aliases
alias vim='nvim'
alias c='clear'
alias ls='eza --color=always --icons --long'
alias ll='eza --color=always --icons --long --all'
alias tree='eza --color=always --icons --long --all --tree --level=3'
# alias cat='bat'
alias os='fastfetch -c $HOME/.config/fastfetch/fastfetch.jsonc'
alias nvex='NVIM_APPNAME=nvex nvim'
alias dropped-arch='nvex $HOME/dropped-bit-dots/dropped-distros/arch/arch-install.sh'
alias dropped-update='$HOME/dropped-bit-dots/dropped-distros/arch/arch-install.sh'
alias zd='ZED_DEVICE_ID=0xa7a0 /home/holmes/.local/zed.app/bin/zed'

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa --color=always --icons $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa --color=always --icons $realpath'


# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"


# Set Starship Promt
eval "$(starship init zsh)"

# Set Oh-My-Posh Prompt
# eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# Source zsh.alias
# source $HOME/.zsh_aliases

# Interactive fish
# exec fish
alias kde='$HOME/.config/scripts/launch_kde.sh'
export GTK_THEME=adw-gtk3-dark:dark
alias hyp='Hyprland'

# ENV for Nix Config
export NIX_CONF_DIR=/Users/holmes_a9/.config/nix

# bun completions
[ -s "/home/holmes/.bun/_bun" ] && source "/home/holmes/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# go
export "PATH=$PATH:$HOME/.local/opt/go/bin"
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

source $HOME/.api/avante_anthropic_api
