scriptencoding utf-8
syntax on                      " Syntax highlighting
filetype plugin indent on      " Automatically detect file types.
set background=dark            " Assume a dark background
set mouse=r                    " Automatically disable mouse usage
set mousehide                  " Hide the mouse cursor while typing
set showmatch                  " Show matching brackets/parenthesis
set wildmenu                   " Show list instead of just completing
set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.
set scrolloff=999              " Minimum lines to keep above and below cursor
set autoindent                 " Indent at the same level of the previous line
set shiftwidth=8               " Use indents of 8 spaces
set tabstop=8                  " An indentation every 8 columns
set nojoinspaces               " Prevents inserting two spaces after punctuation on a join (J)
set splitright                 " Puts new vsplit windows to the right of the current
set splitbelow                 " Puts new split windows to the bottom of the current
set matchpairs+=<:>            " Match, to be used with %
set pastetoggle=<F3>           " Enter in paste mode
set cinoptions=t0              " fix the identation of C file
set guicursor=                 " better cursor

set completeopt=menuone,noinsert,noselect
" let g:completion_enable_auto_popup = 0
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_chain_complete_list = {
    \ 'default': [
    \    {'complete_items': ['lsp', 'snippet', 'tabnine', 'path' ]},
    \    {'mode': '<c-p>'},
    \    {'mode': '<c-n>'}
    \]
\}

let mapleader = ','

au BufRead,BufNewFile *.rs      set filetype=rust
