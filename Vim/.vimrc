"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugins

" Specify a directory for plugins.
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/AutoComplPop'
Plug 'ervandew/supertab'
" Plug 'chrisbra/Colorizer'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'

call plug#end()

set number
set relativenumber
set nocompatible
set wrap
set linebreak
set encoding=utf-8
set mouse=a
setlocal spell spelllang=en_us
setlocal spell!

let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
let mapleader = "\<Space>"
let g:colorizer_auto_color=1
" let g:colorizer_auto_filetype='css,html'

imap jk <Esc>
cmap jk <Esc>
nnoremap q :q <Enter>
nnoremap Q :q! <Enter>
nnoremap zz :w <Enter>
nnoremap U <c-r>
nnoremap <C-c> :Commentary <Enter>
nnoremap <leader>s :setlocal spell!<CR>
nnoremap <leader>c :ColorHighlight!<CR>
nnoremap <leader>c :ColorHighlight!<CR>
nnoremap <leader>t :UndotreeToggle<CR>
" None of these seem to work
" nnoremap <leader>y "*y
" nnoremap <leader>p "*p
" nnoremap <leader>y "+y
" nnoremap <leader>p "+p

imap ( ()<Left>
imap [ []<Left>
imap { {}<Left>

imap <F5> <Esc>:w<CR>:!clear;python %<CR>
nnoremap <F5> <Esc>:w<CR>:!clear;python %<CR>

filetype plugin indent on
