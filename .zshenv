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
export HOMEBREW_NO_INSTALL_FROM_API=1
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:$PATH"

# asdf
export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# dotfiles
export DOTFILES="$HOME/src/github.com/5n7/dotfiles"
export PATH="$DOTFILES/bin:$PATH"

# ghq
export GHQ_ROOT="$HOME/src"

# Go
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$GOPATH/bin:$PATH"

# kubectl-krew
export PATH="$HOME/.krew/bin:$PATH"

# Python
export PATH="$HOME/.poetry/bin:$PATH"

# Zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# local
[[ -f "$HOME/.zshenv.local" ]] && source "$HOME/.zshenv.local"
