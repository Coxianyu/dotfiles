#!/bin/bash
# 安装环境
function env(){
    # nodejs
    curl -sL install-node.now.sh/lts | bash -s -- --prefix="${HOME}/.local"
    # zsh-bin
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh-bin/master/install)"
}
lan(){
    # python3
    # pip3 install neovim
    # # python 格式化工具
    # pip3 install autopep8
    # # global 使用 
    # pip3 install pygments
    # # 替换 htop 和 top
    # pip3 install --user glances
    # # ranger 文件管理程序
    # pip3 install ranger-fm
    # # pyyaml gita 需要
    # pip3 install pyyaml
    # # 管理多个 git 仓库的工具
    # pip3 install gita
    # # httpie curl 代替
    # pip3 install --upgrade httpie
    # 安装 thefuck 纠正命令
    # pip install thefuck
    # nginx 格式化工具
    # pip3 install nginxfmt
    # 记录终端操作的命令
    # pip3 install asciinema



    # gf grep 的包装
   go get -u github.com/tomnomnom/gf

   # tmuxinator 对于不同的项目设置不同的 tmux 布局
   # gem install tmuxinator
   # npm install yarn
   # npm install neovim
# 规范 commit 写法
   # npm install -g commitizen cz-conventional-changelog
   # npm i -g cz-customizable
}


function lsp(){
    # c lsp server
        # CocCommand clangd.install

    # bash lsp server
        npm i -g bash-language-server

    # python lsp server
        # CocInstall coc-pylight

}
font(){
    mkdir -p /usr/share/fonts/mess
    cd  /usr/share/fonts/mess
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
    fc-cache
}
function install-init(){
    source ${HOME}/.config/install.sh
}
packer-install(){
    if [ -x "$(command -v apt)" ];then
        PACKGER="apt"
    elif [ -x "$(command -v yum)"  ];then
        PACKGER="yum"
    else
        echo 'Error: Unknown package manager'
        return 1
    fi
    $PACKGER install curl git wget unzip gcc make -y
    # $PACKGER install lua5.4 -y
    $PACKGER install python3 -y
    $PACKGER install python3-pip -y
    $PACKGER install grc -y
    $PACKGER install global -y
    $PACKGER install uuid -y
    $PACKGER install universal-ctags -y
    # $PACKGER install scd -y
    $PACKGER install ruby -y
    $PACKGER install golang -y
    $PACKGER install tmux -y
    # 连接系统和 tmux 剪切版 -y
    $PACKGER install xclip -y
    $PACKGER install gpg -y
    $PACKGER install scdaemon -y
    $PACKGER install clang-format -y

}
# apt install curl git wget python3 python3-pip proxychains v2ray unzip git-flow

start(){

mkdir -p ~/.local/bin
mkdir -p ~/.local/script
mkdir -p ~/.local/go
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua
mkdir -p ~/.config/nvim/pack/vimspector/opt/
mkdir -p ~/.local/share/navi/
mkdir -p ~/.gnupg
mkdir -p ~/.cht.sh
mkdir -p ~/.ssh

export PATH="${HOME}/.local:${HOME}/.local/bin:${PATH}"

}

# main(){
# 安装 tpm
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# nvim 安装 vim-plug.vim
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#
# vim 安装 vim-plug
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#
# packer.nvim


# clone my cheatsheet
# git clone https://github.com/Coxianyu/cheatsheet ~/.local/share/navi/cheats/cheatsheet

# 处理 tmux-powerline
# git clone https://github.com/erikw/tmux-powerline ~/.config/tmux-powerline
# cp -f "${HOME}/.config/default.sh" "${HOME}/.config/tmux-powerline/themes/default.sh"
# }

function clone-git(){
    # clone github repos
        mkdir ~/github
    cd ~/github && gita clone ~/.gita.conf
}

# function v2ray-conf(){
# echo -n "Enter ADDRESS: "
# read  ADDRESS
# echo ''
# echo -n "Enter PORT: "
# read  PORT
# echo ''
# echo -n "Enter PATH: "
# read  HTTP_PATH
# echo ''
# echo -n "Enter UUID: "
# read UUID
# echo ''
# # mkdir -p /usr/local/etc/v2ray
# # curl https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh | bash
# echo '{
#   "inbounds": [
#     {
#       "port": 10808,
#       "listen": "127.0.0.1",
#       "protocol": "socks",
#       "sniffing": {
#         "enabled": true,
#         "destOverride": ["http", "tls"]
#       },
#       "settings": {
#         "auth": "noauth",
#         "udp": false
#       }
#     }
#   ],
#   "outbounds": [
#     {
#       "protocol": "vmess",
#       "settings": {
#         "vnext": [
#           {
#             "address": "'$ADDRESS'",
#             "port": '$PORT',
#             "users": [
#               {
#                 "id": "'$UUID'",
#                 "alterId": 0
#               }
#             ]
#           }
#         ]
#       },
#       "streamSettings": {
#         "network": "ws",
#         "security": "tls",
#         "wsSettings": {
#           "path": "/'$HTTP_PATH'"
#         }
#       }
#     }
#   ]
# }'>/usr/local/etc/v2ray/config.json
# }
