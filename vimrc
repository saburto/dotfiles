
set nocompatible
filetype off

set rtp+=/usr/local/opt/fzf
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
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-projectionist'

Plug 'rhysd/clever-f.vim'

Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'



Plug 'edkolev/tmuxline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'altercation/vim-colors-solarized'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'

Plug 'Valloric/YouCompleteMe'           " Autocomplete plugin

Plug 'pangloss/vim-javascript', { 'for' : 'javascript' }
Plug 'mxw/vim-jsx', { 'for' : 'jsx' }

Plug 'mhinz/vim-signify'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'ervandew/supertab'
Plug 'hdima/python-syntax'
Plug 'w0rp/ale'

Plug 'benmills/vimux'

Plug 'janko-m/vim-test'

Plug 'majutsushi/tagbar'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'blueyed/vim-diminactive'


call plug#end()
filetype plugin indent on

" Custom options
set number
set relativenumber
set cursorline
set background=light
colorscheme solarized
set ts=2
set sw=2
set expandtab
set list
set eol
set encoding=UTF-8
set splitbelow
set splitright

let maplocalleader = "\\"
let mapleader=","

let python_highlight_all = 1
let g:ale_completion_enabled = 0
let g:ale_linters = {'java': []}

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
imap jj <esc>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>

let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__'] "ignore files in NERDTree
let NERDTreeWinSize=40

map <leader>tf :call NERDTreeToggleAndFind()<cr>
map <leader>tt :NERDTreeToggle<CR>

function! NERDTreeToggleAndFind()
  if (exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1)
    execute ':NERDTreeClose'
  else
    execute ':NERDTreeFind'
  endif
endfunction

let g:SimpylFold_docstring_preview=1

let g:tmuxline_powerline_separators = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

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

nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>
nnoremap <leader>fo :YcmCompleter Format<CR>
nnoremap <leader>oi :YcmCompleter OrganizeImports<CR>
nnoremap <leader>rn :YcmCompleter RefactorRename 
nmap <leader>gd     :YcmDiags<CR>

nnoremap <leader>rt :call VimuxRunCommand("mvn -pl :" . split(expand('%'), '/')[0] . " test -Dtest=" .  expand('%:t:r') . " -DfailIfNoTests=true")<CR>

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
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:ycm_always_populate_location_list = 1
let g:airline#extensions#tmuxline#enabled = 0


vmap <leader>ts "vy:call VimuxOpenRunner()<CR>:call VimuxSendText(@v)<CR>:call VimuxSendKeys("Enter")<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

let VimuxUseNearestPane = 1

let test#strategy = "vimux"
let test#python#runner = 'nose'
let test#enabled_runners = ["python#nose"]

nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g


vnoremap // y/\V<C-R>"<CR>

map <leader>pj :%!python -m json.tool

let g:diminactive_enable_focus = 1
