" Vimrc
" Vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
Plugin 'relastle/bluewery.vim'
Plugin 'preservim/nerdtree'
Plugin 'vim-python/python-syntax'
Plugin 'jiangmiao/auto-pairs'
Plugin 'pangloss/vim-javascript'
Plugin 'dense-analysis/ale'
" Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rust-lang/rust.vim'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'leafgarland/typescript-vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'tpope/vim-fugitive'
Plugin 'neovim/nvim-lspconfig'
Plugin 'hrsh7th/nvim-compe'
Plugin 'ryanoasis/vim-devicons'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }


" All of your Plugins must be added before the following line
call vundle#end()            " required

" General purpose
set path=.,**
" set wildignore+=**/node_modules/**
set wildignore+=venv/**
set laststatus=2
set relativenumber number
syntax on
set nocompatible
set shiftwidth=4
set tabstop=8
set autoindent
set expandtab
set smartindent
set colorcolumn=80
filetype plugin on
filetype plugin indent on

let g:airline_theme = 'solarized'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_symbols.colnr = ' | '
let g:airline_symbols.linenr = ' | '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.notexists = ''
let g:airline_symbols.whitespace = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#nvimlsp#enabled = 1
let airline#extensions#nvimlsp#error_symbol = 'E:'

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'



colorscheme bluewery

" Autopep
au FileType python setlocal formatprg=autopep8\ -
au FileType python setlocal path=src/**,bin/**

" AutoNerdTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" Ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

" Python Syntax
let g:python_highlight_all=1

" Indents
autocmd BufRead,BufNewFile *.sql setlocal ts=2 sw=2 sts=2
autocmd FileType javascript,css setlocal ts=2 sw=2 sts=2
autocmd BufRead,BufNewFile *.tsx,*.ts setlocal ts=2 sw=2 sts=2

" lightline
set noshowmode

" Remaps
inoremap jh <Esc>
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
let mapleader="g"
map K dwElp
inoremap ¬ <Esc>A;<Esc>
nnoremap ¬ A;<Esc>
inoremap <C-s> <Esc>:w<CR>
map <C-s> :w<CR>
map <C-j> <S-}>
map <C-k> <S-{>
nnoremap <C-f> :Files src/<CR>
nnoremap <Leader>v :vert sbN<CR>
noremap <Leader>l :noh<CR>

let g:python3_host_prog = "/usr/local/opt/python@3.9/bin/python3.9"
