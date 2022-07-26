# basic
export EDITOR="nvim"
export LANG="en_US.UTF-8"

# XDG
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export PATH="$HOME/.local/bin:$PATH"

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# asdf
export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# Go
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Python
export PATH="$HOME/.poetry/bin:$PATH"

# dotfiles
export DOTFILES="$HOME/src/github.com/skmatz/dotfiles"
export PATH="$DOTFILES/bin:$PATH"

# ghq
export GHQ_ROOT="$HOME/src"

# Zsh
export HISTFILE="XDG_STATE_HOME/zsh/history"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Zsh-z
export _Z_DATA="$XDG_DATA_HOME"/z

# local
[[ -f "$HOME/.zshenv.local" ]] && source "$HOME/.zshenv.local"
