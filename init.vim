call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', {'do': {-> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'StanAngeloff/php.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
call plug#end()

let g:lightline = {'colorscheme' : 'nord',}
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" set termguicolors
set number
set relativenumber
set encoding=UTF-8

set wildmenu
set laststatus=2
set noerrorbells
set smartindent
set nobackup
set noswapfile
set mouse=a
set timeoutlen=500
set colorcolumn=130


"
" Mappings
"

let mapleader = "\<Space>"
" window switching
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" fuzzy find in current buffer
nnoremap <Leader>f :BLines<CR>
" fuzzy find files in cwd
nnoremap <Leader>t :Files<CR>
" fuzzy find git files in cwd
nnoremap <Leader>sf :GFiles<CR>
" fuzzy find in current buffers
nnoremap <Leader>b :Buffers<CR>
" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>rf :NERDTreeFind<CR>

nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <Leader>ps :Rg<SPACE>


"
" Formatting
"
set nostartofline
set backspace=indent,eol,start " make backspace work like most other apps
set nowrap
set ttimeoutlen=50
set directory=$HOME/.vim/swapfiles//
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set noshowmode
let g:netrw_liststyle = 3
let g:netrw_banner = 0

"
" Rg
"
if executable('rg')
    let g:rg_derive_root='true'
endif


"
" coc
"

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
