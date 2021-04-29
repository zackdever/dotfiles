call plug#begin('~/.nvim/plugged')
" b/c i need the latest version not in github
" https://github.com/junegunn/fzf/commit/7ceb58b2aadfcf0f5e99da83626cf88d282159b2#commitcomment-37107474
"Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug '/usr/local/opt/fzf' " otherwise i can use my system fzf
Plug 'junegunn/fzf.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'digitaltoad/vim-pug'
"Plug 'ervandew/supertab'
Plug 'ludovicchabant/vim-gutentags' " using with ripper-tags
Plug 'scrooloose/nerdTree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " needed for :Gbrowse in vim-fugitive
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go'
"Plug 'vim-syntastic/syntastic'

" evaluating
Plug 'rodjek/vim-puppet'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'fholgado/minibufexpl.vim'
"Plug 'rstacruz/vim-closer' " had conflicts with CoC
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
"Plug 'Xuyuanp/nerdtree-git-plugin' " I think this is slowing things down
"Plug 'tpope/vim-endwise' " maybe also CoC conflicts? - this seems to be it
" should test vim-closer again or try to get this working with CoC
call plug#end()

"set background=light
set background=dark
"colorscheme solarized
colorscheme gruvbox
set encoding=utf-8
syntax on
syntax enable
set hidden 
set number
set termguicolors
set colorcolumn=80

" default tabs
set ts=2 sts=2 sw=2
set expandtab
set smarttab
au FileType make setlocal noexpandtab

let mapleader=","
map <leader>c <c-w>j
map <leader>e <c-w>k
map <leader>f <c-w>l
map <leader>s <c-w>h

map <leader>nt :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1

" close if nerdtree is the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

map <leader>dn :bn\|bd #<CR>
map <leader>dp :bp\|bd #<CR>

" case insensitive (unless uppercase is typed)
set ignorecase
set smartcase

" fzf - GFiles=git tracked
" lots of good notes at https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
nmap <Leader>t :GFiles<CR> 
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>H :History:<CR>

map <leader>h :set hlsearch!<CR>
map <leader>vs :source $MYVIMRC<CR>
map <leader>ve :e $MYVIMRC<CR>

" go to tag
nnoremap <leader>g <C-]>


let g:gitgutter_git_executable = '/usr/local/bin/git'
set updatetime=1000 " gitgutter update is tied to this

" use ripper-tags instead of generage ctags for ruby
let g:gutentags_ctags_executable_ruby = 'ripper-tags'
let g:gutentags_ctags_extra_args = ['--ignore-unsupported-options', '--recursive']

let g:airline_powerline_fonts = 1

" Ruby functions can have special characters at the end
" Thanks @ek!
augroup RubySpecialKeywordCharacters
  autocmd!
  autocmd Filetype ruby setlocal iskeyword+=!
  autocmd Filetype ruby setlocal iskeyword+=?
augroup END"

:set wildignore +=.git,node_modules/**,docs/**,**.png,**.jpg,**vendor/**

" Reloads vimrc after saving but keep cursor position
if !exists('*ReloadVimrc')
   fun! ReloadVimrc()
       let save_cursor = getcurpos()
       source $MYVIMRC
       call setpos('.', save_cursor)
   endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc() 

if has("gui_running")
  set guioptions=-t
  set guifont=Source\ Code\ Pro\ for\ Powerline:h14
  "set guifont=Source\ Code\ Pro\ for\ Powerline:h16
  highlight ExtraWhitespace ctermbg=red guibg=#aa0000
  " remove the vertical dashes in split windows
  :set fillchars-=vert:\|
else
  " remove the vertical dashes in split windows
  hi VertSplit ctermbg=None ctermfg=bg
endif

" auto reload ~/.vimrc
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" when macvim release 8.2 i can have a floating fzf window!
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" TODO check out this status line:
" https://github.com/elenapan/dotfiles/blob/master/config/nvim/statusline.vim
" https://www.reddit.com/r/neovim/comments/djmehv/im_probably_really_late_to_the_party_but_fzf_in_a/
"
let g:go_fmt_command = "goimports"

" za=toggle, zo=open, zc=close
"set foldmethod=syntax
"set foldlevelstart=20

source ~/.coc.vimrc
