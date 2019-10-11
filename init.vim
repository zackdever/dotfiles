call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdTree'
Plug 'tpope/vim-sensible'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'digitaltoad/vim-pug'
"if has('nvim')
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
  "Plug 'Shougo/deoplete.nvim'
  "Plug 'roxma/nvim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc'
"endif
"Plug 'deoplete-plugins/deoplete-jedi'
"Plug 'clojure-vim/async-clj-omni'
"let g:deoplete#enable_at_startup = 1
call plug#end()


"call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})

set background=dark
colorscheme solarized
set encoding=utf-8
syntax on
syntax enable
set hidden 
set number
" default tabs
set ts=2 sts=2 sw=2
set expandtab
set smarttab
au FileType make setlocal noexpandtab

let mapleader=","
map <leader>dd <c-w>j
map <leader>e <c-w>k
map <leader>f <c-w>l
map <leader>s <c-w>h

map <leader>n :NERDTreeToggle<CR>

" case insensitive (unless uppercase is typed)
set ignorecase
set smartcase

" fzf - GFiles=git tracked
" lots of good notes at https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
nmap <Leader>t :GFiles<CR> 
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History:<CR>

let g:airline_powerline_fonts = 1
" remove the vertical dashes in split windows
hi VertSplit ctermbg=None ctermfg=bg

" Reloads vimrc after saving but keep cursor position
if !exists('*ReloadVimrc')
   fun! ReloadVimrc()
       let save_cursor = getcurpos()
       source $MYVIMRC
       call setpos('.', save_cursor)
   endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc() 
