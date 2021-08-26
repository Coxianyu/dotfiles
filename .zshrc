zmodload zsh/zprof
# history {{{
#
# Sets history options.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

HISTFILE="${HOME}/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
# }}}
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

# 安装 poetry 的补全 
# zplugin ice as"completion" atclone"python ./get-poetry.py; \
#     $HOME/.poetry/bin/poetry completions zsh > _poetry" \
#     atpull"%atclone" atload'PATH+=:$HOME/.poetry/bin'
# zplugin light sdispater/poetry


zinit ice id-as="z-bin"
zinit light  zinit-zsh/z-a-bin-gem-node

zinit ice id-as="z-readurl"
zinit light  zinit-zsh/z-a-readurl

# 安装 lua 环境
zinit id-as="lua" as='readurl|null' mv="%ID% -> lua.tar.gz"\
        atclone="ziextract --move lua.tar.gz;" make="all test" atpull="%atclone" \
        fbin="lua" dlink="/lua/lua/archive/refs/tags/v5.4.3.tar.gz" for \
        "https://github.com/lua/lua/releases"
# 编译 gtags
# zinit id-as="gtags" as="readurl|null" mv="%ID% -> global.tar.gz" atclone="ziextract --move global.tar.gz;./configure --prefix=${LOCAL};make;make install"\
#     dlink='!global-%VERSION%.tar.gz~%global-6.6.tar.gz%'\
#     for "https://ftp.gnu.org/pub/gnu/global/"

zinit light-mode   for \
id-as='z-a-rust'    zinit-zsh/z-a-rust \
id-as='z-a-monitor'    zinit-zsh/z-a-as-monitor \
id-as='z-a-patch'    zinit-zsh/z-a-patch-dl 

zinit ice depth"1" id-as='pw10k'
zinit light romkatv/powerlevel10k


zinit ice depth="1" id-as="vi-mode"
zinit light jeffreytse/zsh-vi-mode


zinit  light-mode lucid wait="0"  for\
    id-as='fzf-tab'             "Aloxaf/fzf-tab" \
    id-as='syntax'              "zdharma/fast-syntax-highlighting" \
    id-as='autosuggestions'     atload='_zsh_autosuggest_start' "zsh-users/zsh-autosuggestions" \
    id-as='search-command'      "zdharma/history-search-multi-word" \
    id-as='evalcache'           "mroth/evalcache" \
    id-as='alias-tips'          "djui/alias-tips" \
    id-as='fzf-marks'           "urbainvaes/fzf-marks" \
    id-as='dotbare'             "kazhala/dotbare" \
    id-as='fz'                  "changyuheng/fz" \
    id-as='fzf-completion'      "https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh "\
    id-as='zsh_src'             "OMZ::plugins/zsh_reload/zsh_reload.plugin.zsh"\
    id-as='color-man-page'      "OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh"\
    id-as='safe-paste'          "OMZ::plugins/safe-paste/safe-paste.plugin.zsh" \
    id-as='copyfile'            "OMZ::plugins/copyfile/copyfile.plugin.zsh"\
    id-as='z.lua'               "skywind3000/z.lua"\
    id-as='git-alias'           atload="unalias gra glo ga  gd grh gcf gcb gco gss gclean grb" "OMZ::plugins/git/git.plugin.zsh"\
    id-as='forgit'              "wfxr/forgit"\
    id-as='gpg-crypt'           "Czocher/gpg-crypt" \
    id-as='git-flow-completion' "bobthecow/git-flow-completion" \
    id-as='k'                   "supercrabtree/k" \
    id-as='cd-reminder'         "bartboy011/cd-reminder" \
    id-as='blackbox'            "StackExchange/blackbox"\
    id-as='zsh-case'            "rtuin/zsh-case"


zinit ice lucid wait="0" id-as="eval.zsh"
zinit snippet $(echo "${HOME}/.config/custom/eval.zsh")

zinit ice lucid depth"1" wait="0" id-as="extract"
zinit snippet OMZ::plugins/extract

zinit ice blockf lucid wait="0" atload='zpcompinit;zpcdreplay' id-as="zsh-completions"
zinit light zsh-users/zsh-completions

zinit ice wait="1" lucid id-as="autopair"
zinit load hlissner/zsh-autopair

zinit  as="null" wait="1" lucid from="gh-r" for \
    id-as="delta"           mv="delta* -> delta"     sbin="delta/delta"               dandavison/delta\
    id-as="lazygit"                                  sbin                             jesseduffield/lazygit\
    id-as="navi"                                     sbin                             denisidoro/navi\
    id-as="fzf"                                      sbin                             junegunn/fzf 

# # lua
# zinit ice as="null" from="https://www.lua.org/ftp/lua-5.4.3.tar.gz" atclone="make all test" mv="lua* -> lua" fbin="src/lua"
# zinit load "https://www.lua.org/ftp/lua-5.4.3.tar.gz"

zinit ice wait="1" lucid atclone="./configure --prefix=${ZPFX} --sysconfdir=${HOME}/.config;make && make install-config" atpull="%atclone" id-as="proxychains-ng"
zinit light rofl0r/proxychains-ng

zinit ice wait="1" lucid from="gh-r" mv="ri* -> rg" sbin="rg/rg" atclone="chown ${USERNAME}:${USERNAME} rg/complete/*" atpull="%atclone" id-as="rg"
zinit light BurntSushi/ripgrep

zinit ice wait="1" lucid from="gh-r" mv="fd* -> fd" sbin="fd/fd" atclone="chown ${USERNAME}:${USERNAME} fd/autocomplete/*" atpull="%atclone" id-as="fd"
zinit light @sharkdp/fd

zinit ice wait="1" lucid from="gh-r" mv="bat* -> bat" sbin="bat/bat"   atclone="mv bat/autocomplete/bat.zsh bat/autocomplete/_bat;chown ${USERNAME}:${USERNAME} bat/autocomplete/*" atpull="%atclone" id-as="bat"
zinit light @sharkdp/bat

zinit ice wait="1" lucid from="gh-r"  sbin="bin/exa"  mv="completions/exa.zsh -> completions/_exa"  atclone="chown ${USERNAME}:${USERNAME} completions/*" atpull="%atclone" id-as="exa"
zinit light ogham/exa

# End of Zinit's installer chunk
# }}}
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
    zinit ice id-as="p10k-instan-prompt"
    zinit snippet $(echo "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh")
  # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
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
## export {{{
export DOTBARE_DIR="${HOME}/.myconfig"
export DOTBARE_TREE="${HOME}"
export EDITOR='vim'
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GPG_TTY=$(tty)
export BIN="${HOME}/.local/bin"
export LOCAL="${HOME}/.local"
#}}}
###alias {{{
if [ -x "$(command -v exa)" ]; then
    alias ls="exa"
    alias la="exa --long --all --group"
    alias ll="exa --long --group"
fi
if [ -x "$(command -v rg)" ]; then
    alias grep="rg"
fi
if [ -x "$(command -v fd)" ]; then
    alias find='fd'
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
alias tsrc='tmux source ~/.tmux.conf'
alias batcat='bat'
alias gitc='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
alias config='dotbare'
alias zshconfig="${EDITOR} ~/.zshrc"
alias vimconfig="${EDITOR} ~/.config/nvim/init.vim"
alias exa='exa --icons'
alias install="${EDITOR} ~/.config/install.sh"
alias prz='proxychains4 -q zsh'
alias pr='proxychains4 -q'
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
     $EDITOR $file
    fi
}
get_tmux(){
    name=$(tmux ls | cut -d '-' -f 1|fzf)
    tmux a -t $name
}
zinit ice id-as="p10k.zsh"
zinit snippet $(echo ${HOME}/.p10k.zsh)
# 设置 c 库位置{{{
export PATH=${PATH}:${HOME}/.local/bin
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${HOME}/.local/lib
export C_INCLUDE_PATH=${C_INCLUDE_PATH}:${HOME}/.local/include
export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:${HOME}/.local/include
# }}}
#}}} 
