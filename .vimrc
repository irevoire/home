scriptencoding utf-8
syntax on                      " Syntax highlighting
filetype plugin indent on      " Automatically detect file types.
set background=dark            " Assume a dark background
set mouse=r                    " Automatically disable mouse usage
set mousehide                  " Hide the mouse cursor while typing
set showmatch                  " Show matching brackets/parenthesis
set incsearch                  " Find as you type search
set ignorecase                 " Case insensitive search
set smartcase                  " Case sensitive when uc present
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
set pastetoggle=<F3>
set cinoptions=t0              " fix the identation of C file


colorscheme molokai     " colorscheme desert

let mapleader = ','

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
map <C-g> :GFiles<Cr>
map <C-f> :Files<Cr>

Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1
Plug 'vim-scripts/restore_view.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
call plug#end()

au BufRead,BufNewFile *.rs      set filetype=rust

" add a red highlight for the nonbreaking space
hi NonBreakingSpace ctermbg=DarkMagenta guibg=DarkMagenta
match NonBreakingSpace " " " (CTRL+V x a 0)
hi TrailingSpaceChar ctermbg=Green guibg=Green
syn match TrailingSpaceChar "\s\+$"

hi Normal ctermbg=none

source ~/.vimrc.bepo
