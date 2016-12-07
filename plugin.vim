call plug#begin()

" Nav
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'

" Git
Plug 'tpope/vim-fugitive'
call plug#end()

" Plugin configs
autocmd vimenter * NERDTree
