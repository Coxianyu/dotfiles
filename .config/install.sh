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
    pip3 install neovim
    # python 格式化工具
    pip3 install autopep8
    # global 使用 
    pip3 install pygments
    # 替换 htop 和 top
    pip3 install --user glances
    # ranger 文件管理程序
    pip3 install ranger-fm
    # pyyaml gita 需要
    pip3 install pyyaml
    # 管理多个 git 仓库的工具
    pip3 install gita
    # httpie curl 代替
    pip3 install --upgrade httpie
    # 安装 thefuck 纠正命令
    # pip install thefuck


    # gf grep 的包装
   go get -u github.com/tomnomnom/gf

   # tmuxinator 对于不同的项目设置不同的 tmux 布局
   gem install tmuxinator
   npm install yarn
   npm install neovim
# 规范 commit 写法
   npm install -g commitizen cz-conventional-changelog
   npm i -g cz-customizable
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
apt-install(){
    apt install curl git wget unzip
    apt install lua5.4
    apt install python3
    apt install python3-pip
    apt install grc
    apt install global
    apt install uuid
    apt install universal-ctags
    apt install scd
    apt install ruby
    apt install golang
    apt install tmux
    # 连接系统和 tmux 剪切版
    apt install xclip
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

main(){
# 安装 tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# nvim 安装 vim-plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# vim 安装 vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# packer.nvim
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# clone my cheatsheet
git clone https://github.com/Coxianyu/cheatsheet ~/.local/share/navi/cheats/cheatsheet

}
function clone-git(){
# clone github repos
mkdir ~/github
cd ~/github && gita clone ~/.gita.conf
}

function v2ray-conf(){
echo -n "Enter ADDRESS: "
read  ADDRESS
echo ''
echo -n "Enter PORT: "
read  PORT
echo ''
echo -n "Enter PATH: "
read  HTTP_PATH
echo ''
echo -n "Enter UUID: "
read UUID
echo ''
# mkdir -p /usr/local/etc/v2ray
# curl https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh | bash
echo '{
  "inbounds": [
    {
      "port": 10808,
      "listen": "127.0.0.1",
      "protocol": "socks",
      "sniffing": {
        "enabled": true,
        "destOverride": ["http", "tls"]
      },
      "settings": {
        "auth": "noauth",
        "udp": false
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "vmess",
      "settings": {
        "vnext": [
          {
            "address": "'$ADDRESS'",
            "port": '$PORT',
            "users": [
              {
                "id": "'$UUID'",
                "alterId": 0
              }
            ]
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "wsSettings": {
          "path": "/'$HTTP_PATH'"
        }
      }
    }
  ]
}'>/usr/local/etc/v2ray/config.json
}
