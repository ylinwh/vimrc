""""""""""""""""""""""""""""""""""""""""
"               Settings               " 
""""""""""""""""""""""""""""""""""""""""
set nocompatible                    " Enables us Vim specific features
filetype off                        " Reset filetype detection first ...
filetype plugin indent on           " ... and enable filetype detection
set laststatus=2                    " Show status line always
set encoding=utf-8                  " Set default encoding to UTF-8
set autoread                        " Automatically read changed files
set backspace=indent,eol,start      " Makes backspace key more powerful
set incsearch                       " Shows the match while typing
set hlsearch                        " Hightlight found searches
set noerrorbells                    " No beeps
set number                          " Show line numbers
" set showcmd                         " Show me what I'm typing
set noswapfile                      " Don't use swapfile
set nobackup                        " Don't create annoying backup files
set splitright                      " Vertical windows should be split to right
set splitbelow                      " Horizontal windows should be split to bottom
set autowrite                       " Automatically save before :next, :make etc
set hidden                          " Buffer should still exist if window is closed
set tabstop=4                       " show existing tab with 4 spaces width
set shiftwidth=4                    " when indenting with '>', use 4 spaces width
set expandtab                       " On pressing tab, insert 4 spaces
syntax on                           " syntax

" set showmatch                       " color parenthesis
" hi MatchParen cterm=bold ctermbg=green ctermfg=magenta

let mapleader=','
inoremap <leader>w <Esc>:w<cr>
inoremap jj <Esc>
inoremap <leader><Tab> <C-d>
nnoremap <leader><Tab> <<
inoremap <C-Enter> <Esc>$o
inoremap <leader>z <Esc>zzgi

" Use ctrl+h/j/k/l switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" save file using w!!
cmap w!! w !sudo tee > /dev/null % 

call plug#begin('~/.vim/plugged') 
Plug 'mhinz/vim-startify' 

Plug 'yggdroot/indentline'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'

Plug 'luochen1990/rainbow'

Plug 'cquery-project/cquery'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'vim-syntastic/syntastic'

Plug 'tomasr/molokai'

Plug 'tpope/vim-fugitive'

Plug 'easymotion/vim-easymotion'
call plug#end()


" Nerdtree
" map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore=[
            \'\.git$', '\pyc$', '__pycache__$', '\.swp$',
            \'\.ipynb_checkpoints' ]

" rainbow
let g:rainbow_active=1  " set to 0 if you want to enable it later via :RainbowToggle

" deoplete 
let g:deoplete#enable_at_startup = 1 " auto start
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif " hide the preview window

" deoplete clang
let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/lib/clang'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" molokai
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" fugitive
set statusline+=%{FugitiveStatusline()}

" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <leader>s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Space> <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
