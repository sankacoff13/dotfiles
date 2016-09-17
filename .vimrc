"
" .vimrc
"
" To use, copy to:
"       Unix:   ~/.vimrc
"        Win:   $VIM\_vimrc or $HOME\_vimrc
"      Amiga:   s:.vimrc
"    OpenVMS:   sys$login:.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This must always be first
set nocompatible                "Use vim settings instead of vi settings

" Temporary stuff
"""""""""""""""""
set autoread
"set columns=85                 "Columns in the window
"set lines=80                   "Rows in the window

" Editor
""""""""
set number                      "Show line numbers
set history=50                  "Remembered commands
set ruler                       "Show line,col in bottom right
set showcmd                     "Show partial command on last line
set hidden                      "Hide buffers when they are abandoned
set cursorline                  "Highlight current line
set textwidth=80                "Number of columns before wrapping
syntax on                       "Syntax highlighting
if exists("&colorcolumn")
    set colorcolumn=+1          "Color column after textwidth
endif
colorscheme torte               "Color scheme to use
set undodir=~/.vim/undo
set undofile
set viminfo=!,'50,:50,<1000,s100
set splitright

" Text Formatting
"""""""""""""""""
set encoding=utf-8              "Character encoding
set tabstop=4                   "Spaces a tab counts for
set softtabstop=4
set expandtab                   "Insert spaces for tabs
set shiftwidth=4                "Number of spaces per auto indent
set autoindent                  "Automatic indenting
set smartindent                 "Intelligently indents new lines
set cindent                     "Indenting for C files
set smartcase                   "Ignore case in search if LC only
set incsearch                   "Match search pattern as you type it
set nohlsearch                  "Don't highlight matches
set nowrapscan                  "Do not wrap around when searching
set showmatch                   "Highlight matching [] {} () etc.
set backspace=indent,eol,start  "Make backspace behave as expected
"t: auto-wrap text using textwidth
"c: automatically wrap comments
"r: automatically insert comment leader
"q: allow formatting of comments with gq
"l: don't break previously long lines
set formatoptions=tcrql         "Formatting options
set guifont=Consolas            "Font to use

" Key Mapping
"""""""""""""
let mapleader="\\"
" Disables arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <right> <nop>
inoremap <left> <nop>

" Better movement up/down
nnoremap j gj
nnoremap k gk

" jk to exit insert mode
inoremap jk <ESC>

" tab movement
nnoremap <LEADER>tp :tabprev<CR>
nnoremap <LEADER>tn :tabnext<CR>
inoremap <LEADER>tp <ESC>:tabprev<CR>
inoremap <LEADER>tn <ESC>:tabnext<CR>

" GUI Specifics
"""""""""""""""
"if has("gui_running")
    "do stuff
"endif

" Autocommands
""""""""""""""
if has("autocmd")
    " Put in an autocmd group to delete them easily
    augroup vimrcEx
        au!

        " When reopening a file, jump to the last known valid cursor position
        autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \ exe "normal! g`\"" |
            \ endif

        " Strip trailing whitespace before writing changes
        autocmd BufWritePre * %s/\s\+$//e
    augroup END
endif " has("autocmd")

