if hash "brew" >/dev/null 2>&1; then
	fpath+="$(brew --prefix)/share/zsh/site-functions"
	autoload -Uz compinit && compinit
fi

if hash "asdf" >/dev/null 2>&1; then
	. $(brew --prefix asdf)/libexec/asdf.sh
fi

if hash "direnv" >/dev/null 2>&1; then
	eval "$(direnv hook zsh)"
fi

# if [[ -n $(brew --prefix pure) ]]; then
# 	autoload -U promptinit && promptinit && prompt pure
# fi

if hash "starship" >/dev/null 2>&1; then
	eval "$(starship init zsh)"
fi
