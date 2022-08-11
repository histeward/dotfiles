set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/autoload')
" Make sure you use single quotes
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-sensible'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/indentpython.vim'
Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'
Plug 'vim-scripts/AutoComplPop'
Plug 'dunstontc/vim-vscode-theme'
" Initialize plugin system
call plug#end()

filetype on
filetype plugin on
filetype indent on

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" SANE TEXT FILES 
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
" set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set smartindent
set smarttab
set expandtab
set number
set relativenumber
set viminfo='25,\"50,n~/.viminfo
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c
set noswapfile
set spelllang=en_us
set spell
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2


" auto-pairs
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})

" make backspaces more powerfull
set backspace=indent,eol,start
set ruler               
syntax on 
set showcmd        
colorscheme dark_plus
hi Normal guibg=NONE ctermbg=NONE
highlight clear LineNr
" always show status bar
set laststatus=2

"enable 256 colors
set t_Co=256
set t_ut=

" lightline theme
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" AUTO BRACKETING

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

au FileType python setl sw=4 sts=4 et
au FileType html setl sw=2 sts=2 et

"MOUSE ON
set mouse=a
let g:is_mouse_enebled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction

" enable indentation
set breakindent

" ident by an additional 2 characters on wrapped lines, when line >= 40 characters, put 'showbreak' at start of line
set breakindentopt=shift:2,min:40,sbr

" append '>> ' to indent
" set showbreak=>>   

"not wrapping word half way
set linebreak

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
