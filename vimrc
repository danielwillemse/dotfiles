filetype off

" Load plugins
if filereadable(expand("~/.vim/plugin.vim"))
  source ~/.vim/plugin.vim
endif

" Plugin 'flazz/vim-colorschemes'
" Plugin 'NLKNguyen/papercolor-theme'
" Plugin 'ervandew/supertab'
" Plugin 'elixir-lang/vim-elixir'

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
let g:ctrlp_custom_ignore = 'node_modules\|deps'

" Set leader to comma
let mapleader = ","

nmap Y y$
nmap <silent> <leader>v :vsplit<CR>
nmap <silent> <leader>h :split<CR>
nmap <silent> <leader>r :set relativenumber!<CR>
nmap <silent> <leader>R :set number!<CR>
nmap <silent> <leader>ev :tabedit $MYVIMRC<CR>
nmap <silent> <leader>ep :tabedit ${HOME}/.vim/plugin.vim<CR>
nmap <silent> <leader>ez :tabedit ${HOME}/.zshrc.local<CR>
nmap <silent> <leader>ea :tabedit ${HOME}/.agignore<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>ww :set<space>wrap<CR>
nmap <silent> <leader>wo :set<space>nowrap<CR>

"Map j and k when pressing tab to move, prevents from typing j and k though
inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
inoremap <expr> k pumvisible() ? "\<C-P>" : "k"
"
" Plugin nmaps
nmap <silent> <leader>gb :Gblame<CR>
nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <silent> <leader>a :Ag<space>

" colorscheme railscasts
set t_Co=256
set background=dark

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set guioptions-=T
  hi MatchParen ctermbg=blue guibg=blue
endif

" Automatically remove trailing whitespace on save
autocmd BufWritePre *.{rb,php,erb,js,css,sass,scss,html,htm,yml,markdown,feature,haml,slim,mustache,coffee,rake,ex,exs} :%s/\s\+$//e

" No longer set swap files
set nobackup
set nowritebackup
set noswapfile
set fileformat=unix

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
