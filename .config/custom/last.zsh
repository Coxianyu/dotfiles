bindkey  '^[OA' up-line-or-history
bindkey  '^[[A' up-line-or-history
# 修改 atuin 钩子函数, 不将错误的历史命令加入到 sqlite 数据库
_atuin_preexec(){
    whence ${${(z)1}[1]} >| /dev/null || return 1 
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
	id=$(atuin history start "$1")
	export ATUIN_HISTORY_ID="$id"
}
