" Vundle

set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-sensible.git'
Plugin 'itchyny/lightline.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'vimwiki/vimwiki'
Plugin 'neowit/vim-force.com'
Plugin 'valloric/youcompleteme'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'christoomey/vim-tmux-runner'

call vundle#end()
filetype plugin indent on

" Custom options
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

command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
map <Leader>p <esc>:w<CR>:Silent force aura push -f %<CR>

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

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
