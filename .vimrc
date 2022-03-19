set nocompatible
set encoding=utf-8
set t_Co=256

set number
set showmode
set wildmenu
set showcmd
set colorcolumn=80,100
set shortmess-=S

"statusline
set laststatus=2
set statusline=%f  "filename
set statusline+=%=  "empty space
set statusline+=\ 0x%B  "character under cursor
set statusline+=\ %y  "filetype
set statusline+=\ %{&fileencoding}
set statusline+=\ %{&fileformat}
set statusline+=\ %L  "total lines count
set statusline+=\ %l:%c  "row:col

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
set modelines=0  "CVE-2007-2438

syntax on
filetype plugin indent on

"file format preferences
autocmd FileType go setlocal noexpandtab
autocmd FileType make setlocal noexpandtab
autocmd FileType yml setlocal tabstop=2 shiftwidth=2 expandtab

"exclude pass files from cache
autocmd BufNewFile,BufRead /private/**/pass** setlocal noswapfile nobackup noundofile

"snippets
iabbrev ipdb import ipdb; ipdb.set_trace()
