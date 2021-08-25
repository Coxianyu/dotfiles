zmodload zsh/zprof
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
### z.lua {{{
# 识别根目录的文件
export _ZL_ROOT_MARKERS=".git,.svn,.hg,.root,package.json"
export _ZL_CMD='j'
# }}}
# P10K{{{
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# }}}
### fzf {{{
# 显示隐藏文件 排除 .git 文件夹
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
# 设置颜色显示
#export FZF_DEFAULT_COMMAND="fd --type file --color=always"
# export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'batcat --color=always --style=header,grid --line-range :300 {}'"
export FZF_DEFAULT_OPTS="--ansi"
#}}}
# zinit {{{
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)

zinit light  zinit-zsh/z-a-bin-gem-node

zinit light-mode lucid wait="0" for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl 

zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k


zinit ice depth="1"
zinit light jeffreytse/zsh-vi-mode


zinit  light-mode lucid wait="0"  for\
    "Aloxaf/fzf-tab" \
    "zdharma/fast-syntax-highlighting" \
    atload='_zsh_autosuggest_start' "zsh-users/zsh-autosuggestions" \
    "zdharma/history-search-multi-word" \
    "mroth/evalcache" \
    "djui/alias-tips" \
    "urbainvaes/fzf-marks" \
    "kazhala/dotbare" \
    "changyuheng/fz" \
    "https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh "\
    "OMZ::plugins/zsh_reload/zsh_reload.plugin.zsh"\
    "OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh"\
    "OMZ::plugins/safe-paste/safe-paste.plugin.zsh" \
    "OMZ::plugins/copyfile/copyfile.plugin.zsh"\
    "wfxr/forgit"\
    "skywind3000/z.lua"\
    "OMZ::plugins/git/git.plugin.zsh"\
    "Czocher/gpg-crypt" \
    "bobthecow/git-flow-completion" \
    "supercrabtree/k" \
    "bartboy011/cd-reminder" \
    "StackExchange/blackbox"\
    "rtuin/zsh-case"


zinit ice lucid wait="0"
zinit snippet $(echo "${HOME}/.config/custom/eval.zsh")

zinit ice lucid depth"1" wait="0"
zinit snippet OMZ::plugins/extract

zinit ice blockf lucid wait="0" atload='zpcompinit;zpcdreplay'
zinit light zsh-users/zsh-completions

zinit as="null" wait="1" lucid from="gh-r" for \
    mv="*/exa  -> exa"       sbin                             ogham/exa \
    mv="*/rg   -> rg"        sbin                             BurntSushi/ripgrep \
    mv="fd*    -> fd"        sbin="fd/fd"                     @sharkdp/fd \
    mv="delta* -> delta"     sbin="delta/delta"               dandavison/delta\
    mv="bat*   -> bat"       sbin="bat/bat"                   @sharkdp/bat \
                             sbin                             jesseduffield/lazygit\
                             sbin                             denisidoro/navi \
                             sbin                             junegunn/fzf 

## End of Zinit's installer chunk
# }}}
## export {{{
export DOTBARE_DIR="${HOME}/.myconfig"
export DOTBARE_TREE="${HOME}"
export EDITOR='nvim'
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GPG_TTY=$(tty)
export BIN="${HOME}/.local/bin"
#}}}
###alias {{{
if [ -x "$(command -v exa)" ]; then
    alias ls="exa"
    alias la="exa --long --all --group"
fi
if [ -x "$(command -v fd)" ]; then
    alias find="fd"
fi
if [ -x "$(command -v grep)" ]; then
    alias grep="rg"
fi
if [ -x "$(command -v bat)" ]; then
    alias cat="bat"
fi
if [ -x "$(command -v nvim)" ]; then
    alias vim="nvim"
fi
# jf foo 使用 fzf 交互选择
alias jf='j -I'
# jb foo
alias jb='j -b'
# jbf foo 使用 fzf 选择父目录
alias jbf='j -b -I'
# jh  使用 fzf 选择最近的 10 条路径
alias jh='j -I -t .'
# jc 跳转到当前路径下的子目录
alias jc='j -c -I'

alias batcat='bat'
alias gitc='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
alias config='dotbare'
alias zshconfig="$EDITOR ~/.zshrc"
alias vimconfig="$EDITOR ~/.config/nvim/init.vim"
alias exa='exa --icons'
alias install='nvim ~/.config/install.sh'
alias prz='proxychains -q zsh'
alias pr='proxychains -q'
function _z() { _zlua "$@"; }
function cg (){
    repo=$(gita ls | tr ' ' '\n' | fzf)
    if test -n "$repo";then
        cd $(gita ls "$repo")
    fi
}
function cde(){
    if [ $1 ];then
        dir=$1
    else
        dir=.
    fi
    dir=$(fd . --type=d --full-path "$dir" --color=always |fzf --preview 'exa --icons  {}')
    cd $dir
   
}
function ef(){
    if [ $1 ];then
        dir=$1
    else
        dir=.
    fi
    file=$(fd . --type=f --full-path "$dir" --color=always -H -E ".git"  -E ".vim"| fzf --ansi --preview-window 'right:60%' --preview 'cat --color=always --style=header,grid --line-range :300 {}')
 if test -n "$file";then
     vim $file
    fi
}
get_tmux(){
    name=$(tmux ls | cut -d '-' -f 1|fzf)
    tmux a -t $name
}
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#}}} 
