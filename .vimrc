" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen, vim-plug or vundle)
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'ajh17/VimCompletesMe'
call plug#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
let mapleader = "\<SPACE>"

" Mouse
set mouse=a
set number

" Statusline
set laststatus=2

set statusline=
set statusline+=\ %{toupper(mode())}\ 
set statusline+=%#LineNr#
set statusline+=\ %F
set statusline+=\ %{FugitiveHead()}
set statusline+=\ %m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

" Encoding
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Searching
set path+=**
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
command! MakeTags !ctags -R .

" Colors
set background=dark
