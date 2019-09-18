syntax on
let g:rehash256=1

set number
set wildmenu
set showcmd
set lazyredraw
set updatetime=500
set nocompatible
set t_Co=256
set expandtab
set shiftwidth=4
set smarttab
set tabstop=4
set background=dark
set hlsearch
set showmatch
set incsearch
set showmode
set ignorecase
set encoding=utf-8
" set modelines=0
set gdefault
set smartcase

set backspace=eol,start,indent
" set shell=/bin/bash
set mouse=a

set wrap
set colorcolumn=80
set formatoptions=qrn1

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

let mapleader=","

" Clear a search with \<space>
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>z :tabprevious<cr>
nnoremap <leader>x :tabnext<cr>
nnoremap / /\v
vnoremap / /\v

" open ag.vim
nnoremap <leader>a :Ag<space>

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

inoremap jj <ESC>

" sane movement with wrap turned on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk

filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" setup vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" Plugins:
Plug 'myusuf3/numbers.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'bitc/vim-bad-whitespace.git'
Plug 'kien/rainbow_parentheses.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rust-lang/rust.vim'

" Press ctrl+P to activate.
Plug 'ctrlpvim/ctrlp.vim'

" <Leader><Leader><motion> to use.
Plug 'easymotion/vim-easymotion'

" <command>ii to use (e.g. dii).
Plug 'michaeljsmith/vim-indent-object'

" <command>ia to use (e.g. dia).
Plug 'vim-scripts/argtextobj.vim'

" Initialize plugin system
call plug#end()

filetype plugin indent on

if has('nvim')
    let g:gitgutter_realtime=1
    set updatetime=250
endif

" airline customization
set noshowmode
set laststatus=2
let g:airline_powerline_fonts=1

" ctrlp customization
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files -co --exclude-standard']

" rainbow_parentheses customization
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" nerdtree customization
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeMouseMode=3
let g:NERDTreeShowHidden=1
