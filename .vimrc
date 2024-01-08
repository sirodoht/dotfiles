set nocompatible
set encoding=utf-8
set t_Co=256

set number
set showmode
set wildmenu
set showcmd
set colorcolumn=88
set shortmess-=S

" status line
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
set backspace=indent,eol,start

set hlsearch
set ignorecase
set smartcase

set shiftwidth=4
set smarttab
set tabstop=4
set expandtab

" file format preferences
filetype plugin indent on
autocmd FileType go setlocal noexpandtab
autocmd FileType make setlocal noexpandtab
autocmd FileType yml setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType json setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.csm set tabstop=2 shiftwidth=2 expandtab

set backup
set writebackup
set backupdir=~/.vim/cache
set directory=~/.vim/cache
set updatetime=500
set modelines=0  "CVE-2007-2438

" exclude pass files from cache
autocmd BufNewFile,BufRead /private/**/pass** setlocal noswapfile nobackup noundofile

" restore cursor location when a file is opened
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute("normal `\"") |
    \ endif
