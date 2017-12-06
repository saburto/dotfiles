" Vundle .vi

set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-sensible.git'
Plugin 'itchyny/lightline.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/fzf.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-fireplace'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'neowit/vim-force.com'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'iCyMind/NeoSolarized'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'vim-scripts/paredit.vim'
Plugin 'benmills/vimux'
Plugin 'w0rp/ale'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'roxma/nvim-completion-manager'
Plugin 'cohama/agit.vim'
Plugin 'machakann/vim-highlightedyank'



call vundle#end()
filetype plugin indent on

" Custom options
set number
set cursorline
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
"nmap s <Plug>(easymotion-overwin-f2)
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

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
map <C-p> <esc>:Files<CR>
map <C-e> <esc>:Buffers<CR>



let g:tagbar_type_scala = {
    \ 'ctagstype' : 'scala',
    \ 'sro'       : '.',
    \ 'kinds'     : [
      \ 'p:packages',
      \ 'T:types:1',
      \ 't:traits',
      \ 'o:objects',
      \ 'O:case objects',
      \ 'c:classes',
      \ 'C:case classes',
      \ 'm:methods',
      \ 'V:values:1',
      \ 'v:variables:1'
    \ ]
    \ }

" configuration for ctrlp
let g:ctrlp_use_caching = 0
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<c-t>'],
      \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
      \ }

"Configure swap and backup
set backupdir=/tmp
set directory=/tmp

"Configuration of vim force


let g:apex_tooling_force_dot_com_path = "/home/saburto/app/sfdc/toolling-force.com.jar"
if !exists("g:apex_backup_folder")
  " full path required here, relative may not work
  let g:apex_backup_folder="/tmp"
endif
if !exists("g:apex_temp_folder")
  " full path required here, relative may not work
  let g:apex_temp_folder="/tmp"
endif
if !exists("g:apex_properties_folder")
  " full path required here, relative may not work
  let g:apex_properties_folder="/tmp"
endif

let g:ackprg = 'ag --vimgrep'
let g:limelight_conceal_ctermfg = 'gray'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

if has("autocmd")
  filetype on
  "map <Leader>p <esc>:w<CR>:!force aura push -f %<CR>
  let test = expand('%:t:r').'Test'
  autocmd FileType apexcode map <Leader>r <esc>:w<CR>:VimuxRunCommand("force push -f ". expand("%:p") . " -test " . expand("%:t:r") . "Test")<CR>
  autocmd FileType apexcode-test map <Leader>r <esc>:w<CR>:VimuxRunCommand("force push -f ". expand("%:p") . " -test " . expand("%:t:r"))<CR>
end

let g:fzf_tags_command = 'ctags -R'
let g:python3_host_prog = '/usr/bin/python3'


noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

map y <Plug>(highlightedyank)
