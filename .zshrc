### z.lua {{{
# 识别根目录的文件
export _ZL_ROOT_MARKERS=".git,.svn,.hg,.root,package.json"
export _ZL_CMD='j'
# eval "$(lua ~/.config/z.lua --init zsh)"
# _evalcache lua ~/.config/z.lua --init zsh
autoload -Uz compinit
compinit
# }}}
# z.lua-alias {{{{
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
#}}}}
# P10K{{{
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# }}}
# antigen{{{
source "${HOME}/.config/antigen.zsh"
# Load the oh-my-zsh's library.
antigen use oh-my-zsh
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle Czocher/gpg-crypt
antigen bundle djui/alias-tips
antigen bundle bobthecow/git-flow-completion
antigen bundle supercrabtree/k
antigen bundle extract
antigen bundle git
antigen bundle wfxr/forgit
antigen bundle alexdesousa/hab
antigen bundle mroth/evalcache
antigen bundle bartboy011/cd-reminder
antigen bundle bigH/git-fuzzy
antigen bundle rtuin/zsh-case
antigen bundle urbainvaes/fzf-marks
antigen bundle safe-paste
antigen bundle colored-man-pages
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle kazhala/dotbare
antigen bundle mafredri/zsh-async
antigen bundle Aloxaf/fzf-tab 
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle skywind3000/z.lua
antigen bundle changyuheng/fz
antigen theme romkatv/powerlevel10k
# Load the theme.
# antigen theme robbyrussell
# antigen theme  jonathan

# Tell Antigen that you're done.
antigen apply
function _z() { _zlua "$@"; }
# }}}
### fzf {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# 
# 显示隐藏文件 排除 .git 文件夹
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
# 设置颜色显示
#export FZF_DEFAULT_COMMAND="fd --type file --color=always"
# export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'batcat --color=always --style=header,grid --line-range :300 {}'"
export FZF_DEFAULT_OPTS="--ansi"
export PATH="${HOME}/.local/bin:${PATH}"


#}}}
### navi {{{
# _evalcache hub alias -sexport 
NAVI_FZF_OVERRIDES_VAR='--reverse'
_evalcache navi widget zsh

# eval "$(navi widget zsh)"
#}}}
## export {{{
### export-common {{{{
export DOTBARE_DIR="${HOME}/.myconfig"
export DOTBARE_TREE="${HOME}"
export EDITOR='nvim'
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GPG_TTY=$(tty)

export BIN="${HOME}/.local/bin"
export PATH
fpath=(~/.local/script $fpath)
_dotbare_completion_cmd
#}}}}
#}}}
###alias {{{
# common-alias {{{{
# alias bat='batcat'
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
alias batcat='bat'
alias gitc='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
alias config='dotbare'
alias zshconfig="$EDITOR ~/.zshrc"
alias vimconfig="$EDITOR ~/.config/nvim/init.vim"
alias exa='exa --icons'
alias install='nvim ~/.config/install.sh'
# }}}}
#}}}
#compdef {{{
compdef batcat=bat
compdef config=dotbare
#}}}
# function {{{
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
   
}
function ef(){
    if [ $1 ];then
        dir=$1
    else
        dir=.
    fi
    file=$(fd . --type=f --full-path "$dir" --color=always -H -E ".git"  -E ".vim"| fzf --ansi --preview-window 'right:60%' --preview 'batcat --color=always --style=header,grid --line-range :300 {}')
 if test -n "$file";then
     vim $file
    fi
}
get_tmux(){
    name=$(tmux ls | cut -d '-' -f 1|fzf)
    tmux a -t $name
}
# }}}
# export DOTBARE_PREVIEW="bat {}"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --icons --color=always $realpath'
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
