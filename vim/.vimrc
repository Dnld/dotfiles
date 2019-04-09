" Donald Steinert .vimrc
" https://github.com/Dnld/dotfiles
" Updated April 9, 2019

" Plug begin
call plug#begin('~/.vim/plugged')

" plugins
Plug '/usr/local/opt/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/vim-auto-save'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'

" Plug end
call plug#end()

" plugin settings

" Airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '|'
let g:airline_section_y = '%3p%%'
let g:airline_section_z = '%3l %2v'
let g:airline#extensions#ale#enabled = 0

" Ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_set_highlights = 0
hi ALEWarningSign guifg=#BABABA

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
let g:gitgutter_async = 0

" NERDComToggleComment shortcut and configuration
nnoremap ' :call NERDComment(0,"toggle")<CR>
vnoremap ' :call NERDComment(0,"toggle")<CR>
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1

" general settings
set formatoptions=tcroql
inoremap jj <Esc>
let mapleader = "\<Space>"
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

" bind R to r for replace mode
nnoremap r R

" file navigation, window management
map <Leader>1 :NERDTreeToggle<CR>
nnoremap <Leader>2 :FZF<cr>
nnoremap <Leader>3 :buffers<CR>:buffer<Space>
nnoremap <Leader>4 :bd<cr>
nnoremap <Leader>5 :tabnew<cr>
nnoremap <Leader>6 :tabNext<cr>
nnoremap <Leader>7 :vsplit n<cr>
nnoremap <Leader>8 <C-W>h
nnoremap <Leader>9 <C-W>l
nnoremap <Leader>0 :split n<cr>
nnoremap <Leader>- <C-W>j
nnoremap <Leader>= <C-W>k

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
