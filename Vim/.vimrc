"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|

set number
set relativenumber
set nocompatible
set wrap
set encoding=utf-8

let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
imap jk <Esc>
" imap kj <Esc>
vmap jk <Esc>
" vmap kj <Esc>
cmap jk <Esc>
" cmap kj <Esc>
nnoremap q :q <Enter>
nnoremap Q :q! <Enter>
nnoremap zz :w <Enter>

imap ( ()<Left>
imap [ []<Left>
imap { {}<Left>

imap <F5> <Esc>:w<CR>:!clear;python %<CR>
nnoremap <F5> <Esc>:w<CR>:!clear;python %<CR>
