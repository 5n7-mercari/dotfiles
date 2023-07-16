#!/usr/bin/env bash

DOTFILES_DIR="$HOME/src/github.com/5n7-mercari/dotfiles"
XDG_CONFIG_HOME="$HOME/.config"

mkdir -p "$XDG_CONFIG_HOME"

print() {
	echo -e "\033[36m$*\033[0m"
}

print "setting up symbolic links..."
ln -fs "$DOTFILES_DIR"/.Brewfile "$HOME"/.Brewfile
ln -fs "$DOTFILES_DIR"/.zshenv "$HOME"/.zshenv
ln -fs "$DOTFILES_DIR"/.config/alacritty "$XDG_CONFIG_HOME"/alacritty
ln -fs "$DOTFILES_DIR"/.config/bat "$XDG_CONFIG_HOME"/bat
ln -fs "$DOTFILES_DIR"/.config/fd "$XDG_CONFIG_HOME"/fd
ln -fs "$DOTFILES_DIR"/.config/git "$XDG_CONFIG_HOME"/git
ln -fs "$DOTFILES_DIR"/.config/nvim "$XDG_CONFIG_HOME"/nvim
ln -fs "$DOTFILES_DIR"/.config/sheldon "$XDG_CONFIG_HOME"/sheldon
ln -fs "$DOTFILES_DIR"/.config/starship.toml "$XDG_CONFIG_HOME"/starship.toml
ln -fs "$DOTFILES_DIR"/.config/tmux "$XDG_CONFIG_HOME"/tmux
ln -fs "$DOTFILES_DIR"/.config/wezxterm "$XDG_CONFIG_HOME"/wezterm
ln -fs "$DOTFILES_DIR"/.config/zsh "$XDG_CONFIG_HOME"/zsh

print "installing Rosetta 2..."
softwareupdate --install-rosetta

print "installing Homebrew..."
# TODO: Add scripts to install Homebrew.

print "installing Homebrew packages..."
# brew bundle install

print "installing programming languages..."
# asdf install golang X.Y.Z

print "setting up Tmux..."
git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm && tmux source ~/.config/tmux/tmux.conf && ~/.config/tmux/plugins/tpm/scripts/install_plugins.sh
