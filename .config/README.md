# 安装指引

- 最开始需要 proxychains4 以及 git
- 首先运行`source ~/.config/install.sh`
- 然后运行 `env` 安装 nodejs 和 zsh
- 然后是 `packer-install` 安装 python3 curl git 等工具
- 然后是 `zsh` 安装 zinit 以及一些工具
- 然后是 `main` 安装 vim 插件等东西
- 然后是 vim 输入 `PlugInstall` `PackerInstall`  `PackerCompile` 完成插件安装
- 插入物理密钥, 运行 `gpg --card-edit`, 然后运行 'fetch' 取得公钥
- 运行 `blacblackbox_decrypt_all` 解密所有文件
