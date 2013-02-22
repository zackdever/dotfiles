""" Vundle """""""""""""""""""""""""""""""""""""""""""""
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" my Bundles here ---------------------
Bundle 'zever/vim-colors-solarized'
"Bundle 'digitaltoad/vim-jade'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'godlygeek/tabular'
Bundle 'groenewege/vim-less'
"Bundle 'guileen/vim-node'
"Bundle 'lambdalisue/vim-django-support'
Bundle 'kchmck/vim-coffee-script'
"Bundle 'klen/python-mode'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'mattn/zencoding-vim'
Bundle 'mileszs/ack.vim'
Bundle 'mitechie/pyflakes-pathogen'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
"Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
"Bundle 'vim-scripts/TaskList.vim'
Bundle 'vim-scripts/The-NERD-tree'
"Bundle 'wavded/vim-stylus'
" end my Bundles ----------------------

" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on " required!
""" end Vundle """""""""""""""""""""""""

" basics
set encoding=utf-8
set laststatus=2   " always show status bar
set t_Co=256       " paint with all the colors of the wind
set hidden         " really, i'm coming right back
set colorcolumn=80
let mapleader=","  " i hate typing \
set number
set foldmethod=indent
set foldlevelstart=99

" colors
syntax enable
set background=dark
colorscheme solarized

let g:Powerline_symbols = 'fancy'

" leader mappings
map <leader>n :NERDTreeToggle<CR>
map <leader>vs :source $MYVIMRC<CR>
map <leader>ve :e $MYVIMRC<CR>
map <leader>x :set paste<CR>"+p<CR>:set nopaste<CR>
map <leader>ack <Esc>:Ack!
map <leader>a :Tabularize /
map <leader>ae :Tabularize /=<CR>
map <leader>ac :Tabularize /:<CR>
map <leader>r <c-r>
map <leader>nodos :%s/\r\(\n\)/\1/g<CR>
map <leader>T :CommandTFlush<CR>
map <leader>gg :Glgrep 
map <leader>h :set hlsearch!<CR>

" nav mappings
map <leader>d <c-w>j
map <leader>e <c-w>k
map <leader>f <c-w>l
map <leader>s <c-w>h

map <leader>t :FufFile<CR>
map <leader>b :FufBuffer<CR>
map <leader>j :FufJumpList<CR>
map <leader>l :FufLine<CR>
map <leader>m :marks<CR>

" dictionaries
au FileType javascript setlocal dictionary+=$HOME/.vim/bundle/vim-node/dict/node.dict
au FileType coffee setlocal dictionary+=$HOME/.vim/bundle/vim-node/dict/node.dict

" not sure about this
let g:SuperTabDefaultCompletionType = "context"

" case insensitive (unless uppercase is typed)
set ignorecase
set smartcase

" let's ignore some files
:set wildignore +=.git,node_modules/**,docs/**,**.png,**.jpg,**vendor/**
"let g:CommandTMatchWindowAtTop = 1
let g:CommandTMaxHeight = 10
let g:CommandTMinHeight = 10

" default tabs
set ts=2 sts=2 sw=2
set expandtab
set smarttab
au FileType make setlocal noexpandtab

" 4 tab width for python
"au FileType python setlocal ts=4 sts=4 sw=4
let g:pydoc_open_cmd = 'vsplit'
let g:jedi#pydoc = ';'
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#rename_command = "<leader>ppppppppppppp" " never rename, it's buggy

" don't be dumb with <Nul>
imap <Nul> <Space>
map  <Nul> <Nop>
vmap <Nul> <Nop>
cmap <Nul> <Nop>
nmap <Nul> <Nop>

" for milesza/ack.vim
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" trim trailing whitespace
"autocmd BufWritePre * :%s/\s\+$//e

" open location window after lgrep
autocmd QuickFixCmdPost *lgrep* lopen

" remove the vertical dashes in split windows
:set fillchars-=vert:\|

" no ugly
if has("gui_running")
  set guioptions=-t
  set guifont=Inconsolata-dz\ for\ Powerline:h12
  highlight ExtraWhitespace ctermbg=red guibg=#aa0000
endif
