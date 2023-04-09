# linux 备忘录
## alias and function
- `tasks`: 调用 `asynctask -f` 编译或者运行项目
- `dh`: 使用 fzf 选择去过的路径
- `de`: 使用 fzf 选择父目录
- `dc`: 跳转到当前目录下的子目录
- `gdh`: 比较当前文件和 git 最新提交之间的不同
- `vitmux`: 编辑 tmux 的配置文件
- `vimzsh`: 编辑 zsh 的配置文件
- `vimconfig`: 编辑 vim 的配置文件
- `vimproxy`: 编辑 proxychains4 的配置文件
- `vimark`:编辑 fzf 的配置文件
- `viminstall`: 编辑 `install.sh` 这个脚本
- `proxytest`: 测试代理是否正常
- `cdg`: 跳转到 `gita` 克隆的 git 库
- `vimservice`: 编辑自定义的 systemctl service
- `SSH_SOCK`: 将 SSH 认证方式交给 openssh
- `GPG_SOCK`: 将 SSH 认证方式交给 GPG
- `vimcheat`: 编辑 cheatsheet 文件
- `vimdockercompose`: 编辑 dockercompose 文件
- `docker-repo`: 将 docker 源切换为阿里
- `my-ssh-config`: 处理 ssh 设置
- `cpv`: 复制 vimspector 配置文件到当前目录下
- `ef`: 编辑当前目录下的一个文件
- `efa`: 编辑当前目录的所有文件
- `wan_ip`: 获得外网IP
- `get_tmux`: 进入 tmux 会话
- `log_start`: 将接下来所有的命令和输出都记录到一个 logfile 文件
- `fkill`: 使用 fzf 选择结束进程
- `alias-search`: 使用 fzf 查询 alias

## 插件功能
### history-search-multi-word
- 查询历史命令
- `CTRL+R`: 使用 fzf 查询历史命令

### fzf-marks
- 使用 fzf 跳转到收藏的目录
- `fzf`: 打开跳转列表

### copyfile
- 复制文件内容
- `copyfile  <filename>`

### gpg-crypt
- 使用 gpg 加密文件
- `gpg-encrypt` & `gpg-decrypt`

### blackbox
- 在 git 项目中加密文件
- 详细使用方法请使用 `CTRL+G`


### copypath

- 复制一个文件的路径

### clipbord

- `<echo something> | clipcopy`: 将输出写入剪切版
- `clippaste`: 将剪切版中的数据粘贴


## extract
- 解压压缩包,无论是 .zip 还是 .7z 自动匹配
- `extract <file_name>


## delta

- diff 的替代品
- `delta <file1> <file2>`

## dacuoxian

- 快速切换 host 文件的 zsh 脚本

## direnv
- 进入某个文件夹时自动加载和卸载环境变量
- `.envrc` 中设置环境变量
```bash
## cat ./.envrc 
exprot TEST=test
```

## gogs 

- 轻量化类似 github 的系统
- `gogs web` 启动 gogs


## ripgrep
- `grep` 的替代品, 用于在文件或者标准输出中寻找字符串
- `rg <key_word> <path_to_file>`

## dog

- `dig` 的替代品, 用于查询 dns
- `dog <domain> A`

## bat 

- cat 的替代品


## exa
- ls 的替代品


# easy-rsa

- 用于快速创建 pki(建议使用 xca)

# pyenv
- python 虚拟环境
- `PYENV_VERSION`:这个环境变量用于决定 python 版本

## mycli

- python 编写的mysql客户端

## supervisor

- python 实现用于创建管理服务的软件,不需要 root 权限

```python
# syntax

```
## cloc
- 统计代码行数的工具
- `cloc <filename>` or `cloc <dir>`

