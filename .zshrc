# antien{{{
source "${HOME}/.config/antigen.zsh"
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# antigen bundle git
# antigen bundle heroku
# antigen bundle pip
# antigen bundle lein
# antigen bundle command-not-found
antigen bundle extract
antigen bundle gitignore
antigen bundle safe-paste
antigen bundle colored-man-pages

# Syntax highlighting bundle.
antigen bundle Aloxaf/fzf-tab 
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply
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
export PATH="${PATH}:${HOME}/.local/bin"

#}}}
### navi {{{
eval "$(navi widget zsh)"
#}}}
## export {{{
### export-common {{{{
export EDITOR='vim'
export _ZL_CMD='j'
export BIN="${HOME}/.local/bin"
PATH+=":/home/chen/.linuxbrew/bin/"
export PATH
fpath=(~/.local/script $fpath)
autoload -Uz compinit
compinit
#}}}}
#}}}
###alias {{{
# common-alias {{{{
alias find='fd'
alias grep='rg'
alias cat='getfile'
alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
alias bat='batcat'
alias zshconfig="$EDITOR ~/dotfiles/zshrc"
alias vimconfig="$EDITOR ~/dotfiles/vimrc"
alias vim='vim_function'
function vim_function(){
    if test -f /bin/nvim -o -f /usr/local/bin/nvim;then
        nvim $@
    elif test -f /bin/vim;then
        unalias vim
        vim $@
    else
        vi $@
    fi
}
function getfile(){
    if test -f "${BIN}/batcat";then
        batcat $*
    else
        \cat $*
    fi
}
function cde(){
    if [ $1 ];then
        dir=$1
    else
        dir=.
    fi
     dir=$(fd . --type=d --full-path "$dir" --color=always |fzf --preview 'ls --color=always -ah {}')
   
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
# }}}}
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
#}}}
#compdef {{{
compdef batcat=bat
#}}}
### z.lua {{{
# 识别根目录的文件
export _ZL_ROOT_MARKERS=".git,.svn,.hg,.root,package.json"
eval "$(lua ~/.config/z.lua --init zsh)"
# }}}
