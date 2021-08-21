#!/bin/bash
# 安装环境
function env(){
    # nodejs
    curl -sL install-node.now.sh/lts | bash
    npm install yarn
    npm install neovim
    # 规范 commit 写法
    npm install -g commitizen cz-conventional-changelog
    npm i -g cz-customizable
    # zsh-bin
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh-bin/master/install)"

    # python3
    pip3 install neovim
    # python 格式化工具
    pip3 install autopep8

    # 多 git 库管理工具
    pip3 install mu-repo
    # 分屏 diff 工具
    pip3 install git+https://github.com/jeffkaufman/icdiff.git
    # 替换 htop 和 top
    pip3 install --user glances
    # ranger 文件管理程序
    pip3 install ranger-fm
    # 管理多个 git 仓库的工具
    pip3 install gita
    # 检查 commit message 信息的 lint
    pip3 install gitlint

}
function lsp(){
    # c lsp server
    # bash lsp server
    npm i -g bash-language-server
    # python lsp server
    # CocInstall coc-pylight
    nvim 1.c -c "CocCommand clangd.install" 

}
bat(){
    url=$(curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep unknown-linux-gnu.tar.gz  | grep x86_64)
    # echo $url
    wget $url -O bat.tar.gz
    mkdir ./bat && tar -xzvf bat.tar.gz -C ./bat --strip-components 1
    cp -fr ./bat/bat ~/.local/bin/bat
    cp -fr ./bat/autocomplete/bat.zsh ~/.local/script/_bat

}
fd(){
    url=$(curl -s https://api.github.com/repos/sharkdp/fd/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep unknown-linux-gnu.tar.gz  | grep x86_64)
    wget $url -O fd.tar.gz
    mkdir ./fd && tar -xzvf fd.tar.gz -C ./fd --strip-components 1
    cp -fr ./fd/fd ~/.local/bin/fd
    cp -fr ./fd/autocomplete/_fd ~/.local/script/_fd
}
rg(){
    url=$(curl -s https://api.github.com/repos/BurntSushi/ripgrep/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep unknown-linux-musl.tar.gz  | grep x86_64)
    # echo $url
    wget $url -O rg.tar.gz
    mkdir ./rg && tar -xzvf rg.tar.gz -C ./rg --strip-components 1
    cp -fr ./rg/rg ~/.local/bin/rg
    cp -fr ./rg/complete/_rg ~/.local/script/_rg
}
navi(){
    url=$(curl -s https://api.github.com/repos/denisidoro/navi/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep unknown-linux-musl.tar.gz  | grep x86_64)
    # echo $url
    wget $url -O navi.tar.gz
    tar -xf ./navi.tar.gz
    cp -fr ./navi ~/.local/bin/navi
    # mkdir ./navi && tar -xzvf navi.tar.gz -C ./navi --strip-components 1
    # cp -fr ./navi/navi ~/.local/bin/navi
    # cp -fr ./navi/complete/_navi ~/.local/script/_navi
}
lazygit(){
    url=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep _Linux_  | grep x86_64)
    # echo $url
    wget $url -O lazygit.tar.gz
    tar -xf ./lazygit.tar.gz
    cp  -fr ./lazygit ~/.local/bin/lazygit

}
neovim(){
    cd ~
    url=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep linux64 | grep -v sum)
    wget $url -O neovim.tar.gz
    mkdir ./.neovim && tar -xzvf neovim.tar.gz -C ./.neovim --strip-components 1
    ln -s ~/.neovim/bin/nvim ~/.local/bin/nvim
    cd /tmp
}
delta(){
    url=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep "x86_64-unknown-linux-gnu.tar.gz")
    # echo $url
     wget $url -O delta.tar.gz
     tar -xf ./delta.tar.gz
     mkdir ./delta && tar -xzvf delta.tar.gz -C ./delta --strip-components 1
     cp  -fr ./delta/delta ~/.local/bin/delta
}
exa(){
    url=$(curl -s https://api.github.com/repos/ogham/exa/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep "exa-linux-x86_64" | grep -v "musl")
    echo $url
    wget $url -O exa.zip
    unzip  ./exa.zip
    cp  -fr ./bin/exa ~/.local/bin/exa
    cp  -fr ./completions/exa.zsh ~/.local/script/_exa
}

function tool() {
        cd /tmp
        bat
        fd
        rg
        navi
        lazygit
        exa
        delta
        neovim
    }


mkdir -p ~/.local/bin
mkdir -p ~/.local/script
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua
mkdir -p ~/.config/nvim/pack/vimspector/opt/
mkdir -p ~/githubtool
mkdir -p ~/.local/share/navi/

if test "$1" = "--full";then
    env
    tool
fi
if test "$1" = "-t";then
    tool
fi
# antigen.zsh
wget git.io/antigen -O ~/.config/antigen.zsh
# Plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# packer.nvim
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# clone my cheatsheet
git clone https://github.com/Coxianyu/cheatsheet ~/.local/share/navi/cheats/cheatsheet
