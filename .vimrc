call plug#begin('~/.vim/plugged')
Plug 'osyo-manga/vim-over'
Plug 'haya14busa/incsearch.vim'
Plug 'scrooloose/nerdtree'
Plug 'ajh17/VimCompletesMe'
Plug 'maralla/completor.vim'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'Valloric/MatchTagAlways'
Plug 'moll/vim-node'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
" Initialize plugin system
call plug#end()
syntax on
set number
set relativenumber
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set wildmenu
set laststatus=2
set noerrorbells
set nobackup
set noswapfile
set autoread
set autowrite
set visualbell
let base16colorspace=256 " Access colors present in 256 colorspace
colorscheme base16-default-dark
set mouse=a
set timeoutlen=500

"
" Mappings
" 

nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

let mapleader = " "
" window switching
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" fuzzy find in current buffer
nnoremap <Leader>f :BLines<CR>  
" fuzzy find files in cwd
nnoremap <Leader>t :Files<CR>  
" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" enable neocomplete at start
let g:neocomplete#enable_at_startup = 1
" make backspace work like most other apps

"
" Formatting
"
set nostartofline
set backspace=indent,eol,start
set nowrap
set ttimeoutlen=50
set directory=$HOME/.vim/swapfiles//
set expandtab
set shiftwidth=2
set softtabstop=2
set noshowmode
let g:netrw_liststyle = 3
let g:netrw_banner = 0
" lightline show branch via fugitive plugin
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
let g:ale_linters = {
\  'javascript': ['eslint'],
\}

autocmd FileType python nnoremap <Leader>= :0,$!yapf<CR>

function! VisualFindAndReplace()
    :OverCommandLine%s/
    :w
endfunction
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
    :w
endfunction
