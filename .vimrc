syntax on
colorscheme molokai  " https://github.com/tomasr/molokai
" let g:molokai_original=1
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

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
Plugin 'myusuf3/numbers.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'bitc/vim-bad-whitespace.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'rking/ag.vim'
"Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'digitaltoad/vim-pug'
"Plugin 'Shutnik/jshint2.vim'
Plugin 'rust-lang/rust.vim'

" Press ctrl+P to activate.
Plugin 'ctrlpvim/ctrlp.vim'

" <Leader><Leader><motion> to use.
Plugin 'easymotion/vim-easymotion'

" <command>ii to use (e.g. dii).
Plugin 'michaeljsmith/vim-indent-object'

" <command>ia to use (e.g. dia).
Plugin 'vim-scripts/argtextobj.vim'

" F2 to pastebin selection.
"Plugin 'skorokithakis/pastery.vim'

call vundle#end()            " required

filetype plugin indent on

if has('nvim')
    let g:gitgutter_realtime=1
    set updatetime=250
endif

" airline customization
set noshowmode
set laststatus=2
let g:airline_powerline_fonts=1

" pastery customization
let g:pastery_apikey='pBXxYPYKJUoxojQzKDANSZUYke5w2bLz'

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

" jshint2 customization
let jshint2_read = 1
let jshint2_save = 1

