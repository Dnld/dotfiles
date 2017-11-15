" Donald Steinert
" updated October 28, 2017
" https://github.com/Dnld/dotfiles

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
Plugin 'vim-airline/vim-airline'
Plugin 'enricobacis/vim-airline-clock'
Plugin 'vim-syntastic/syntastic'

" plugins must be added before this line
call vundle#end()            " required
filetype plugin indent on    " required

" plugin settings

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#clock#format = '%H:%M'

" Autosave settings
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_in_insert_mode = 0

" prevent excessive cpu usage by Git Gutter
let g:gitgutter_async=0

" enable Neocomplete and tab completion
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ neocomplete#start_manual_complete()
fun! s:check_back_space() "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfun"}}}

" general settings
let mapleader="9"
inoremap jj <Esc>
inoremap <leader>9 <Esc>
vnoremap <leader>9 <Esc>
map <C-T> :tabnew<cr>
set number
set tabstop=2
set shiftwidth=2
set smartindent
set autoindent
set cindent
set smarttab
set expandtab
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
set background=dark
set guifont=Source\ Code\ Pro:h13
source ~/.vim/colors/Tomorrow-Night.vim
let g:airline_theme='airlinecharcoal'
hi TabLineFill guifg=#252525
hi TabLine guibg=#252525 guifg=#555555
hi TabLineSel guifg=#BABABA guibg=#252525

" splitpace configuration
map <C-A> :vsplit<cr>
set splitbelow
set splitright

" move line or selection up or down
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" explorer settings
map <C-E> :Explore<cr>
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" better pasting on a Mac
if &term =~ "xterm.*"
  let &t_ti = &t_ti . "\e[?2004h"
  let &t_te = "\e[?2004l" . &t_te
  fun XTermPasteBegin(ret)
    set pastetoggle=<Esc>[201~
    set paste
    return a:ret
  endfun
  map <expr> <Esc>[200~ XTermPasteBegin("i")
  imap <expr> <Esc>[200~ XTermPasteBegin("")
  vmap <expr> <Esc>[200~ XTermPasteBegin("c")
  cmap <Esc>[200~ <nop>
  cmap <Esc>[201~ <nop>
endif

" trim all trailing whitespace (when exiting insert mode)
fun! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

