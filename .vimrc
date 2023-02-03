set number
set relativenumber
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
imap jk <Esc>
imap kj <Esc>
vmap jk <Esc>
vmap kj <Esc>
cmap jk <Esc>
cmap kj <Esc>
nnoremap q :q <Enter>
nnoremap qq :q! <Enter>
nnoremap zz :wq <Enter>
