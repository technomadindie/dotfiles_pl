" Sid's Files "
set undodir=~/.vim/undodir
set undofile
set clipboard+=unnamedplus

" Achin's and Murilo's inspiration "
set nomodeline 
set nocompatible
set rtp^=~/.vim/bundle/ctrlp.vim
set backspace=indent,eol,start
set autoindent
set bg=dark
"set clipboard=exclude:.*
set cursorline
set diffopt+=iwhite
set expandtab
set hlsearch
set incsearch
set lazyredraw
set nowrap
set number
set relativenumber
set ruler
set shiftwidth=4
set softtabstop=4
set tabstop=8
set ttyfast
set undofile
set colorcolumn=80
set hidden
set history=10000
set splitright
"set belloff=all        
"set errorbells=0
set noeb vb t_vb=
""From old file .vimrc_old by siddarthg
set incsearch
set hlsearch
set number
set autoindent expandtab tabstop=2 shiftwidth=2
set linespace=5
" Centralize after next / previous diff
nnoremap ]c ]czz
nnoremap [c [czz

:set guicursor=
" Workaround some broken plugins which set guicursor indiscriminately.
":autocmd OptionSet guicursor noautocmd set guicursor=

filetype plugin indent on

au BufNewFile,BufRead *.sv setlocal ft=verilog
au BufNewFile,BufRead *.vh setlocal ft=verilog
au BufNewFile,BufRead chip.config.* setlocal ft=perl

syntax on

syntax enable


set diffexpr=MyDiff()
function MyDiff()
    let opt = ""
    if exists("g:diffignore") && g:diffignore != ""
        let opt = "-I " . g:diffignore
    endif
    if &diffopt =~ "icase"
        let opt = opt . "-i "
    endif
    if &diffopt =~ "iwhite"
        let opt = opt . "-w "
    endif
    silent execute "!diff -a --binary " . opt . v:fname_in . " " . v:fname_new .
    \  " > " . v:fname_out
endfunction
colorscheme default
""""""""""""""
" tmux fixes "
""""""""""""""
" Handle tmux $TERM quirks in vim
if $TERM =~ '^screen'
    map <Esc>OH <Home>
    map! <Esc>OH <Home>
    map <Esc>OF <End>
    map! <Esc>OF <End>
endif

if &diff
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
"highlight DiffAdd    cterm=BOLD ctermfg=NONE ctermbg=22
"highlight DiffDelete cterm=BOLD ctermfg=NONE ctermbg=52
"highlight DiffChange cterm=BOLD ctermfg=NONE ctermbg=23
"highlight DiffText   cterm=BOLD ctermfg=NONE ctermbg=100  
" colorscheme evening
"    colorscheme default
endif

vnoremap # :s#^#\##<cr>
vnoremap -# :s#^\###<cr>

"set t_ti=7[r[?47h t_te=[?47l8
"set t_ti=[?1049h t_te=[?1049l
"set t_ti=
"set t_te=

" CtrlP
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
