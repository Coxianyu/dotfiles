export PATH=${PATH}:${HOME}/.local/bin
alias gitc='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
alias install="~/.config/install.sh"
if test -f "${HOME}/.cargo/env";then
    . "$HOME/.cargo/env"
fi
