" Donald Steinert .vimrc
" https://github.com/Dnld/dotfiles
" Updated March 27, 2019

" Plug begin
call plug#begin('~/.vim/plugged')

" plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/vim-auto-save'
Plug 'vim-airline/vim-airline'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'fatih/vim-go'

" Plug end
call plug#end()

" plugin settings

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#clock#format = '%H:%M'

" Autosave settings
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_in_insert_mode = 0

" Deploete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" fzf
set rtp+=/usr/local/opt/fzf

" prevent excessive cpu usage by Git Gutter
let g:gitgutter_async=0

" NERDComToggleComment shortcut and configuration
nnoremap ' :call NERDComment(0,"toggle")<CR>
vnoremap ' :call NERDComment(0,"toggle")<CR>
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'

" NERDTree
map 2 :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" general settings
set formatoptions=tcroql
inoremap jj <Esc>
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

" search
nnoremap , :noh<CR><CR>
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

" file navigation, window management
nnoremap 1 :Explore<cr>
nnoremap 3 :FZF<cr>
nnoremap 4 :buffers<cr>
nnoremap 5 :tabnew<cr>
nnoremap 6 :tabNext<cr>
nnoremap 7 :vsplit<cr>
nnoremap 8 <C-W>h
nnoremap 9 <C-W>l

" colors, theme, font
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
source ~/.vim/colors/Thursday-Night-Monochrome.vim
set guifont=Source\ Code\ Pro:h13
syntax enable
let g:airline_theme='adaptive'
hi TabLineFill guifg=#2B2C2F
hi TabLine guibg=#555557 guifg=#2B2C2F

" move line or selection up, down, left, right
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <C-h> <<
nnoremap <C-l> >>
vnoremap <C-h> <gv
vnoremap <C-l> >gv

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
