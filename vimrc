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

" Show invisibles
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:

" Set leader to comma
let mapleader = ","

map <leader>v :vsplit<CR>
map <leader>h :split<CR>
map Y y$

nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <silent> <leader>f :CommandTFlush<CR>
nmap <silent> <leader>ev :tabedit $MYVIMRC<CR>
nmap <silent> <leader>ez :tabedit ${HOME}/.zshrc.local<CR>
nmap <silent> <leader>ea :tabedit ${HOME}/.ackrc<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>a :Ag<space>
nmap <silent> <leader>ww :set<space>wrap<CR>
nmap <silent> <leader>wo :set<space>nowrap<CR>

"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_warnings=0

if has("gui_running")
  set background=dark
  color base16-default
  syntax on
  set guioptions-=T
  set cursorline
  hi MatchParen ctermbg=blue guibg=red
endif

" Automatically remove trailing whitespace on save
autocmd BufWritePre *.{rb,php,erb,js,css,sass,scss,html,htm,yml,markdown,feature,haml,slim,mustache,coffee} :%s/\s\+$//e
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
