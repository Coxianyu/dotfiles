# antien{{{
source "${HOME}/.config/antigen.zsh"
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle wfxr/forgit
antigen bundle djui/alias-tips
antigen bundle supercrabtree/k
antigen bundle extract
antigen bundle mroth/evalcache
antigen bundle urbainvaes/fzf-marks
# antigen bundle gitignore
antigen bundle safe-paste
antigen bundle colored-man-pages
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle kazhala/dotbare
antigen bundle mafredri/zsh-async
# Syntax highlighting bundle.
antigen bundle Aloxaf/fzf-tab 
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

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
export PATH="${HOME}/.local/bin:${PATH}"


#}}}
### navi {{{
# _evalcache hub alias -s
_evalcache navi widget zsh

# eval "$(navi widget zsh)"
#}}}
## export {{{
### export-common {{{{
export DOTBARE_DIR="${HOME}/.myconfig"
export DOTBARE_TREE="${HOME}"
export EDITOR='nvim'

export _ZL_CMD='j'
export BIN="${HOME}/.local/bin"
export PATH
fpath=(~/.local/script $fpath)
autoload -Uz compinit
compinit
_dotbare_completion_cmd
#}}}}
#}}}
###alias {{{
# common-alias {{{{
if test -f ~/.local/bin/fd;then
    alias find='fd'
fi
if test -f ~/.local/bin/rg;then
    alias grep='rg'
fi
if test -f ~/.local/bin/exa;then
    alias ls='exa'
    compdef ls=exa
fi
alias cat='cat_function'
# alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
alias config='dotbare'
alias bat='batcat'
alias zshconfig="$EDITOR ~/.zshrc"
alias vimconfig="$EDITOR ~/.config/nvim/init.vim"
alias vim='vim_function'
alias exa='exa --icons'
alias la='exa -a'
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
compdef config=dotbare
#}}}
# function {{{
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}
gh-clone-latest() {
  local owner=$1 project=$2
  local output_directory=${3:-$owner-$project-release}
  local release_url=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/$owner/$project/releases/latest)
  local release_tag=$(basename $release_url)
  git clone -b $release_tag -- https://github.com/$owner/$project.git $output_directory
}
function vim_function(){
    if test -f /bin/nvim -o -f /usr/local/bin/nvim -o ~/.local/bin/nvim;then
        nvim $@
    elif test -f /bin/vim;then
        /bin/vim --clean $@
    else
        /bin/vi $@
    fi
}
function cat_function(){
    if test -f "${BIN}/batcat";then
        batcat $*
    else
        /bin/cat $*
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
# }}}
### z.lua {{{
# 识别根目录的文件
export _ZL_ROOT_MARKERS=".git,.svn,.hg,.root,package.json"
# eval "$(lua ~/.config/z.lua --init zsh)"
_evalcache lua ~/.config/z.lua --init zsh
# }}}
# export DOTBARE_PREVIEW="bat {}"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --icons --color=always $realpath'
