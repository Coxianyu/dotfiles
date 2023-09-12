"插件{{{
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'fannheyward/telescope-coc.nvim'
Plug 'booperlv/nvim-gomove'
Plug 'haringsrob/nvim_context_vt'
" 使用 tab 跳出括号等
Plug 'abecodes/tabout.nvim'
" 光标下划线
Plug 'yamatsum/nvim-cursorline'
Plug 'winston0410/cmd-parser.nvim'
Plug 'winston0410/range-highlight.nvim'

" 代码大纲插件
Plug 'stevearc/aerial.nvim'
Plug 'phaazon/hop.nvim'
Plug 'nvim-telescope/telescope-vimspector.nvim'
Plug 'mfussenegger/nvim-treehopper'
Plug 'vim-autoformat/vim-autoformat'
" Plug 'mhinz/vim-startify'
Plug 'tpope/vim-obsession'
Plug 'direnv/direnv.vim'
Plug 'samoshkin/vim-mergetool'
Plug 'szw/vim-maximizer'
Plug 'puremourning/vimspector',{'dir':'~/.config/nvim/pack/vimspector/opt/vimspector'}
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'sudormrfbin/cheatsheet.nvim'
" Plug 'GustavoKatel/telescope-asynctasks.nvim'
Plug 'TC72/telescope-tele-tabby.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'fhill2/telescope-ultisnips.nvim'
Plug 'tom-anders/telescope-vim-bookmarks.nvim'
" Plug 'dbeniamine/cheat.sh-vim'
" 翻译插件
Plug 'voldikss/vim-translator'
" theme
Plug 'glepnir/zephyr-nvim'
" vim 浮动终端
Plug 'voldikss/vim-floaterm'
" Plug 'sbdchd/neoformat'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'rhysd/clever-f.vim'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asyncrun.extra'
" Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
if !has('gui_running')
    Plug 'brglng/vim-im-select'
endif
Plug 'tpope/vim-unimpaired'
"以 [] 开头
" Plug 'liuchengxu/vim-which-key'
"通过 :Asyncrun 这个命令，异步执行请求 shell 命令
" theme
" 文本对象
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" 突出显示函数参数的插件
" Plug 'm-demare/hlargs.nvim'
" Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-indent'
" Plug 'kana/vim-textobj-syntax'
" Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
" Plug 'sgur/vim-textobj-parameter'

" 定义了几个文档对象 [,]-- 代表当前参数,[i] -- 代表当前所有缩进的代码 [f]--
" 函数对象， 可以使用 dif 来改变一个函数的内容
" 显示当前代码和版本库中的区别， 还有一些命令，Signifydiff
" if has('nvim') || has('patch-8.0.902')
Plug 'mhinz/vim-signify' 
" gutentags 的增强
" Plug 'skywind3000/gutentags_plus' 
Plug 'ConradIrwin/vim-bracketed-paste' 
" if filereadable('/bin/gtags') || filereadable('/usr/local/bin/gtags') || filereadable(expand("$HOME/.local/bin/gtags"))
"     Plug 'ludovicchabant/vim-gutentags'
" endif
Plug 'yianwillis/vimcdoc'
Plug 'w0rp/ale'
" Plug 'vimwiki/vimwiki'
Plug 'kien/rainbow_parentheses.vim'
Plug 'lambdalisue/vim-pager'
Plug 'lambdalisue/vim-manpager'
Plug 'luochen1990/rainbow'
" Plug 'tpope/vim-commentary' 
" Plug 'preservim/nerdcommenter'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-repeat' 
Plug 'nelstrom/vim-visual-star-search' 
Plug 'Yggdroot/LeaderF'
Plug 'voldikss/LeaderF-floaterm'
Plug 'skywind3000/LeaderF-snippet'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()
"}}} 
"set 指令{{{ 
" set splitbelow

" set runtimepath=~/.vim8,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim8/after
" set packpath=~/.vim8,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim8/after,~/.config/nvim
syntax on
set splitright
set mouse="a"
set relativenumber
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
" syntax off
"}}}
"nnoremap common {{{
let mapleader= ","
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nmap <leader>sa <Plug>(EasyAlign)
xmap <leader>sa <plug>(EasyAlign)
" nnoremap <tab> V>
nnoremap <s-tab> V<
nnoremap tl <c-w>l:bd!<cr>
nnoremap <tab>h <c-w>h
nnoremap <tab>j <c-w>j
nnoremap <tab>k <c-w>k
nnoremap <tab>l <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap ww :w<cr>
nnoremap we :qa!<cr>
nnoremap wq :wq<cr>
nnoremap wb :bd!<cr>
nnoremap <leader>ss :set hlsearch!<cr>
nnoremap <space> za
nnoremap H 0
nnoremap e :HopWord<cr>
nnoremap b :HopLine<cr>
nnoremap == :AutoformatLine<cr>
nnoremap <leader> :Asyncrun
nnoremap <f2> :Autoformat<cr>
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
" nnoremap <c-j> :bprevious<cr>
" nnoremap <c-k> :bnext<cr>
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
inoremap <c-a> <c-o>0
inoremap <c-e> <c-o>$
" inoremap jj <c-[>
inoremap <c-x><c-k> <c-x><c-k>
" if !has("gui_running")
"     inoremap <esc> <nop>
" endif
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
    let g:Lf_Gtagsconf = "/etc/gtags/gtags.conf"
    let $GTAGSCONF = "/etc/gtags/gtags.conf"
endif
let g:Lf_PreviewPopupWidth = 80
let g:Lf_PreviewPopupWidth = 80
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_GtasgsGutentags = 1
let g:Lf_CacheDirectory = expand('~')
let g:Lf_gutentags_cache_dir = expand(g:Lf_CacheDirectory.'/.cache/tags')
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

" leaderf task{{{
function! s:lf_task_source(...)
	let rows = asynctasks#source(&columns * 48 / 100)
	let source = []
	for row in rows
		let name = row[0]
		let source += [name . '  ' . row[1] . '  : ' . row[2]]
	endfor
	return source
endfunction


function! s:lf_task_accept(line, arg)
	let pos = stridx(a:line, '<')
	if pos < 0
		return
	endif
	let name = strpart(a:line, 0, pos)
	let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
	if name != ''
		exec "AsyncTask " . name
	endif
endfunction

function! s:lf_task_digest(line, mode)
	let pos = stridx(a:line, '<')
	if pos < 0
		return [a:line, 0]
	endif
	let name = strpart(a:line, 0, pos)
	return [name, 0]
endfunction

function! s:lf_win_init(...)
	setlocal nonumber
	setlocal nowrap
endfunction


let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
let g:Lf_Extensions.task = {
			\ 'source': string(function('s:lf_task_source'))[10:-3],
			\ 'accept': string(function('s:lf_task_accept'))[10:-3],
			\ 'get_digest': string(function('s:lf_task_digest'))[10:-3],
			\ 'highlights_def': {
			\     'Lf_hl_funcScope': '^\S\+',
			\     'Lf_hl_funcDirname': '^\S\+\s*\zs<.*>\ze\s*:',
			\ },
			\ 'help' : 'navigate available tasks from asynctasks.vim',
		\ }
" }}}
"leaderf keybinding {{{
nnoremap <leader>fgr :<C-U><C-R>=printf("Leaderf gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
nnoremap <leader>fp  :Leaderf --nowrap task<cr>
nnoremap <leader>fF  :Leaderf function<cr>
nnoremap <leader>ff  :Leaderf file<cr>
nnoremap <c-m>       :Leaderf function<cr>
nnoremap <leader>fb  :Leaderf buffer<cr>
nnoremap <leader>fB  :Leaderf buffer --all<cr>
nnoremap <leader>ftt :Leaderf tag<cr>
nnoremap <leader>fa  :LeaderfFunction <cr>
nnoremap <leader>fA  :LeaderfFunctionAll <cr>
nnoremap <leader>fl  :LeaderfLine<cr>
nnoremap <leader>fL  :LeaderfLineAll<cr>
nnoremap <leader>fh  :LeaderfHistoryCmd<cr>
nnoremap <leader>fH  :LeaderfHistorySearch<cr>
nnoremap <leader>fv  :LeaderfHelp<cr>
nnoremap <leader>fz  :Leaderf snippet<cr>
nnoremap <leader>fq  :LeaderfQuickFix<cr>
nnoremap <leader>fri :LeaderfRgInteractive<cr>
nnoremap <leader>frI :LeaderfRgRecall<cr>
nnoremap <leader>fi  :LeaderfFiletype<cr>
nnoremap <leader>fs  :LeaderfCommand<cr>
nnoremap <leader>fm  :Leaderf mru<cr>
nnoremap <leader>fq  :LeaderfQuickFix<cr>
nnoremap <leader>fj  :Leaderf jumps<cr>
nnoremap <leader>fgt :Leaderf gtags<cr>
nnoremap <leader>fw  :Leaderf floaterm<cr>
nnoremap <c-p>       :Leaderf command<cr>
nnoremap <leader>f;  :execute VspLeaderFile()<cr>
function VspLeaderFile()
    :vsp
    :Leaderf file
endfunction
" nnoremap <leader>fo  :Leaderf! 
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
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"    
"}}}
" indentLine 缩进显示线 {{{
" let g:indentLine_setClors = 0
" let g:indentLine_char = '┊'
" }}}
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
"coc.nvim config {{{
" <c-l> 确认补全
inoremap <silent><expr> <c-l> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<c-p>'
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" let g:coc_snippet_next = '<c-n>'
" let g:coc_snippet_prev = '<c-p>'
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
            \ "coc-db",
            \ "coc-sh",
            \ "coc-json",
            \ "coc-phpls"]
xmap <leader>qf  <Plug>(coc-format-selected)
nmap <leader>qf  <Plug>(coc-format-selected)
nmap <leader>qR <Plug>(coc-rename)
nmap <leader>qF  <Plug>(coc-fix-current)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <leader>qd <Plug>(coc-definition)
nmap <leader>ql  <Plug>(coc-codelens-action)
nmap <leader>qe :<C-u>CocList diagnostics<cr>
" nnoremap <silent><nowait> <leader>qD :call CocActionAsync('jumpDefinition', v:false)<CR>
nnoremap <silent><nowait> <leader>qD :call CocAction('jumpDefinition', 'vsplit')<CR>
" nnoremap <silent><nowait> <leader>qE :call CocActionAsync('jumpReferences', v:false)<CR>
nnoremap <silent><nowait> <leader>qE :call CocAction('jumpReferences', 'vsplit')<CR>
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
    execute 'vsp /tmp/tmp'
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
command! -nargs=? Fold   :call CocAction('fold', <f-args>)
command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')
" }}}
" neoformat 语言格式化插件{{{
" }}}
" NVIMTREE {{{
nnoremap <f1> :NvimTreeToggle<cr>
nnoremap <f3> :AerialToggle left<cr>
" NVIMTREE 宽度
let g:nvim_tree_width = 25 "30 by default, can be width_in_columns or 'width_in_percent%'
" 不显示的目录
" let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
" let g:filters.custom = ['.git', 'node_modules', '.cache' ]
" let g:nvim_tree_git_hl = 0
" let g:nvim_tree_highlight_opened_files = 1
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
" hi Floaterm guibg=LightGra
nnoremap <f12> :FloatermToggle main<cr>
nnoremap <leader>rh :FloatermNew --name=htop htop<cr>
" nnoremap <leader>rh :FloatermNew  htop<cr>
nnoremap <leader>rg :FloatermNew --name=lazygit lazygit<cr>
nnoremap <leader>rl :FloatermNew --wintype=vsplit --width=0.4<cr>
nnoremap <leader>rr :FloatermNew --name=ranger ranger<cr>
nnoremap <leader>rw :FloatermNew --name=
tnoremap <f12> <C-\><C-n>:FloatermToggle<cr>
" tnoremap <f2> <C-\><C-n>:FloatermToggle<cr>
" tnoremap <f3> <C-\><C-n>:FloatermToggle<cr>
tnoremap ,, <c-\><c-n><c-w>h
" nnoremap <leader>tj :Floaterm
" hi FloatermBorder guibg=black
" }}}
" trans vim 翻译插件 {{{
" let g:translator_proxy_url = 'socks5://192.168.16.50:10808'
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
lua<<EOF
require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
require("aerial").setup({
  -- Priority list of preferred backends for aerial.
  -- This can be a filetype map (see :help aerial-filetype-map)
  backends = { "treesitter", "lsp", "markdown" },
  width = 40,
  max_width = { 40, 0.2 }
  })
EOF
lua<<EOF
require('tabout').setup {
    tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
    backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
    act_as_tab = true, -- shift content if tab out is not possible
    act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    enable_backwards = true, -- well ...
    completion = true, -- if the tabkey is used in a completion pum
    tabouts = {
      {open = "'", close = "'"},
      {open = '"', close = '"'},
      {open = '`', close = '`'},
      {open = '(', close = ')'},
      {open = '[', close = ']'},
      {open = '{', close = '}'}
    },
    ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
    exclude = {} -- tabout will ignore these filetypes
}
EOF

endif
"}}}
"vimspector {{{

if (!has('win32'))
    packadd! vimspector
endif

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
nnoremap <leader>ta :lua require('telescope').extensions.asynctasks.all()<cr>
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
EOF
" }}}
" nerdcommenter 代码注释插件 {{{
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
" }}}
" vim-mergetool{{{
let g:mergetool_layout = 'LmR'
let g:mergetool_prefer_revision = 'local'
nmap <leader>mt <plug>(MergetoolToggle)
nnoremap <silent> <leader>mb :call mergetool#toggle_layout('LbR,m')<CR>
nnoremap <silent> <leader>mr :call mergetool#toggle_layout('LmR')<CR>
" }}}
" vim-treesitter-textobject 添加的新的文本对象{{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}
EOF

" init.vim
"
" Use better keys for the bépo keyboard layout and set
" a balanced distribution of terminal / sequence keys
lua require'hop'.setup { keys = 'etovxqpdygfblzhckisuran', jump_on_sole_occurrence = false }
lua require("aerial").setup({ backends = { "treesitter", "lsp", "markdown"},manage_folds = true,link_folds_to_tree = true})
" lua require('hlargs').enable()
lua require('range-highlight').setup{}
lua << EOF
require('Comment').setup({mappings = {
        basic = true,
        extra = true,
        extended = true
        }})
EOF

if (!has('win32'))
lua<<EOF
vim.opt.list = true
vim.opt.listchars:append("eol:↴")
require("indent_blankline").setup {
    show_end_of_line = true,
}
EOF
endif
" }}}
if has('win32')
    helptags $HOMEPATH\AppData\Local\nvim\doc
else
    helptags $HOME/.config/nvim/doc
endif
omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
vnoremap <silent> m :lua require('tsht').nodes()<CR>

