set nocompatible

filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'edkolev/tmuxline.vim'
Bundle 'tpope/vim-sensible.git'
Bundle 'itchyny/lightline.vim'
Bundle 'easymotion/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'ejholmes/vim-forcedotcom'
Bundle 'derekwyatt/vim-scala'
Bundle 'altercation/vim-colors-solarized.git'



set number relativenumber
let g:solarized_termcolors=256
set background=light
colorscheme solarized
set ts=2
set sw=2
set expandtab
set list
set eol
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" " s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
"
" " Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
"
" " Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

set noshowmode

let g:lightline = {
	\ 'colorscheme' : 'solarized'
	\}

let g:tmuxline_powerline_separators = 0
