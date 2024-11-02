set nocompatible              " be iMproved, required
set number
set showmatch

autocmd BufNewFile,BufRead *.vpy setfiletype python

set hlsearch
set ignorecase
set smartcase
set incsearch
 
set autoindent
set cindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set relativenumber

set hidden

set undolevels=1000
set backspace=indent,eol,start

set background=dark

set termguicolors

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set nobackup
set nowritebackup

set clipboard=unnamedplus

set updatetime=300

set shortmess+=c

set runtimepath+=~/.vim-plugins/LanguageClient-neovim

syntax on

filetype on                  " required

function! OpenTerminalInCurrentDirectory()
    execute 'cd ' . expand('%:p:h')
    term
endfunction

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimsence/vimsence'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'
call plug#end()

filetype plugin on

map <silent> <C-n> :NERDTreeFocus<CR>
map <F8> :w <CR> :!gcc % -o %< &&./%< <CR>
nnoremap <Leader>t :call OpenTerminalInCurrentDirectory()<CR>
nnoremap <F5> :e!<CR>
nnoremap <C-s> :w<CR>
nnoremap qq :q<CR>
nnoremap vv "+p
nnoremap <C-S-c> "+yy
vnoremap <C-S-c> "+y

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/bin/pyls'],
    \ }

let g:syntastic_c_compiler="gcc"
let g:syntastic_c_compiler_options="-O2 -march=native -g -pipe"
