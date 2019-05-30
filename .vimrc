filetype plugin on
set nocompatible              " be iMproved, required
set encoding=UTF-8
set omnifunc=syntaxcomplete#Complete
set expandtab
set cursorline
set showmatch
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"fonts - https://github.com/ryanoasis/nerd-fonts#font-installation

" === VIM-PLUG (https://github.com/junegunn/vim-plug) ===
call plug#begin('~/.vim/plugged')

"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'ryanoasis/vim-devicons'
Plug 'tomasiser/vim-code-dark'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTree' }
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
call plug#end()
" === VIM-PLUG === to install - PlugInstall

autocmd VimEnter * NERDTree

"Lint
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
"Lint end
let mapleader=","       " leader is comma
"NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"

let g:quantum_italics=1

syntax enable

colorscheme codedark

set termguicolors
set number
set mouse=a

