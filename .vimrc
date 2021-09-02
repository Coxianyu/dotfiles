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
colorscheme desert
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
nnoremap we :q!<cr>
nnoremap wq :wq<cr>
nnoremap wb :bd<cr>
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
