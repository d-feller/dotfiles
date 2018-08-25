call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
Plug 'SirVer/ultisnips'
Plug 'mxw/vim-jsx',
Plug 'mattn/emmet-vim'
Plug 'osyo-manga/vim-over'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'haya14busa/incsearch.vim'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'Valloric/MatchTagAlways'
Plug 'moll/vim-node'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()
syntax on
set number
set relativenumber
set encoding=UTF-8


"
" Config
"

" higlight search but not when sourcing .vimrc
set hls
let @/ = ""

if $TMUX == ''
set clipboard+=unnamed
endif

if $TMUX != ''
set ttymouse=xterm2
endif

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
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
set background=dark
"
" Mappings
" 

nnoremap <Leader>r :call VisualFindAndReplace()<CR>
xnoremap <Leader>r :call VisualFindAndReplaceWithSelection()<CR>

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
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

"
" Formatting
"
set nostartofline
set backspace=indent,eol,start " make backspace work like most other apps
set nowrap
set ttimeoutlen=50
set directory=$HOME/.vim/swapfiles//
set shiftwidth=2
set softtabstop=2
set tabstop=2
set noexpandtab
set noshowmode
let g:netrw_liststyle = 3
let g:netrw_banner = 0
" lightline show branch via fugitive plugin
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }

" ALE settings
let g:ale_linters = {
\  'javascript': ['eslint'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
"
" UltiSnips settings
"
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"

autocmd FileType python nnoremap <Leader>= :0,$!yapf<CR>

function! VisualFindAndReplace()
    :OverCommandLine%s/
    :w
endfunction

function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
    :w
endfunction
"
" YouCompleteMe
"
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
"
" 
" Go
"

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_fmt_command = "goimports" " import missing packages automatically

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>a :GoAlternate <CR> 
