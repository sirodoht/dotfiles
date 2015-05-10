" Modeline and Notes {
" vim: set sw=4 ts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
"   An assembly of various hunks of .vimrc files, tailored to my preferences
"   and widely based on spf13-vim (http://vim.spf13.com).
"
" }

" Environment {

    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return (has('win16') || has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible " be iMproved, required in first line
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
            set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }

" }

" Use before config if available {
    if filereadable(expand("~/.vimrc.before"))
        source ~/.vimrc.before
    endif
" }

" Use bundles config {
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif
" }

" General {

    set background=dark         " Assume a dark background
    " if !has('gui')
        "set term=$TERM         " Make arrow and other keys work
    " endif
    filetype plugin indent on   " Automatically detect file types
    syntax on

" }


" Vundle and other stuff {

    filetype off                  " required

    " Setting up Vundle - the vim plugin bundler
    let iCanHazVundle = 1
    let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
    if !filereadable(vundle_readme)
        echo 'Installing Vundle...'
        echo ''
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        let iCanHazVundle=0
    endif

    " Set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " Let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    " The following are examples of different formats supported.
    " Keep Plugin commands between vundle#begin/end.
    " plugin on GitHub repo
    Plugin 'L9'
    Plugin 'bling/vim-airline'
    Plugin 'bling/vim-bufferline'
    Plugin 'tpope/vim-fugitive'
    Plugin 'kien/ctrlp.vim'
    Plugin 'sjl/gundo.vim'
    Plugin 'mbbill/undotree'
    Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'myusuf3/numbers.vim'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'scrooloose/syntastic'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'FuzzyFinder'
    Plugin 'msanders/snipmate.vim'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required

    " Uncomment the following to have Vim load indentation rules and plugins
    " according to the detected filetype.
    if has("autocmd")
        filetype plugin indent on
        " Prevent auto-commenting
        autocmd filetype * set formatoptions-=c formatoptions-=r formatoptions-=o
    endif

" }

" General Preferences {

    set history=700         " How many lines of history to remember
    set autoread            " Auto-read when a file is changed externally
    "set autowrite          " Automatically save before commands like :next and :make

" }

" Vim UI Preferences {

    set so=7
    set wildmenu            " Turn on the WiLd menu
    set ruler               " Always show current position

    " Configure backspace so it acts as it should act
    set backspace=eol,start,indent
    set whichwrap+=<,>,h,l

    set showmatch           " Show matching brackets
    set mat=2               " How many 1/10sec to blink when matching brackets

    set ignorecase          " Do case insensitive matching
    set smartcase           " Do smart case matching
    set incsearch           " Incremental search
    set hlsearch            " Highlight search patterns
    "set hidden              " Hide buffers when they are abandoned
    set lazyredraw          " Don't redraw while executing macros (performance)
    set magic               " For regular expressions turn magic on

    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500

    "set colorcolumn=81      " Visible column boundary at 81th column
    set mouse=a             " Enable mouse usage (all modes)
    set nu                  " Show line numbers

" }

" Status Line {

    set laststatus=2        " Always show the status line

    " vim-airline options
    let g:airline_detect_modified=1
    let g:airline_detect_paste=1
    let g:airline_detect_iminsert=0
    let g:airline_inactive_collapse=1
    let g:airline_theme='powerlineish'
    let g:airline_powerline_fonts=0
    let g:airline#extensions#bufferline#enabled=1

    " Hide the default status indicators
    set noshowmode

    " Fix annoying shit with bufferline
    let g:bufferline_echo=0

" }

" Colors and Fonts {

    set t_Co=256		" Use 256 colors
    syntax on               " Turn syntax highlighing on
    set background=dark     " Nobody uses a light terminal any more

    " Check if the color scheme exists and download it if not
    let irblack_theme=expand('~/.vim/colors/ir_black.vim')
    if !filereadable(irblack_theme)
        echo 'Installing IR_Black Theme...'
        echo ''
        silent !mkdir -p ~/.vim/colors
        silent !curl http://blog.toddwerth.com/entry_files/8/ir_black.vim -o ~/.vim/colors/ir_black.vim
    endif

    let monokai_theme=expand('~/.vim/colors/molokai.vim')
    if !filereadable(monokai_theme)
        echo 'Installing Monokai Theme...'
        echo ''
        silent !curl https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -o ~/.vim/colors/molokai.vim
    endif

    colorscheme molokai	" Pretty obvious...

    set encoding=utf8       " Set UTF-8 as standard encoding
    set ffs=unix,dos,mac    " Use Unix as the standard file type

    " Set extra options when running in GUI mode
    if has('gui_running')
        set guioptions-=T
        set guioptions+=e
        set guitablabel=%M\ %t
        set guifont=Menlo\ for\ Powerline
        let g:airline_powerline_fonts=1
    endif

" }

" Text, Tab and Indent related stuff {

    "set expandtab           " Use spaces instead of tabs
    set smarttab            " Be smart when using tabs ;)

    " 1 tab = 4 spaces
    set shiftwidth=4
    set tabstop=4

    set ai                  " Auto indent ON
    set si                  " Smart indent ON
    set wrap                " Wrap lines ON

    " Indent guides on startup
    let g:indent_guides_enable_on_vim_startup=1

" }

" Visual Mode {

    " Visual mode pressing * or # searches for the current selection
    " Super useful! From an idea by Michael Naumann
    vnoremap <silent> * :call VisualSelection('f')<CR>
    vnoremap <silent> # :call VisualSelection('b')<CR>

" }

" Moving arround, tabs, windows and buffers {

    " Treat long lines as break lines
    map j gj
    map k gk

    " Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
    "map <space> /
    "map <c-space> ?

    " Disable highlight when <leader><cr> is pressed
    map <silent> <leader><cr> :noh<cr>

    " Smart way to move between windows
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

    " Close the current buffer
    map <leader>ba :1,1000 bd!<cr>

    " Useful mappings for managing tabs
    map <leader>tn :tabnew<cr>
    map <leader>to :tabonly<cr>
    map <leader>tc :tabclose<cr>
    map <leader>tm :tabmove<cr>

    " Opens a new tab with the current buffer's path
    " Super useful when editing files in the same directory
    "map <leader>te :tabedit <c-r>=expand('%:p:h')<cr>/

    " Switch CWD to the directory of the open buffer
    map <leader>cd :cd %:p:h<cr>:pwd<cr>

    " Specify the behaviour when switching between buffers
    try
        set switchbuf=useopen,usetab,newtab
        "set stal=2
    catch
    endtry

    " Return to the last edit position when opening files
    if has("autocmd")
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif

    " Remember info about open buffers on close
    set viminfo^=%

" }

" Editing Mappings {

    map 0 ^                 " Remap VIM 0 to first non-blank character

    " Move a line of text using ALT+[jk] or Command+[jk] on mac
    nmap <M-j> mz:m+<cr>`z
    nmap <M-k> mz:m-2<cr>`z
    vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
    vmap <M-j> :m'>-2<cr>`<my`>mzgv`yo`z

    if has('mac') || has('macunix')
        nmap <D-j> <M-j>
        nmap <D-k> <M-k>
        vmap <D-j> <M-j>
        vmap <D-k> <M-k>
    endif

    " Delete trailing white space on save
    func! DeleteTrailingWS()
        exe 'normal mz'
        %s/\s\+$//ge
        exe 'normal `z'
    endfunc
    autocmd BufWrite * :call DeleteTrailingWS()

    " Automatically close HTML tags with </<space>
    imap <C-Space> <C-X><C-O>

" }

" vimgrep searching and cope displaying {

    " When you press gv you vimgrep after the selected text
    vnoremap <silent> gv :call VisualSelection('gv')<CR>

    " Open vimgrep and put the cursor in the right position
    map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

    " Vimgreps in the current file
    map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

    " When you press <leader>r you can search and replace the selected text
    vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

    " Do :help cope if you are unsure what cope is. It's super useful!
    "
    " When you search with vimgrep, display your results in cope by doing:
    "   <leader>cc
    "
    " To go to the next search result do:
    "   <leader>n
    "
    " To go to the previous search results do:
    "   <leader>p
    "
    map <leader>cc :botright cope<cr>
    map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>

" }

" Spell Checking {

    " Pressing \ss will toggle and untoggle spell checking
    map <leader>ss :setlocal spell!<cr>

    " Shortcuts using <leader>
    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=

" }

" Misc {

    " Remove the Windows ^M - when encodings get messed up
    noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

    " Quickly open a buffer for scribble
    map <leader>q :e ~/buffer<cr>

    " Toggle paste mode on and off
    map <leader>pp :setlocal paste!<cr>

    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
" }

" Helper Functions {

    function! CmdLine(str)
        exe 'menu Foo.Bar :' . a:str
        emenu Foo.Bar
        unmenu Foo
    endfunction

    function! VisualSelection(direction) range
        let l:saved_reg = @"
        execute 'normal! vgvy'

        let l:pattern = escape(@", '\\/.*$^~[]')
        let l:pattern = substitute(l:pattern, "\n$", "", "")

        if a:direction == 'b'
            execute "normal ?" . l:pattern . "^M"
        elseif a:direction == 'gv'
            call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
        elseif a:direction == 'replace'
            call CmdLine("%s" . '/'. l:pattern . '/')
        elseif a:direction == 'f'
            execute "normal /" . l:pattern . "^M"
        endif

        let @/ = l:pattern
        let @" = l:saved_reg
    endfunction

    " Returns true if paste mode is enabled
    function! HasPaste()
        if &paste
            return 'PASTE MODE  '
        endif
    endfunction

    " Don't close window, when deleting a buffer
    command! Bclose call <SID>BufcloseCloseIt()
    function! <SID>BufcloseCloseIt()
        let l:currentBufNum = bufnr("%")
        let l:alternateBufNum = bufnr("#")

        if buflisted(l:alternateBufNum)
            buffer #
        else
            bnext
        endif

        if bufnr("%") == l:currentBufNum
            new
        endif

        if buflisted(l:currentBufNum)
            execute("bdelete! ".l:currentBufNum)
        endif
    endfunction

    " Source a global configuration file if available
    if filereadable("/etc/vim/vimrc.local")
        source /etc/vim/vimrc.local
    endif

" }
