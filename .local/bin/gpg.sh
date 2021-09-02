#/bin/bash
uname -a | rg WSL 1>/dev/null 2>&1
if test "$?" -eq 0;then
    GPG=gpg.exe
else
    GPG=gpg
fi
$GPG $@
