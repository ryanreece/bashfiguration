" Don't try to be compatible with VI
set nocompatible

" Load pathogen to autoload all plugins in ~/.vim/bundle
execute pathogen#infect()

" Add syntax highlighing and indenting
syntax on
filetype plugin indent on

" Keymappings for moving between windows. Removed <C-w> prefix.
map <C-h> <C-w><C-h>
map <C-j> <C-w><C-j>
map <C-k> <C-w><C-k>
map <C-l> <C-w><C-l>

" Toggle shortcut for NERDTree
map <C-g> :NERDTreeToggle<CR>

" Define a cool colorscheme
colorscheme grb256

" Tabs
set smartindent
" Tabs are great, but they don't need to be huge
set tabstop=2
set softtabstop=2
set shiftwidth=2
" Please don't convert our tabs to spaces.
set noexpandtab

" We all like line numbers
set nu

" Format git commit messages
au FileType gitcommit set tw=72
