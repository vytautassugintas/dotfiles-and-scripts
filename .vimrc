" fonts - https://github.com/ryanoasis/nerd-fonts#font-installation



" === PLUGINS (https://github.com/junegunn/vim-plug) ===
call plug#begin('~/.vim/plugged')

" Swag 
Plug 'chriskempson/base16-vim'
Plug 'ryanoasis/vim-devicons'

" JS
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" TS
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'jparise/vim-graphql'

" Lint
Plug 'w0rp/ale'

" Esentials
Plug 'scrooloose/nerdtree', { 'on': 'NERDTree' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "https://github.com/junegunn/fzf
Plug 'mileszs/ack.vim'  "https://github.com/mileszs/ack.vim

call plug#end()
" === VIM-PLUG === to install - PlugInstall



" === KEY MAP ===

let mapleader=","

map <C-f> :FZF<CR>
map <C-n> :NERDTreeToggle<CR>

" === KEY MAPS ===



" === INIT ===

" opens nerdtree together with vim
"autocmd VimEnter * NERDTree

"closes NERDTree if its the only window thats left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:webdevicons_conceal_nerdtree_brackets = 1

let g:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1
" === INIT ====



" === SETTINGS ===

set nocompatible              " be iMproved, required
set encoding=UTF-8
set omnifunc=syntaxcomplete#Complete
set expandtab
set cursorline
set showmatch
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set termguicolors
set number
set mouse=a

filetype plugin on
syntax enable
colorscheme base16-ocean

" === SETTINGS ===



" === AUTOMATION ===

" *** Show current buffer in NERDTreee
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" === AUTOMATION ===
