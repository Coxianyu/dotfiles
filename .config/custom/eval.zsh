_evalcache navi widget zsh
# _evalcache zoxide init --cmd d zsh 
_evalcache direnv hook zsh
# _evalcache atuin init zsh

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
export HOST_FILE_PATH="${HOME}/.config/hostfile"
