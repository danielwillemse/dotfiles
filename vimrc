filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'slim-template/vim-slim'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'flazz/vim-colorschemes'
Bundle 'NLKNguyen/papercolor-theme'
Bundle 'ervandew/supertab'

set nocompatible
set shiftwidth=2
set ruler
set tabstop=2
set expandtab
set showmatch
set wildignore+=.png,.jpg
set number
set autoindent
set splitbelow
set splitright
set nowrap
set rnu
set clipboard=unnamed

" Show invisibles
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:

" Set leader to comma
let mapleader = ","

map <leader>v :vsplit<CR>
map <leader>h :split<CR>
map <leader>gb :Gblame<CR>
map Y y$

nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <silent> <leader>r :set relativenumber!<CR>
nmap <silent> <leader>R :set number!<CR>
nmap <silent> <leader>f :CommandTFlush<CR>
nmap <silent> <leader>ev :tabedit $MYVIMRC<CR>
nmap <silent> <leader>ez :tabedit ${HOME}/.zshrc.local<CR>
nmap <silent> <leader>ea :tabedit ${HOME}/.ackrc<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>a :Ag<space>
nmap <silent> <leader>ww :set<space>wrap<CR>
nmap <silent> <leader>wo :set<space>nowrap<CR>

"Map j and k when pressing tab to move, prevents from typing j and k though
inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
inoremap <expr> k pumvisible() ? "\<C-P>" : "k"

"colorscheme PaperColor
colorscheme monokai
set t_Co=256
set background=dark

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set guioptions-=T
  set cursorline cursorcolumn
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
