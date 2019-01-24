call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
" Syntax Highlighting
Plug 'fenetikm/falcon'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'haya14busa/incsearch.vim'
Plug 'osyo-manga/vim-over'
call plug#end()


" Use deoplete.
let g:deoplete#enable_at_startup = 1
set termguicolors

set number
set relativenumber
set encoding=UTF-8

let g:falcon_airline = 1
let g:airline_theme = 'falcon'
let g:falcon_background = 0
let g:falcon_inactive = 1
colorscheme falcon

"
" Config
"
" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
if $TMUX == ''
set clipboard+=unnamed
endif

if $TMUX != '' && !has('nvim')
	set ttymouse=xterm2
endif

set wildmenu
set laststatus=2
set noerrorbells
set nobackup
set noswapfile
set autoread
set autowrite
set visualbell
set mouse=a
set timeoutlen=500
set cursorline

:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

"
" Mappings
"

let mapleader = "\<Space>"

nnoremap <Leader>r :call VisualFindAndReplace()<CR>
xnoremap <Leader>r :call VisualFindAndReplaceWithSelection()<CR>

" window switching
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" fuzzy find in current buffer
nnoremap <Leader>f :BLines<CR>
" fuzzy find files in cwd
nnoremap <Leader>t :Files<CR>
" fuzzy find in current buffers
nnoremap <Leader>b :Buffers<CR>
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

" jump through quickfix list
map <C-n> :lnext<CR>
map <C-m> :lprev<CR>

"
" Formatting
"
set nostartofline
set backspace=indent,eol,start " make backspace work like most other apps
set nowrap
set ttimeoutlen=50
set directory=$HOME/.vim/swapfiles//
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
set noshowmode
let g:netrw_liststyle = 3
let g:netrw_banner = 0

"
" UltiSnips settings
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" Neomake Settings
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nw', 750)
" let g:neomake_open_list = 2

autocmd FileType python nnoremap <Leader>= :0,$!yapf<CR>

function! VisualFindAndReplace()
		:OverCommandLine%s/
		:w
endfunction

function! VisualFindAndReplaceWithSelection() range
		:'<,'>OverCommandLine s/
		:w
endfunction
