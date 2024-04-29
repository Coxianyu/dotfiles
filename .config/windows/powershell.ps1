oh-my-posh init pwsh --config "C:\Users\\{{user_name}}\default.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "C:\Users\\{{user_name}}\AppData\Local\Programs\oh-my-posh\themes\gamy.omp.json" | Invoke-Expression
$env:SYNC_USER1="xianyu:7821132"
$env:SYNC_PORT=9090
function anki{
C:\Users\1234\AppData\Local\Programs\Anki\anki.exe --syncserver
}
if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function MenuComplete
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
Set-PSReadLineKeyHandler -Key "Ctrl+u" -Function BackwardDeleteLine
Set-PSReadLineKeyHandler -Key "Ctrl+k" -Function ForwardDeleteLine
Remove-PSReadLineKeyHandler "Ctrl+a"
Set-PSReadLineKeyHandler -Key "Ctrl+a" -Function BeginningOfLine
Set-PSReadLineKeyHandler -Key "Ctrl+e" -Function EndOfLine
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardChar
Set-PSReadLineKeyHandler -Chord "Alt+RightArrow" -Function ForwardWord

$env:SSH_AUTH_SOCK="\\.\pipe\ssh-pagent"
$env:_ZL_CMD="j"
$env:_ZL_DATA="D:\z-lua\.z.lua"
$env:FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
$env:FZF_DEFAULT_OPTS="--ansi"
$env:EDITOR='gvim'
$env:PATH+=";C:\USER\\{{user_name}}\node_modules\yarn\bin"
$env:PATH+=";C:\USER\\{{user_name}}\.local\bin\"
Set-PSReadLineKeyHandler -Chord Ctrl+g -ScriptBlock {
    $output = navi --print
        $shell = New-Object -com "Wscript.Shell"
        $shell.SendKeys("$output")
}

function config(){gvim $PROFILE}
function vimconfig() {gvim D:\Vim\_vimrc}

function jf() {j  -I $args[0]}
function jb() {j -b $args[0]}
function jbf() {j -b -I $args[0]}
function jh() {j -I -t $args[0]}
function jc() {j -c -I $args[0]}
