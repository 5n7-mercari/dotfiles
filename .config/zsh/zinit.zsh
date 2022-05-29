ZINIT_PATH="$XDG_DATA_HOME/zinit/zinit.git/zinit.zsh"

if [[ ! -f "$ZINIT_PATH" ]]; then
  NO_EDIT=1 NO_TUTORIAL=1 sh -c "$(curl -L https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi

source "$ZINIT_PATH"

zinit ice blockf depth"1" lucid wait
zinit light-mode for \
  agkozak/zsh-z \
  Aloxaf/fzf-tab \
  Bhupesh-V/ugit \
  darvid/zsh-poetry \
  mollifier/cd-gitroot \
  NullSense/fuzzy-sys \
  reegnz/jq-zsh-plugin \
  wfxr/forgit \
  zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" zsh-users/zsh-autosuggestions
