[[ ! -d "$XDG_STATE_HOME/zsh" ]] && mkdir -p "$XDG_STATE_HOME/zsh"
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=1000000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history
setopt interactive_comments
setopt share_history
