call plug#begin('~/.local/share/nvim/plugged')
Plug 'itchyny/lightline.vim'
" Linting
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" syntax highlighting
Plug 'd-feller/blayu.vim'
" C# support
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'haya14busa/incsearch.vim'
Plug 'osyo-manga/vim-over'
Plug 'fatih/vim-go'
call plug#end()


" Use deoplete.
let g:deoplete#enable_at_startup = 1

" set termguicolors
set number
set relativenumber
set encoding=UTF-8

colorscheme blayu
let g:lightline = {'colorscheme' : 'wombat',}

"
" Config
"

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
" Enable folding
set foldmethod=indent
set foldlevel=99

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
" Enable folding with the +
nnoremap + za

"
" Formatting
"
set nostartofline
set backspace=indent,eol,start " make backspace work like most other apps
set nowrap
set ttimeoutlen=50
set directory=$HOME/.vim/swapfiles//
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set noshowmode
let g:netrw_liststyle = 3
let g:netrw_banner = 0

"
" UltiSnips settings
"
let g:UltiSnipsSnippetDirectories=['~/.local/share/nvim/snippets']
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<tab>"               
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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
