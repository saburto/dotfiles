set t_Co=16
set nocompatible
set lazyredraw
    set ttyfast

filetype off


call plug#begin('~/.vim/plugged')

" Plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'               " Comment stuff out
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'



Plug 'edkolev/tmuxline.vim'
Plug 'machakann/vim-highlightedyank'

Plug 'mhinz/vim-signify'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'benmills/vimux'


Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'blueyed/vim-diminactive'

Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'

call plug#end()


filetype plugin indent on

" Custom options
set number
set relativenumber
set cursorline
set background=light
set ts=2
set sw=2
set expandtab
set list
set eol
set encoding=UTF-8
set splitbelow
set splitright
set clipboard=unnamedplus
" colorscheme nord
colorscheme solarized

let maplocalleader = "\\"
let mapleader=","

let python_highlight_all = 1

imap jj <esc>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>


let g:SimpylFold_docstring_preview=1

let g:tmuxline_powerline_separators = 1

map <C-p> <esc>:Files<CR>
map <C-e> <esc>:Buffers<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> <leader>. :AgIn

nnoremap <silent> <leader>sw :call SearchWordWithAg()<CR>
vnoremap <silent> <leader>sw :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>
nnoremap <silent> <leader>fc :call SearchFromClipboard()<CR>

function! SearchWordWithAg()
  execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Ag' selection
endfunction

function! SearchWithAgInDirectory(...)
  call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
endfunction
command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)

function! SearchFromClipboard()
  execute 'Ag' getreg("+")
endfunction


nnoremap <leader>pp :put +<CR>
nnoremap <leader>ev :e ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>


imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})


"Configure swap and backup
set backupdir=/tmp
set directory=/tmp

let g:ackprg = 'ag --vimgrep'

let g:fzf_tags_command = 'ctags -R'


noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

map y <Plug>(highlightedyank)
let g:airline#extensions#tabline#enabled = 1
let g:airline_extensions = []
let g:airline#extensions#ale#enabled = 0
let g:airline_powerline_fonts = 1


vnoremap // y/\V<C-R>"<CR>

map <leader>pj :%!python -m json.tool<CR>

autocmd Filetype yaml setlocal ai ts=2 sw=2 et

set clipboard=unnamedplus
