set nocompatible
set encoding=utf-8
set t_Co=256

set number
set showmode
set wildmenu
set showcmd
set colorcolumn=80,100

set nofoldenable
set wrap
set scrolloff=2
set backspace=indent,eol,start

set shiftwidth=4
set smarttab
set tabstop=4
set expandtab

set hlsearch
set ignorecase
set smartcase

set backup
set writebackup
set backupdir=~/.vim/cache
set directory=~/.vim/cache
set updatetime=500
set modelines=0  " CVE-2007-2438

syntax on
filetype plugin indent on

" file format preferences
autocmd FileType go setlocal noexpandtab
autocmd FileType yml setlocal tabstop=2 shiftwidth=2 expandtab
