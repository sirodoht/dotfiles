syntax on
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
set hlsearch
set showmatch
set incsearch
set showmode
set ignorecase
set encoding=utf-8
set gdefault
set smartcase

set backspace=eol,start,indent
set mouse=a

set wrap
set colorcolumn=88
set formatoptions=qrn1

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

filetype indent on

if has('nvim')
    let g:gitgutter_realtime=1
    set updatetime=250
endif
