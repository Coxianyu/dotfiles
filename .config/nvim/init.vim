" 用户指南{{{
" 首先安装 vim-plug
    " vim:curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " neovim curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" nodejs 12 以上:  curl -sL install-node.now.sh/lts | bash
" 如果是 neovim 需要 npm install neovim 
" 安装完成后运行 CocCommand clangd.install 
" python 格式化需要 autopep8 
"   pip3 install autopep8
" 安装后 vim 中执行
"   :CocCommand clangd.install
"   :CocInstall preview-fzf
"}}}
"快捷键列表{{{
"vim-bookmark {{{
" ma 在 quickfix 中显示所有书签
" mm 设置书签
" mi 添加注释
" mn 跳转到下一个书签
" mp 跳转到上一个书签
" mc 清除书签
" mx 清除所有书签
"}}}
"vim-easy-align {{{
"选择模式下 <leader>sa 进入对齐模式
"}}}
"ultisnips {{{
":UltiSnipsEdit 编辑片段
"}}}
    "vim-unimpaired{{{
    "定义一组和括号有关的快捷键
    "}}}
"vim-signify {{{
"SignifyDiff 对比当前文件和版本库的差别
"}}}
"asyncrun {{{
":AsyncRun 命令 异步执行命令
"}}}
"vim-commentary {{{
"提供 gc 命令快速注释
"}}}
" vim-translator {{{
" :Translate: 命令栏显示翻译结果
" :TranslateW: 浮动窗口显示翻译结果
" :TranslateR: 用结果替换选择的文字
" :TranslateX: 复制到剪切板
" :TransLateL: 显示日志
" }}}
"}}}
"插件{{{
call plug#begin()

" TODO: 看一下 cheat.sh.vimc
" TODO: 学习 asynctasks
" TODO: 写快捷键列表
" TODO: Which-key 映射
" TODO: vim 调试插件 vimspector
" TODO: neoformat 插件的配置
" cheat.sh
Plug 'nvim-telescope/telescope-vimspector.nvim'
Plug 'szw/vim-maximizer'
Plug 'puremourning/vimspector',{'dir':'~/.config/nvim/pack/vimspector/opt/vimspector'}
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'GustavoKatel/telescope-asynctasks.nvim'
Plug 'TC72/telescope-tele-tabby.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'fhill2/telescope-ultisnips.nvim'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'tom-anders/telescope-vim-bookmarks.nvim'
Plug 'dbeniamine/cheat.sh-vim'
" 翻译插件
Plug 'voldikss/vim-translator'
" theme
Plug 'glepnir/zephyr-nvim'
" vim 浮动终端
Plug 'voldikss/vim-floaterm'
Plug 'sbdchd/neoformat'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install'}
Plug 'junegunn/fzf.vim' 
Plug 'SirVer/ultisnips'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'rhysd/clever-f.vim'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asyncrun.extra'
Plug 'Yggdroot/indentLine'
if !has('gui_running')
    Plug 'brglng/vim-im-select'
endif
Plug 'tpope/vim-unimpaired'
"以 [] 开头
Plug 'liuchengxu/vim-which-key'
"通过 :Asyncrun 这个命令，异步执行请求 shell 命令
" theme
" 文本对象
Plug 'kana/vim-textobj-user' 
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'

" 定义了几个文档对象 [,]-- 代表当前参数,[i] -- 代表当前所有缩进的代码 [f]--
" 函数对象， 可以使用 dif 来改变一个函数的内容
" 显示当前代码和版本库中的区别， 还有一些命令，Signifydiff
" if has('nvim') || has('patch-8.0.902')
Plug 'mhinz/vim-signify' 
" gutentags 的增强
Plug 'skywind3000/gutentags_plus' 
Plug 'ConradIrwin/vim-bracketed-paste' 
if filereadable('/bin/gtags') || filereadable('/usr/local/bin/gtags')
    Plug 'ludovicchabant/vim-gutentags'
endif
Plug 'yianwillis/vimcdoc'
Plug 'Yggdroot/LeaderF'
Plug 'w0rp/ale'
Plug 'kien/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-commentary' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-repeat' 
Plug 'nelstrom/vim-visual-star-search' 
"":CocCommand clangd.install 安装 clangd 
call plug#end()
"}}} 
"set 指令{{{ 
" set splitbelow

" set runtimepath=~/.vim8,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim8/after
" set packpath=~/.vim8,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim8/after,~/.config/nvim
set splitright

set mouse="a"
set termguicolors
set noshowmode 
set termencoding=utf-8  "termencoding是Vim所工作的终端(或者 Windows的Console窗口)的字符编码方式 ，一般设置为utf8。 set encoding=utf8  "说明：encoding是Vim内部使用的字符编码方式，一般设置为utf8。
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030 "fileencodings是Vim自动探测fileencoding的顺序列表，启动时会按照它所列出的字 符编码方式逐一探测即将打开的文件的字符编码方式。这些设置需要set命令来进行设置生效。
set timeoutlen=1500
"主题
set bg=dark
colorscheme zephyr
" colorscheme solarized8_flat
hi Comment cterm=italic
"highlight ColorColumn ctermbg=gray
"set colorcolumn=80
set incsearch
"set textwidth=80
set smartindent
" set lines=35 columns=160
set relativenumber
set ignorecase
set history=1024
set autochdir
set ruler
set laststatus=2
set fdm=marker
" set gfn=DejaVu\ Sans\ Mono:h15
" set gfn=Hakc\ Bold\ Nerd\ Font\ Complete\ Mono:14
set gfn=Hack\ Nerd\ Font\ Mono:h14
set foldcolumn=1
set shiftwidth=4
set softtabstop=4
set expandtab
if (!has("nvim"))
    set wildmode=longest:list,full
    set wildmenu
endif
set nu
set ai
set hidden
set noeb
set nocompatible
set t_Co=256
syntax on
" syntax off
"}}}
"nnoremap common {{{
let mapleader= ","
nnoremap <f1> <nop>
nmap <leader>sa <Plug>(EasyAlign)
nnoremap <tab> V>
nnoremap <s-tab> V<
nnoremap <tab>h <c-w>h
nnoremap <tab>j <c-w>j
nnoremap <tab>k <c-w>k
nnoremap <tab>l <c-w>l
nnoremap <leader>ww :w<cr>
nnoremap <leader>we :wq<cr>
nnoremap <leader>wq :q!<cr>
nnoremap <leader>wb :bd<cr>
nnoremap <leader>ss :set hlsearch!<cr>
nnoremap <space> za
nnoremap H 0
nnoremap <leader> :Asyncrun
nnoremap L $
nnoremap <leader>h H
nnoremap <leader>l L
nnoremap / :/
nnoremap ? :?
nnoremap <leader>? ?
noremap n nzz 
nnoremap <leader>/ /
noremap N Nzz
nnoremap <m-k> :tabprevious<cr>
nnoremap <m-j> :tabnext<cr>
nnoremap <c-j> :bprevious<cr>
nnoremap <c-k> :bnext<cr>
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"}}}
" vnoremap {{{
vnoremap <tab> >gv
vnoremap <s-tab> <gv
xmap <leader>ga <Plug>(EasyAlign)
"}}}
"inoremap "{{{
inoremap <s-tab> <c-d>
inoremap <leader>o <c-o>
inoremap <c-j> <down>
" inoremap <c-k> <up>
inoremap <c-n> <down>
inoremap <c-p> <up>
inoremap <c-b> <left>
inoremap <c-f> <right>
inoremap <c-a> <c-o>0
inoremap <c-e> <c-o>$
inoremap jj <c-[>
if !has("gui_running")
    inoremap <esc> <nop>
endif
"}}}
"cnoremap {{{
cnoremap <up> <nop>
cnoremap <down> <nop>
cnoremap <c-h> <left>
cnoremap <c-l> <right>
cnoremap <c-n> <down>
cnoremap <c-p> <up>
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
"}}}
"onoremap {{{
"}}}
" vim 打开跳转到上次离开的位置 {{{
if has("autocmd")  
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif  
endif 
" }}}
"AsyncRun 插件的配置{{{
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

"任务结束时候响铃提醒
let g:asyncrun_bell = 0

"设置 F8 打开/关闭 Quickfix 窗口

nnoremap <F8> :call asyncrun#quickfix_toggle(6)<cr>

"}}}
"vim-signify {{{
set updatetime=100
"}}}
"gtags 使用 {{{
" pip 安装 pygments flake8 autopep8
"ycm 手动编译安装
let $GTAGSLABEL = 'native-pygments' 
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
let g:gutentags_define_advanced_commands = 1
 
"}}}
"gutentags {{{
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_define_advanced_commands = 1
 
" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
 
" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif
 
" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')
 
" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
 
" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
 
" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
 
"}}}
" Leaderf {{{
let g:Lf_RgConfig = [
            \ "--max-columns=150",
            \ "--type-add web:*.{html,css,js}*",
            \ "--glob=!git/*",
            \ "--hidden"
            \ ]
let g:Lf_Gtagsconf = '/usr/local/share/gtags/gtags.conf'
let g:Lf_PreviewPopupWidth = 80
let g:Lf_PreviewPopupWidth = 80
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_GtasgsGutentags = 1
let g:Lf_CacheDirectory = expand('~')
let g:Lf_gutentags_cache_dir = '~/.cache/tags'
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_ReverseOrder = 1
let g:Lf_ShortcutF = ''
let g:Lf_ShortcutB = ''
let g:Lf_WindowPosition = 'popup'
let g:Lf_HistoryNumber =  '500'
let g:Lf_PopupPreviewPostion = 'bottom'
let g:Lf_PreviewInPopup = '1'
let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']
let g:Lf_UseVersionControlTool = 1
let g:Lf_DefaultExternalTool = 'rg'
let g:Lf_ShowHidden = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = { 
        \'File': 0,
        \ 'Buffer': 0,
        \ 'Mru': 0,
        \ 'Tag': 0,
        \ 'BufTag': 1,
        \ 'Function': 1,
        \ 'Line': 1,
        \ 'Colorscheme': 0,
        \ 'Rg': 1,
        \ 'Gtags': 1
        \}
"leaderf keybinding {{{
nnoremap <leader>fgr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>    
nnoremap <leader>fF :Leaderf! function<cr>
nnoremap <leader>ff :Leaderf file<cr>
nnoremap <leader>fb :Leaderf! buffer<cr>
nnoremap <leader>fB :Leaderf! buffer --all<cr>
nnoremap <leader>ftt :Leaderf! tag<cr>
nnoremap <leader>fa :LeaderfFunction <cr>
nnoremap <leader>fA :LeaderfFunctionAll <cr>
nnoremap <leader>fl :LeaderfLine<cr>
nnoremap <leader>fL :LeaderfLineAll<cr>
nnoremap <leader>fh :LeaderfHistoryCmd<cr>
nnoremap <leader>fH :LeaderfHistorySearch<cr>
nnoremap <leader>fv :LeaderfHelp<cr>
nnoremap <leader>fz :Leaderf snippet<cr>
nnoremap <leader>fq :LeaderfQuickFix<cr>
nnoremap <leader>fri :LeaderfRgInteractive<cr>
nnoremap <leader>frI :LeaderfRgRecall<cr>
nnoremap <leader>fi  :LeaderfFiletype<cr>
nnoremap <leader>fs  :LeaderfCommand<cr>
nnoremap <leader>fq  :LeaderfQuickFix<cr>
nnoremap <leader>fj   :Leaderf! jumps<cr>
nnoremap <leader>fgt :Leaderf! gtags<cr>
nnoremap <leader>fw  :Leaderf! floaterm<cr>
" LeaderfColorscheme 切换vim主题配色
" LeaderfFiletype  改变当前文件的 FileType
" LeaderCommand  查询vim内建的ex命令和用户定义的命令
" LeaderfWindow  查询vim 窗口
" LeaderfQuickFix 查询vim 的QuickFix 窗口
"}}}
"}}}
"ale 代码检测插件的配置， 需要 flake8 或者 pylint {{{
" 和 coc.nvim 配合使用
"pip install flake8 || pip install pylint 自己挑一个
"
let g:ale_completion_enabled = 0
let g:ale_floating_preview = 1
let g:ale_close_preview_on_insert = 1
let g:Lf_ShowHidden = 1
"let g:ale_cursor_detail = 1
let g:ale_echo_cursor = 1
let g:ale_detail_to_floating_preview = 1
let g:ale_sign_error = "😅"
let g:ale_sign_warning = "⚠️"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_format = '[%linter%] %code: %%s [%severity%]'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_powershell_psscriptanalyzer_exclusions = 'PSAvoidUsingWriteHost,PSAvoidGlobalVars'

" 使用 coc 的lsp服务器诊断错误
let g:ale_disable_lsp = 1


"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
" systemd 支持使用 systemd-analyze 检查
" sql-lint 在 github 下载二进制文件 https://github.com/joereynolds/sql-lint
" Install-Module -Name PSScriptAnalyzer 下载 PSScriptAnalyzer 库
let g:ale_linters = {
            \   'c++': ['clang'],
            \   'c': ['clang'],
            \   'python': ['pylint'], 
            \   'powershell':['PSScriptAnalyzer'],
            \   'systemd':['systemd-analyze --user verify'],
            \   'yaml':['yamllint'],
            \   'sql':['sql-lint'],
            \   'awk':['gawk'],
            \}
" pip3 install pylint
" 解决 java 乱码的问题
" let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'

"ale keybinding {{{
""普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nnoremap <leader>sp :ALEPrevious<CR>
nnoremap <leader>sn :ALENext<CR>
"<Leader>s触发/关闭语法检查
nnoremap <leader>sf :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nnoremap <leader>sd :ALEDetail<CR>

"}}}
"}}}
"rainbow_parentheses --彩色显示括号的插件{{{
let g:rbpt_colorpairs = [
                    \ ['brown',       'RoyalBlue3'],
                    \ ['Darkblue',    'SeaGreen3'],
                    \ ['darkgray',    'DarkOrchid3'],
                    \ ['darkgreen',   'firebrick3'],
                    \ ['darkcyan',    'RoyalBlue3'],
                    \ ['darkred',     'SeaGreen3'],
                    \ ['darkmagenta', 'DarkOrchid3'],
                    \ ['brown',       'firebrick3'],
                    \ ['gray',        'RoyalBlue3'],
                    \ ['darkmagenta', 'DarkOrchid3'],
                    \ ['Darkblue',    'firebrick3'],
                    \ ['darkgreen',   'RoyalBlue3'],
                    \ ['darkcyan',    'SeaGreen3'],
                    \ ['darkred',     'DarkOrchid3'],
                    \ ['red',         'firebrick3'],
                    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
 
"}}}
"vim-whitch-key 配置{{{
nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>
let g:which_key_sep = '→'
" set timeoutlen=100
let g:which_key_map = {}
let g:which_key_map.f = {
            \'name':'+leaderF',
            \'f':'查询当前路径下的文件',
            \'F':'查询当前缓冲区的函数',
            \'b':'查询缓冲区',
            \'B':'查询所有缓冲区',
            \'a':'查询当前缓冲区的函数',
            \'A':'查询所有缓冲区中的函数',
            \'l':'查询当前缓冲区中的一行',
            \'L':'查询所有缓冲区中的一行',
            \'h':'执行vim历史命令',
            \'H':'执行vim /和？ 的搜索命令',
            \'s':'查询执行过的用户自定义命令',
            \'q':'查询 quickfix 窗口',
            \'i':'快速修改文件的类型',
            \'j':'查询jump跳转点',
            \'v':'查询 help 信息',
            \'z':'查询片段',
            \}
let g:which_key_map.f.g = {
            \'name':'+leaderf-gatgs',
            \'t':'查询真个项目中的函数定义和宏定义',
            \'r':'查询光标下函数引用',
            \}
let g:which_key_map.w = {
            \'name':'+quit',
            \'q':'不保存退出vim',
            \'e':'保存退出vim',
            \'w':'保存文件'
            \}
let g:which_key_map.f.r = {
            \'name':'+LeaderF-rg',
            \'i':'交互查询文件内容',
            \'I':'执行上一次RG查询'
            \}
let g:which_key_map.f.t = {
            \'name':'+Leaderf-tags',
            \'t':'查询TAG',
            \'I':'test2'
            \}
let g:which_key_map.s = {
            \'name':'+misc',
            \'s':'关闭搜索高亮',
            \'r':'Asyncrun 运行命令',
            \'d':'显示ale错误详细信息',
            \'f':'关闭ale',
            \'n':'前往ale下一个错误',
            \'p':'前往ale上一个错误',
            \'v':'source .vimrc',
            \}
let g:which_key_map.c = {
        \ 'name':'+csfind',
      \ }
let g:which_key_map.ev = "edit .vimrc"
call which_key#register(',',"g:which_key_map")
" 隐藏状态栏
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

"}}}
" vim-im-select 自动切换中英文{{{ 
" linux 下开箱即用， windows 下需要安装 im-select.exe
if has('win32')
    " g:im_select_default 通过运行 im-select.exe 获得
    let g:im_select_default = '2052'
endif
" windows 下的 gvim 通过以下设置即可
if has("gui_running") && has("win32")
    set imactivatekey=C-space
    inoremap <ESC> <ESC>:set iminsert=0<CR>
endif
 
"}}}
"UltiSnips 片段插件配置 {{{
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<c-q>"
let g:UltiSnipsJumpForwardTrigger="<c-p>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"    
"}}}
" indentLine 缩进显示线 {{{
let g:indentLine_setClors = 0
let g:indentLine_char = '┊'
"}}}
" LeaderF-snippet 使用 leader 查找片段{{{
" 设置预览
let g:Lf_PreviewResult = get(g:, 'Lf_PreviewResult', {})
let g:Lf_PreviewResult.snippet = 1
" }}}
" clever-f  拓展 f F t T 替换 ， ; {{{
" 设置 只在一行中使用
let g:clever_f_across_no_line = 1
"}}}
"vim-bookmarks {{{
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
"}}}
" coc.nvim {{{
"
"      C lsp server:
"          :CocCommand clangd.install
"      bash lsp server:
"          npm i -g bash-language-server
"      python:
"       :CocInstall pyright

" coc tab 完成, 切换下一个片段
"
"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

" <cr> 确认补全
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
let g:coc_snippet_next = '<tab>'


nmap <leader>qd <Plug>(coc-definition)
nnoremap <leader>qr :CocCommand fzf-preview.CocReferences<cr>
nmap <leader>qf <Plug>(coc-format)
nnoremap <leader>qE :CocCommand fzf-preview.CocDiagnostics<cr>
nnoremap <leader>qe :CocCommand fzf-preview.CocCurrentDiagnostics<cr>
nnoremap <leader>qf :CocList folders<cr>
nnoremap <leader>ql :CocList links<cr>
nnoremap <leader>qL :CocCommand fzf-preview.MemoList<cr>
nnoremap <leader>qa :CocCommand fzf-preview.Buffers<cr>
nnoremap <leader>qs :CocList symbols<cr>
nnoremap <leader>qm :CocList marks<cr>
" nnoremap <leader>qK :call <SID>show_documentation()<CR>
nmap <leader>qk <Plug>(coc-rename)
nnoremap <leader>qM :CocCommand fzf-preview.Bookmarks<cr>
nnoremap <leader>qb :CocCommand fzf-preview.AllBuffers<cr>
nnoremap <leader>qp :CocCommand fzf-preview.ProjectOldFiles<cr>
nnoremap <leader>qm :CocCommand fzf-preview.ProjectMruFiles<cr>
nnoremap <leader>qM :CocCommand fzf-preview.ProjectMrwFiles<cr>
nnoremap <leader>qB :call CocAction('jumpDefinition', v:false)<CR>
nnoremap <leader>qn :CocCommand fzf-preview.MruFiles<cr>
nnoremap <leader>qN :CocCommand fzf-preview.MrwFiles<cr>
nnoremap <leader>qc :CocCommand fzf-preview.Changes<cr>
nnoremap <leader>qt :CocCommand fzf-preview.TodoComments<cr>
nnoremap <leader>qD :CocCommand fzf-preview.CocTypeDefinitions<cr>
nmap <leader>qi  <Plug>(coc-format-selected)
imap <leader>sp <Plug>(coc-calc-result-append)

" 设定 markdown 禁用 ` 配对
autocmd FileType markdown let b:coc_pairs_disabled = ['`']
let g:coc_global_extensions = [
            \ "coc-tsserver",
            \ "coc-git",
            \ "coc-snippets",
            \ "coc-lists",
            \ "coc-highlight",
            \ "coc-pyright",
            \ "coc-tasks",
            \ "coc-pairs",
            \ "coc-floaterm",
            \ "coc-word",
            \ "coc-clangd",
            \ "coc-calc",
            \ "coc-sh",
            \ "coc-json"]

" }}}
" neoformat 语言格式化插件{{{
" }}}
" NVIMTREE {{{
nnoremap <f1> :NvimTreeToggle<cr>
" NVIMTREE 宽度
let g:nvim_tree_width = 25 "30 by default, can be width_in_columns or 'width_in_percent%'
" 不显示的目录
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_git_hl = 0
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_auto_close = 1
highlight NvimTreeFolderIcon guibg=blue
" }}}
" lable {{{
nnoremap tt :BufferLinePick<cr>
nnoremap tr :BufferLinePickClose<cr>
" }}}
" float-terminal vim 浮动终端{{{
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
" let g:floaterm_key_map_toggle = '<F12>'
" hi Floaterm guibg=black
hi Floaterm guibg=LightGra
nnoremap <f12> :FloatermToggle main<cr>
nnoremap <leader>th :FloatermNew htop<cr>
nnoremap <leader>tg :FloatermNew lazygit<cr>
nnoremap <leader>tt :FloatermNew --wintype=vsplit --width=0.2<cr>
tnoremap <f12> <C-\><C-n>:FloatermToggle<cr>
tnoremap <tab> <c-\><c-n><c-w>
" nnoremap <leader>tj :Floaterm
" hi FloatermBorder guibg=black
" }}}
" trans vim 翻译插件 {{{
let g:translator_proxy_url = 'socks5://127.0.0.1:10808'
let g:translator_window_type = 'popup'
nmap <leader>w <Plug>Translate
" }}}
" treesitter{{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "cpp",
    "c",
    "css",
    "html",
    "javascript",
    "yaml",
    --"comment",
    "bash",
    "php",
    "json",
    "python",
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
EOF
" }}}
" asynctasks {{{
" let g:asynctasks_term_pos = 'floaterm'
let g:asynctasks_term_pos = 'tab'
noremap <silent><f2> :AsyncTask one-file-run<cr>
noremap <silent><f3> :AsyncTask one-file-build<cr>
" }}}
" doxgen {{{
let g:DoxygenToolkit_briefTag_funcName = "yes"
" for C++ style, change the '@' to '\'
" let g:DoxygenToolkit_commentType = "C++"
" let g:DoxygenToolkit_briefTag_pre = "\\brief "
" let g:DoxygenToolkit_templateParamTag_pre = "\\tparam "
" let g:DoxygenToolkit_paramTag_pre = "\\param "
" let g:DoxygenToolkit_returnTag = "\\return "
" let g:DoxygenToolkit_throwTag_pre = "\\throw " " @exception is also valid
" let g:DoxygenToolkit_fileTag = "\\file "
" let g:DoxygenToolkit_dateTag = "\\date "
" let g:DoxygenToolkit_authorTag = "\\author "
" let g:DoxygenToolkit_versionTag = "\\version "
" let g:DoxygenToolkit_blockTag = "\\name "
" let g:DoxygenToolkit_classTag = "\\class "
let g:DoxygenToolkit_authorName = "xianyu, test@test.com"
let g:doxygen_enhanced_color = 1
" let g:DoxygenToolKit_startCommentBlock = "/// "
" let g:DoxygenToolKit_interCommentBlock = "/// "
"let g:load_doxygen_syntax = 1
let g:load_doxygen_syntax=1
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------"
" }}}
" lua 区域 {{{
if has("nvim")
lua<<EOF
    require('plugins')
    require('telescope').load_extension('coc')
    require('telescope').load_extension('ultisnips')
    require('telescope').load_extension('vim_bookmarks')
    require('telescope').load_extension('tele_tabby')
    require("cheatsheet").setup({
    bundled_cheatsheets = true,
    bundled_plugin_cheatsheets = true,
     bundled_plugin_cheatsheets = {
         disabled = {},
     },
    include_only_installed_plugins = true,
})
EOF
endif
"}}}
"vimspector {{{
" let g:vimspector_enable_mappings = 'HUMAN'
" let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
packadd! vimspector
"}}}
"maximizer{{{
let g:maximizer_set_default_mapping = 0
" let g:maximizer_default_mapping_key = 'ty'
nnoremap tg :MaximizerToggle<cr>
"}}}
" nnoremap <Leader>n :lua require'telescope.builtin'.find_files(require('telescope.themes').get_cursor({ winblend = 10 }))<cr>

