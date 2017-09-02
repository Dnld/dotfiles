" Donald Steinert
" updated August 1, 2017
" https://github.com/Dnld/devtools

" Vundle
set nocompatible          
filetype off 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter' 
Plugin 'itchyny/lightline.vim'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'Shougo/neocomplete'
Plugin 'terryma/vim-multiple-cursors'

" plugins must be added before this line 
call vundle#end()            " required
filetype plugin indent on    " required

" plugin settings

" Autosave settings
let g:auto_save = 1
let g:auto_save_silent = 1

" Lightline settings
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

" Multiple-Cursors settings
nnoremap <silent> m :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> m :MultipleCursorsFind <C-R>/<CR>
function! Multiple_cursors_before()
    exe 'NeoCompleteLock'
endfunction
function! Multiple_cursors_after()
    exe 'NeoCompleteUnlock'
endfunction

" enable neocomplete
let g:neocomplete#enable_at_startup = 1

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" general settings
inoremap jj <Esc>
set ruler
set number
set laststatus=2
set smartindent
set smarttab
set autoindent
set shiftwidth=2
set hlsearch!
set nowrap
set noshowmode
set mouse=a
nnoremap , :noh<CR><CR>
nnoremap <silent> <Esc><Esc> :let @/=""<CR>
:hi SpellBad guibg=#ff2929 ctermbg=224

" syntax highlighting and theme
syntax enable
set t_Co=256
source ~/.vim/colors/Tomorrow-Night.vim
set background=dark 
set guifont=Source\ Code\ Pro:h13
if (has("termguicolors"))
  set termguicolors
endif
" splitpace configuration 
set splitbelow
set splitright

" move line up or down
nnoremap <C-J> :m .+1<CR>==
nnoremap <C-K> :m .-2<CR>==
inoremap <C-J> <Esc>:m .+1<CR>==gi
inoremap <C-K> <Esc>:m .-2<CR>==gi
nnoremap <C-J> :m '>+1<CR>gv=gv
vnoremap <C-K> :m '<-2<CR>gv=gv

" explorer settings
let mapleader=" "
map <leader><leader> :Explore<cr>
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" disables arrow keys
" nnoremap <Up> <NOP>
" nnoremap <Down> <NOP>
" nnoremap <Left> <NOP>
" nnoremap <Right> <NOP>
" inoremap <Up> <NOP>
" inoremap <Down> <NOP>
" inoremap <Left> <NOP>
" inoremap <Right> <NOP>

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" better pasting on a Mac
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    vmap <expr> <Esc>[200~ XTermPasteBegin("c")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

