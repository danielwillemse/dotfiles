call pathogen#infect()
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

" Set leader to comma
let mapleader = ","

map <leader>v :vsplit<CR>
map <leader>h :split<CR>
map Y y$

nmap <silent> <leader>n :NERDTree<CR>
nmap <silent> <leader>ev :tabedit $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>a :Ack<space>
nmap <silent> <leader>ww :set<space>wrap<CR>
nmap <silent> <leader>wo :set<space>nowrap<CR>

if has("gui_running")
  set background=dark
  color railscasts
  syntax on
  set guioptions-=T
  set cursorline
endif

" Automatically remove trailing whitespace on save
autocmd BufWritePre *.{rb,php,erb,js,css,sass,scss,html,htm,yml,markdown,feature,haml,mustache} :%s/\s\+$//e
autocmd BufWritePre *.haml call FixHaml()

" No longer set swap files
set nobackup
set nowritebackup
set noswapfile

" Quick function to place after the first occurence of a = or -.
" /e is to silence the output if no match is found
function! FixHaml()
  :%s/^\(\s*\)\(=\)\(\S\)/\1\2 \3/e
  :%s/^\(\s*\)\(-\)\(\S\)/\1\2 \3/e
endfunction
