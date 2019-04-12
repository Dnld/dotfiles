" Donald Steinert .vimrc
" https://github.com/Dnld/dotfiles
" Updated April 12, 2019

" Plug begin
call plug#begin('~/.vim/plugged')

" plugins
Plug '/usr/local/opt/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
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

" fzf
set rtp+=/usr/local/opt/fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

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
nnoremap <Leader>1 :Explore<CR>
nnoremap <Leader>2 :FZF<cr>
nnoremap <Leader>3 :Ag<cr>
nnoremap <Leader>4 :buffers<CR>:buffer<Space>
nnoremap <Leader>5 :bn<cr>
nnoremap <Leader>6 :bd<cr>
nnoremap <Leader>7 :tabnew<cr>
nnoremap <Leader>8 :tabNext<cr>
nnoremap <Leader>9 <C-W>h
nnoremap <Leader>0 <C-W>j
nnoremap <Leader>- <C-W>k
nnoremap <Leader>= <C-W>l

" colors, theme, font
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
colorscheme nord
set guifont=Source\ Code\ Pro:h13
syntax enable
let g:airline_theme='adaptive'

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
