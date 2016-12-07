call plug#begin()

" Syntax
Plug 'elixir-lang/vim-elixir'

" Themes
Plug 'flazz/vim-colorschemes'

" Nav
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
call plug#end()

" Plugin configs
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
