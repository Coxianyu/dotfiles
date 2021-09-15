"插件{{{
call plug#begin()

Plug 'nvim-telescope/telescope-vimspector.nvim'
Plug 'samoshkin/vim-mergetool'
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
" Plug 'dbeniamine/cheat.sh-vim'
" 翻译插件
Plug 'voldikss/vim-translator'
" theme
Plug 'glepnir/zephyr-nvim'
" vim 浮动终端
Plug 'voldikss/vim-floaterm'
Plug 'sbdchd/neoformat'
Plug 'junegunn/vim-easy-align'
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
if filereadable('/bin/gtags') || filereadable('/usr/local/bin/gtags') || filereadable(expand("$HOME/.local/bin/gtags"))
    Plug 'ludovicchabant/vim-gutentags'
endif
Plug 'yianwillis/vimcdoc'
Plug 'w0rp/ale'
" Plug 'vimwiki/vimwiki'
Plug 'kien/rainbow_parentheses.vim'
Plug 'lambdalisue/vim-pager'
Plug 'lambdalisue/vim-manpager'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-commentary' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-repeat' 
Plug 'nelstrom/vim-visual-star-search' 
Plug 'Yggdroot/LeaderF'
Plug 'voldikss/LeaderF-floaterm'
Plug 'skywind3000/LeaderF-snippet'
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
set foldlevelstart=99
set fdm=marker
set foldcolumn=1
set shiftwidth=4
set softtabstop=4
set expandtab
if (!has("nvim"))
    set wildmode=longest:list,full
    set wildmenu
endif
set nu
set autoread
set cmdheight=2
set ai
set hidden
set noeb
set shortmess+=c
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
set nocompatible
set t_Co=256
syntax on
" syntax off
"}}}
"nnoremap common {{{
let mapleader= ","
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nmap <leader>sa <Plug>(EasyAlign)
xmap <leader>sa <plug>(EasyAlign)
nnoremap <tab> V>
nnoremap <s-tab> V<
nnoremap tl <c-w>l:bd!<cr>
nnoremap <tab>h <c-w>h
nnoremap <tab>j <c-w>j
nnoremap <tab>k <c-w>k
nnoremap <tab>l <c-w>l
nnoremap ww :w<cr>
nnoremap we :qa!<cr>
nnoremap wq :wq<cr>
nnoremap wb :bd<cr>
nnoremap <leader>ss :set hlsearch!<cr>
nnoremap <space> za
nnoremap H 0
nnoremap <leader> :Asyncrun
nnoremap L $
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l
nnoremap <leader>k <c-w>k
nnoremap <leader>j <c-w>j
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
inoremap <c-n> <down>
inoremap <c-p> <up>
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
let g:signify_disable_by_default = 1

"}}}
"gtags 使用 {{{
" pip 安装 pygments flake8 autopep8
"ycm 手动编译安装
let $GTAGSLABEL = 'native-pygments' 
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
if filereadable(expand("$HOME/.local/share/gtags/gtags.conf")) 
    let g:Lf_Gtagsconf = $HOME."/.local/share/gtags/gtags.conf"
    let $GTAGSCONF = $HOME."/.local/share/gtags/gtags.conf"
else 
    let g:Lf_Gtagsconf = "/usr/local/share/gtags/gtags.conf"
    let $GTAGSCONF = "/usr/local/share/gtags/gtags.conf"
endif
let g:Lf_PreviewPopupWidth = 80
let g:Lf_PreviewPopupWidth = 80
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_GtasgsGutentags = 1
let g:Lf_CacheDirectory = expand('~')
let g:Lf_gutentags_cache_dir = $HOME."/.cache/tags"
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
nnoremap <leader>fm  :Leaderf mru<cr>
nnoremap <leader>fq  :LeaderfQuickFix<cr>
nnoremap <leader>fj   :Leaderf! jumps<cr>
nnoremap <leader>fgt :Leaderf! gtags<cr>
nnoremap <leader>fw  :Leaderf! floaterm<cr>
nnoremap <c-p>   :Leaderf command<cr>
" LeaderfColorscheme 切换vim主题配色
" LeaderfFiletype  改变当前文件的 FileType
" LeaderCommand  查询vim内建的ex命令和用户定义的命令
" LeaderfWindow  查询vim 窗口
" LeaderfQuickFix 查询vim 的QuickFix 窗口
"}}}
"}}}
"ale 代码检测插件的配置{{{
" 和 coc.nvim 配合使用
"
let g:ale_completion_enabled = 0
let g:ale_floating_preview = 1
let g:ale_close_preview_on_insert = 1
let g:Lf_ShowHidden = 1
"let g:ale_cursor_detail = 1
let g:ale_echo_cursor = 1
let g:ale_detail_to_floating_preview = 1
let g:ale_sign_error = "e"
let g:ale_sign_warning = "w "
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
let g:which_key_map={}
let g:which_key_sep = '→'
" set timeoutlen=100
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
            \'z':'查询 snippets '
            \}
let g:which_key_map.f.g = {
            \'name':'+leaderf-gatgs',
            \'t':'查询真个项目中的函数定义和宏定义',
            \'r':'查询光标下函数引用',
            \}
let g:which_key_map.r = {
            \'name':'+floaterm',
            \'g':'lazygit',
            \'h':'htop',
            \'t':'vsplit windows',
            \}
let g:which_key_map.t = {
            \'f':'查询文件',
            \'F':'查询函数',
            \'H':'查询执行过的用户自定义命令',
            \'r':'grep 字符串',
            \'l':'搜索行',
            \'N':'git_files',
            \'c':'git_commits',
            \'C':'git_bcommits',
            \'L':'git_branches',
            \'s':'git_stash',
            \'o':'command_history',
            \'S':'search_history',
            \'m':'man_pages',
            \'M':'mark',
            \'R':'寄存器',
            \'p':'suggest_spell',
            \'k':'tagstack',
            \'y':'symbols',
            \'Y':'git_status',
            \'q':'quickfix',
            \'B':'bookmarks all',
            \'n':'bookmarks current_file',
            \'v':'ultisnips',
            \'d':'TODOlist',
            \'g':'floaterm',
            \'e':'diagnostics current_file',
            \'E':'diagnostics all buffer',
            \'b':'buffer',
            \'u':'mru',
            \'i':'help_tags',
            \}
let g:which_key_map.k="显示当前光标下的说明"
let g:which_key_map.q = {
            \'name':'+coc',
            \'d':'跳转到定义',
            \'D':'垂直分屏查询定义',
            \'F':'Fix-current-buffer',
            \'f':'格式化代码',
            \'i':'查询implementaation',
            \'r':'查询引用',
            \'R':'重命名',
            \'y':'查询type定义',
            \'E':'查询函数引用'
            \}
let g:which_key_map.w = {
            \'name':'+quit',
            \'q':'不保存退出vim',
            \'e':'保存退出vim',
            \'w':'保存文件'
            \}
let g:which_key_map.d ={
            \'name':'+vimspector',
            \'SPC':'调试继续运行',
            \'c':'运行到光标处',
            \'d':'启动vimspector',
            \'e':'关闭 vimspector',
            \'j':'stepover',
            \'k':'stepout',
            \'L':'显示所有断点',
            \'l':'单步调试',
            \'p':'暂停调试',
            \'r':'重启调试',
            \'W':'删除watch',
            \'w':'添加watch',
            \'y':'清除所有断点',
            \}
let g:which_key_map.d.b = {
            \'B':'设置条件断点',
            \'b':'设置断点',
            \'p':'设置函数断点',
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
        \}
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

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

" <cr> 确认补全
let g:coc_snippet_next = '<tab>'
autocmd FileType markdown let b:coc_pairs_disabled = ['`']
let g:coc_global_extensions = [
            \ "coc-tsserver",
            \ "coc-snippets",
            \ "coc-lists",
            \ "coc-highlight",
            \ "coc-pyright",
            \ "coc-tasks",
            \ "coc-floaterm",
            \ "coc-word",
            \ "coc-clangd",
            \ "coc-calc",
            \ "coc-pairs",
            \ "coc-sh",
            \ "coc-json"]
xmap <leader>qf  <Plug>(coc-format-selected
nmap <leader>qf  <Plug>(coc-format-selected)
nmap <leader>qR <Plug>(coc-rename)
nmap <leader>qF  <Plug>(coc-fix-current)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <leader>qd <Plug>(coc-definition)
nnoremap <silent><nowait> <leader>qD :call CocActionAsync('jumpDefinition', v:false)<CR>
nnoremap <silent><nowait> <leader>qE :call CocActionAsync('jumpReferences', v:false)<CR>
nmap <silent> <leader>qy <Plug>(coc-type-definition)
nmap <silent> <leader>qi <Plug>(coc-implementation)
nmap <silent> <leader>qr <Plug>(coc-references)
nnoremap <silent>K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'vert h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <leader>i :call <SID>showdo()<CR>
function! s:showdo()
      execute 'vert h '.expand('<cword>')
endfunction
function! s:test()
    let @a=join(CocAction('getHover'))
    execute 'vsp tmp'
    execute 'set filetype=help'
    execute "put a"
endfunction
nnoremap <leader>K :call <SID>test()<cr>
autocmd cursorhold * silent call CocActionAsync('highlight')
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
if has('nvim-0.4.0')
  nnoremap <silent><nowait><expr> <c-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<c-f>"
  nnoremap <silent><nowait><expr> <c-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<c-b>"
  inoremap <silent><nowait><expr> <c-z> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<right>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
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
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
" }}}
" float-terminal vim 浮动终端{{{
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
" let g:floaterm_key_map_toggle = '<F12>'
" hi Floaterm guibg=black
hi Floaterm guibg=LightGra
nnoremap <f12> :FloatermToggle main<cr>
nnoremap <leader>rh :FloatermNew htop<cr>
nnoremap <leader>rg :FloatermNew lazygit<cr>
nnoremap <leader>rl :FloatermNew --wintype=vsplit --width=0.4<cr>
tnoremap <f12> <C-\><C-n>:FloatermToggle<cr>
tnoremap <f2> <C-\><C-n>:FloatermToggle<cr>
tnoremap <f3> <C-\><C-n>:FloatermToggle<cr>
tnoremap ,, <c-\><c-n><c-w>h
" nnoremap <leader>tj :Floaterm
" hi FloatermBorder guibg=black
" }}}
" trans vim 翻译插件 {{{
let g:translator_proxy_url = 'socks5://192.168.1.101:10808'
let g:translator_window_type = 'popup'
nmap <leader>w <Plug>Translate
xmap <leader>w <Plug>Translate
" }}}
" asynctasks {{{
" let g:asynctasks_term_pos = 'floaterm'
let g:asynctasks_term_pos = 'tab'
noremap <silent><f5> :AsyncTask one-file-run<cr>
noremap <silent><f6> :AsyncTask one-file-build<cr>
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
packadd! vimspector
" let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <leader>dd :call vimspector#Launch()<cr>
nnoremap <leader>de :call vimspector#Reset()<cr>
nnoremap <leader>dy :call vimspector#CleanLineBreakpoint()<cr>
nmap <leader>dl <Plug>VimspectorStepInto
nmap <f9> <plug>VimspectorToggleBreakpoint
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimsepctorStepOut
nmap <leader>dp :call vimspector#Pause()<cr>
nmap <leader>dr :call vimspector#Restart()<cr>
nnoremap <leader>d<space> :call vimspector#Continue()<cr>
nmap <leader>dw :call vimspector#AddWatch()<cr>
nmap <leader>dW :call vimspector#DeleteWatch()<cr>
nmap <leader>dc <Plug>VimspectorRunToCursor
nmap <leader>dbb <Plug>VimspectorToggleBreakpoint
nmap <leader>dbB <Plug>VimspectorToggleConditionalBreakpoint
nnoremap <leader>dL :call vimspector#ListBreakpoints()<cr>
nmap <leader>dbp :call vimspector#AddFunctionBreakpoint(
"}}}
"maximizer{{{
let g:maximizer_set_default_mapping = 0
" let g:maximizer_default_mapping_key = 'ty'
nnoremap tg :MaximizerToggle<cr>
"}}}
" cheat sheet {{{
nnoremap <leader>? :Cheatsheet<cr>
" }}}
" Telescope {{{
nnoremap <leader>tf :Telescope find_files<cr>
nnoremap <leader>tF :CocList outline method<cr>
nnoremap <leader>tH :Telescope commands<cr>
nnoremap <leader>th :Telescope highlight<cr>
nnoremap <leader>tr :Telescope grep_string<cr>
nnoremap <leader>tl :Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>tN :Telescope git_files<cr>
nnoremap <leader>tc :Telescope git_commits<cr>
nnoremap <leader>tC :Telescope git_bcommits<cr>
nnoremap <leader>tL :Telescope git_branches<cr>
nnoremap <leader>ts :Telescope git_stash<cr>
nnoremap <leader>to :Telescope command_history<cr>
nnoremap <leader>tS :Telescope search_history<cr>
nnoremap <leader>tm :Telescope man_pages<cr>
nnoremap <leader>tM :Telescope marks<cr>
nnoremap <leader>tR :Telescope register<cr>
nnoremap <leader>tp :Telescope spell_suggest<cr>
nnoremap <leader>tk :Telescope tagstack<cr>
nnoremap <leader>tK :Telescope keymaps<cr>
nnoremap <leader>ty :Telescope symbols<cr>
nnoremap <leader>tY :Telescope git_status<cr>
nnoremap <leader>tq :Telescope quickfix<cr>
nnoremap <leader>tb :Telescope buffers<cr>
nnoremap <leader>tB :Telescope vim_bookmarks all<cr>
nnoremap <leader>tn :Telescope vim_bookmarks current_file<cr>
nnoremap <leader>tv :Telescope ultisnips<cr>
nnoremap <leader>td :TodoTelescope<cr>
nnoremap <leader>tg :CocList floaterm<cr>
nnoremap <leader>te :Telescope coc diagnostics<cr>
nnoremap <leader>tE :Telescope coc workspace_diagnostics<cr>
nnoremap <leader>tu :Telescope coc mru theme=get_cursor<cr>
nnoremap <leader>ti :Telescope help_tags<cr>
nmap <leader>ta <plug>(ale_hover)
" Telescope find_files theme=get_dropdown

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
" vim-mergetool{{{
let g:mergetool_layout = 'LmR'
let g:mergetool_prefer_revision = 'local'
nmap <leader>mt <plug>(MergetoolToggle)
nnoremap <silent> <leader>mb :call mergetool#toggle_layout('LbR,m')<CR>
nnoremap <silent> <leader>mr :call mergetool#toggle_layout('LmR')<CR>
" }}}
helptags ~/.config/nvim/doc
