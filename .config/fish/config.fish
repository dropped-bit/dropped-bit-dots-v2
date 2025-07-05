if status is-interactive
    # Commands to run in interactive sessions can go here
end

# cat $HOME/.cache/wal/sequences &
starship init fish | source

# exa
alias ls='exa --color=always --icons --long'
alias ll='exa --color=always --icons --long --all'
alias tree='exa --color=always --icons --long --all --tree --level=3'

# bat

alias cat='bat'

# fast fetch
alias os='fastfetch -c $HOME/.config/fastfetch/fastfetch.jsonc'

# ripgrep
alias grep='rg'

# zoxide
zoxide init fish --cmd cd | source

# fzf
# C-r searches command history
# A-c cd via fzf
alias fo='find . | fzf --preview \'bat --style=numbers --color=always {}\' | xargs nvim'
alias fcd='cd $(find . -type d -print | fzf)'
alias ff='find . | fzf'

# go to
alias nvconf="cd $HOME/.config/nvim && nvim"
alias dots="cd $HOME/dropped-bit-dots/.config/ && nvim"

# stupid stuff
alias python="python3"
alias cc='clear'
alias grep='grep --color=auto'
alias kde='$HOME/.config/scripts/launch_kde.sh'

set PATH $HOME/.cargo/bin $PATH
set fish_greeting
