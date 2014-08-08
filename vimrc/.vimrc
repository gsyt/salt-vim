" NeoVundle Settings
if has('vim_starting')
  set nocompatible
  set rtp+=~/.vim/bundle/neobundle.vim/
endif

filetype off

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rvm'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'nelstrom/vim-visual-star-search'
NeoBundle 'nelstrom/vim-qargs'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'vim-scripts/indent-motion'
NeoBundle 'rodjek/vim-puppet'
"NeoBundle 'L9'
"NeoBundle 'taglist.vim'
"NeoBundle 'majutsushi/tagbar'
"NeoBundle 'skalnik/vim-vroom'
"NeoBundle 'scrooloose/syntastic'
"NeoBundle 'scrooloose/nerdcommenter'
"NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'Lokaltog/vim-easymotion'
"NeoBundle 'lucapette/vim-ruby-doc'
"NeoBundle 'derekwyatt/vim-scala'
"NeoBundle 'vim-scripts/vim-addon-mw-utils'

NeoBundleCheck

filetype plugin indent on

" Custom settings
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set incsearch
set number
set hidden

" Taglist settings
let Tlist_Use_Right_Window=1
nmap <F7> :TlistToggle<CR>

" Keybindings
nnoremap & :&&<CR>
xnoremap & :&&<CR>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
