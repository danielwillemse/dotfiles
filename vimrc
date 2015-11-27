filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'slim-template/vim-slim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
" Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'flazz/vim-colorschemes'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'ervandew/supertab'

call vundle#end()
filetype plugin indent on

set shiftwidth=2
set tabstop=2
set ruler
set expandtab
set showmatch
set number
set splitbelow
set splitright
set nowrap
set clipboard=unnamed
set cursorline cursorcolumn

" Show invisibles
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.ttf,*.woff,*.eot,.png,.jpg

" Set leader to comma
let mapleader = ","

map <leader>v :vsplit<CR>
map <leader>h :split<CR>
map <leader>gb :Gblame<CR>
map Y y$

nmap <silent> <leader>r :set relativenumber!<CR>
nmap <silent> <leader>R :set number!<CR>
nmap <silent> <leader>f :CommandTFlush<CR>
nmap <silent> <leader>ev :tabedit $MYVIMRC<CR>
nmap <silent> <leader>ez :tabedit ${HOME}/.zshrc.local<CR>
nmap <silent> <leader>ea :tabedit ${HOME}/.agignore<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>a :Ag<space>
nmap <silent> <leader>ww :set<space>wrap<CR>
nmap <silent> <leader>wo :set<space>nowrap<CR>
nmap <silent> <leader>ss :call SymToString()<CR>
nmap <silent> <leader>SS :call AllSymToString()<CR>

"Map j and k when pressing tab to move, prevents from typing j and k though
inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
inoremap <expr> k pumvisible() ? "\<C-P>" : "k"

"colorscheme PaperColor
colorscheme railscasts
set t_Co=256
set background=dark

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set guioptions-=T
  hi MatchParen ctermbg=blue guibg=blue
endif

" Automatically remove trailing whitespace on save
autocmd BufWritePre *.{rb,php,erb,js,css,sass,scss,html,htm,yml,markdown,feature,haml,slim,mustache,coffee,rake} :%s/\s\+$//e
autocmd BufWritePre *.haml call FixHaml()

" No longer set swap files
set nobackup
set nowritebackup
set noswapfile
set fileformat=unix

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Quick function to place after the first occurence of a = or -.
" /e is to silence the output if no match is found
function! FixHaml()
  :%s/^\(\s*\)\(=\)\(\S\)/\1\2 \3/e
  :%s/^\(\s*\)\(-\)\(\S\)/\1\2 \3/e
endfunction

function! ConvertHashSyntax()
  :%s/:\([^ ]*\)\(\s*\)=>/\1:/g
endfunction

function! SymToString()
  :s/\:\(\w*\)/'\1'/ge
endfunction

function! AllSymToString()
  :%s/\:\(\w*\)/'\1'/ge
endfunction
