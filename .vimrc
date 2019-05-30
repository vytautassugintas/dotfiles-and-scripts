set nocompatible              " be iMproved, required
filetype off                  " required

" === VUNDLE (https://github.com/VundleVim/Vundle.vim) ===
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
"Plugin 'pangloss/vim-javascript'
"Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'othree/html5.vim'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
"Plugin 'mileszs/ack.vim'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'mxw/vim-jsx'
Plugin 'tomasiser/vim-code-dark'
call vundle#end()            
filetype plugin indent on
" === VUNDLE === to install - ::PluginInstall

" === VIM-PLUG (https://github.com/junegunn/vim-plug) ===
"call plug#begin('~/.vim/plugged')

"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"call plug#end()
" === VIM-PLUG === to install - PlugInstall

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:ackprg = 'ag --nogroup --nocolor --column'
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe = 'npm run lint --'

autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
autocmd VimEnter * NERDTree

syntax enable

colorscheme codedark

set number
set mouse=a

