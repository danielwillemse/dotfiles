call plug#begin()

" Syntax
Plug 'elixir-lang/vim-elixir'

" Themes
Plug 'flazz/vim-colorschemes'

" Nav
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'rking/ag.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'

" Git
Plug 'tpope/vim-fugitive'
call plug#end()

" Plugin configs
let NERDTreeShowHidden=1

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
