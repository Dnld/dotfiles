" Donald Steinert .vimrc
" https://github.com/Dnld/dotfiles
" Updated February 5, 2019

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
Plugin 'vim-airline/vim-airline'
Plugin 'enricobacis/vim-airline-clock'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'fatih/vim-go'

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

" NERDComToggleComment shortcut and configuration
nnoremap 7 :call NERDComment(0,"toggle")<CR>
vnoremap 7 :call NERDComment(0,"toggle")<CR>
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'

" general settings
set formatoptions=tcroql
inoremap jj <Esc>
let mapleader="9"
inoremap <leader>9 <Esc>
vnoremap <leader>9 <Esc>
set number
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set cindent
set smarttab
set expandtab
set hlsearch!
set incsearch
set ignorecase
set smartcase
set nowrap
set noshowmode
set splitbelow
set splitright
set mouse=a
nnoremap , :noh<CR><CR>
nnoremap <silent> <Esc><Esc> :let @/=""<CR>
nnoremap 1 :Explore<cr>
nnoremap 2 :CtrlP<cr>
nnoremap 3 :buffers<cr>
nnoremap 4 :tabnew<cr>
nnoremap 5 :tabNext<cr>
nnoremap 6 :vsplit<cr>

" syntax highlighting and theme
syntax enable
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
set guifont=Source\ Code\ Pro:h13
source ~/.vim/colors/Thursday-Night.vim
let g:airline_theme='adaptive'
hi TabLineFill guifg=#2B2C2F
hi TabLine guibg=#555557 guifg=#2B2C2F
hi TabLineSel guifg=#BABABA guibg=#2B2C2F

" move line or selection up or down
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" explorer settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" trim all trailing whitespace (when exiting insert mode)
fun! TrimWhitespace()
 let l:save = winsaveview()
 %s/\s\+$//e
 call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

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

