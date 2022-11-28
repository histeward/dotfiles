call plug#begin()

Plug 'arcticicestudio/nord-vim'

Plug 'jiangmiao/auto-pairs'

call plug#end()

" SANE TEXT FILES
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

" BASIC SETTINGS
syntax on
set expandtab                       " enter spaces when tab is pressed
set textwidth=120                   " break lines when line length increases
set tabstop=4                       " use 4 spaces to represent tab
set softtabstop=4                   " dunno what this does again
set shiftwidth=4                    " number of spaces to use for auto indent
set autoindent                      " copy indent from current line when starting a new line
set smartindent                     " it does smart intending
set smarttab                        " it does smart tabbing
set expandtab                       " dunno what this does again
" set number                            " ads line numbers
" set relativenumber                    " you're cool if you understand
set backspace=indent,eol,start      " making backspaces powerful
set ruler                           " forgot what this was
set linebreak                       " does not wrap a word half way
colorscheme nord                    " setting color theme nord
set hlsearch                        " highlight search result
set ignorecase                      " case insensitive search

" Highlighting currentline number
set cursorline
set cursorlineopt=number
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold


" AUTOCMD
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
