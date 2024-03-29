bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line

bindkey -v
bindkey -M viins "jj" vi-cmd-mode

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^e" edit-command-line

fzf::cd() {
	local dir=$(fd --hidden --type directory | fzf --preview "tree {}")
	[[ -n "$dir" ]] && cd $dir
}
zle -N fzf::cd
bindkey "^T" fzf::cd

fzf::gcloud-config() {
	local config=$(gcloud config configurations list --format='table(is_active.yesno(yes="[x]",no="[_]"),name,properties.core.account,properties.core.project.yesno(no="(unset)"))' | fzf --header-lines=1 | awk '{print $2}')
	[[ -n "$config" ]] && gcloud config configurations activate "$config"
}

fzf::cd-ghq() {
	local dir=$(ghq list -p | fzf --preview "glow --style dark {}/README.*")
	[[ -n "$dir" ]] && cd "$dir"
}
zle -N fzf::cd-ghq
bindkey "^G" fzf::cd-ghq

fzf::git-checkout-branch() {
	forgit::checkout::branch
}
zle -N fzf::git-checkout-branch
bindkey "^B" fzf::git-checkout-branch

fzf::history() {
	BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER")
	CURSOR=$#BUFFER
}
zle -N fzf::history
bindkey "^H" fzf::history

fzf::kill() {
	local pid=$(ps -fu "$UID" | sed 1d | fzf -m | awk '{print $2}')
	[[ -n "$pid" ]] && echo $pid | xargs kill -${1:-9}
}
zle -N fzf::kill
bindkey "^K" fzf::kill

fzf::pushd() {
  local pushd_number=$(dirs -v | fzf | perl -anE 'say $F[0]')
  [[ -n "$pushd_number" ]] && pushd +$pushd_number
}
zle -N fzf::pushd
bindkey "^J" fzf::pushd

fzf::open() {
	local file=$(fd --hidden --type file | fzf --preview "bat --color always --style header {}")
	[[ -n "$file" ]] && $EDITOR $file
}
zle -N fzf::open
bindkey "^O" fzf::open
