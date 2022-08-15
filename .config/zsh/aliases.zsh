alias s='source '"$ZDOTDIR"/.zshrc' && source '$HOME/.zshenv''

alias -g G="| grep --color=auto"
alias -g H="| head"
alias -g L="| less"
alias -g T="| tail"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias ghhome="cd '"$HOME"/src/github.com/${GITHUB_USER:-5n7}'"

[[ -d "$HOME/Downloads" ]] && alias dl="cd "$HOME/Downloads""
[[ -d "$HOME/Dropbox" ]] && alias dr="cd "$HOME/Dropbox""
[[ -d "$HOME/Pictures" ]] && alias pi="cd "$HOME/Pictures""
[[ -d "$HOME/sandbox" ]] && alias sb="cd "$HOME/sandbox""

alias cp="cp -ir"
alias mkdir="mkdir -p"
alias mv="mv -i"

if hash "docker" >/dev/null 2>&1; then
	alias d="docker"
	alias dim="docker images"
	alias dps="docker ps"
	alias dpsa="docker ps -a"

	if hash "fzf" >/dev/null 2>&1; then
		fzf::docker-remove-images() {
			local images="$(docker images | tail +2 | sort | fzf --multi | awk '{print $3}')"
			[[ -z "$images" ]] && return
			docker rmi $(echo "$images" | tr "\n" " ")
		}
		alias fzfdri="fzf::docker-remove-images"

		fzf::docker-run-container() {
			local image="$(docker images | tail +2 | sort | fzf | awk '{print $3}')"
			echo -n "command: "
			read command
			docker run -it --rm "$image" "$command"
		}
		alias fzfdrc="fzf::docker-run-container"
	fi
fi

if hash "docker-compose" >/dev/null 2>&1; then
	alias dc="docker-compose"
fi

if hash "lsd" >/dev/null 2>&1; then
	alias l="lsd -l"
	alias la="lsd -la"
	alias ls="lsd -l"
	alias tree="lsd --tree"
fi

if hash "git" >/dev/null 2>&1; then
	alias g="git"
	alias ga="git add"
	alias gb="git branch"
	alias gc="git commit"
	alias gco="git checkout"
	alias gcp="git cherry-pick"
	alias gd="git diff"
	alias gf="git fetch"
	alias gl="git log"
	alias gm="git merge"
	alias gp="git push"
	alias gpl="git pull"
	alias gplo="git pull origin"
	alias gpo="git push origin"
	alias gr="git rebase"
	alias gs="git status"
	alias gst="git stash"
	alias gsw="git switch"
fi

if hash "gitui" >/dev/null 2>&1; then
	alias gu="gitui"
fi

if hash "go" >/dev/null 2>&1; then
	gmi() {
		go mod init $(pwd | sed -e 's/.*github.com/github.com/g')
	}
fi

if hash "gomi" >/dev/null 2>&1; then
	alias rm="gomi"
fi

if hash "htop" >/dev/null 2>&1; then
	alias top="htop"
fi

if hash "kubectl" >/dev/null 2>&1; then
	alias k="kubectl"
fi

if hash "nvim" >/dev/null 2>&1; then
	alias v="nvim"
fi

if hash "poetry" >/dev/null 2>&1; then
	alias po="poetry run"
	alias pp="poetry run python"
	alias popup="poetry run pip install --upgrade pip"

	pdev() {
		poetry add -D black flake8 isort poethepoet pytest
	}
fi

if hash "python" >/dev/null 2>&1; then
	alias pipup="pip install --upgrade pip"
	alias py="python"
	alias venv="python -m venv .venv && source .venv/bin/activate"
fi

if hash "ranger" >/dev/null 2>&1; then
	alias rr="ranger"
fi

if hash "terraform" >/dev/null 2>&1; then
	alias tf="terraform"
fi

if hash "tmux" >/dev/null 2>&1; then
	alias tt="tmux attach -t default || tmux new -s default"
fi

mkcd() {
	mkdir -p $1
	cd $1
}

targz() {
	tar -cvzf $1.tar.gz $1
}
