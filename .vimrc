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
Plugin 'vim-scripts/vim-auto-save'
Plugin 'Shougo/neocomplete'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'

" plugins must be added before this line
call vundle#end()            " required
filetype plugin indent on    " required

" plugin settings

" Airline
let g:airline_powerline_fonts = 1

" Autosave settings
let g:auto_save = 1
let g:auto_save_silent = 1

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

" syntax highlighting and theme
syntax enable
if (has("termguicolors"))
  set termguicolors
endif
source ~/.vim/colors/Tomorrow-Night.vim
let g:airline_theme='bubblegum'
set background=dark
set guifont=Source\ Code\ Pro:h13
hi TabLineFill guifg=#393939
hi TabLine guibg=#252526 guifg=#555555
hi TabLineSel guifg=#AAAAAA guibg=#252525

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
map <C-E> :Explore<cr>
let g:netrw_banner = 0
let g:netrw_liststyle = 3

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

" trim all trailing whitespace
fun! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

