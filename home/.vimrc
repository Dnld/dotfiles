" Donald Steinert .vimrc
" https://github.com/Dnld/dotfiles
" Updated December 28, 2020

" plug begin
call plug#begin('~/.vim/plugged')

" plugins
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nightsense/cosmic_latte'
Plug 'nightsense/snow'
Plug 'reedes/vim-pencil'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/vim-auto-save'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'

" plug end
call plug#end()

" plugin settings

" airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '|'
let g:airline_section_z = '%3l %2v'
let g:airline_section_y = '%3p%%'
let g:airline_section_warning = ''
let g:airline_section_error = ''
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tabs = 0

" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_set_highlights = 0
let g:ale_change_sign_column_color = 0
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_info = '•'

" autosave
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_in_insert_mode = 0

" coc
let g:coc_global_extensions = [
\ 'coc-css',
\ 'coc-go',
\ 'coc-html',
\ 'coc-json',
\ 'coc-prettier',
\ 'coc-python',
\ 'coc-tsserver',
\ ]
set updatetime=300
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
 let col = col('.') - 1
 return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
 execute 'h '.expand('<cword>')
else
 call CocAction('doHover')
endif
endfunction
if exists('*complete_info')
 inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
 imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" fzf
set rtp+=/usr/local/opt/fzf
let g:fzf_colors =
\ {'fg':      ['fg', 'Normal'],
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
\ 'header':  ['fg', 'Comment']}
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
\| autocmd BufLeave <buffer> set laststatus=2 noshowmode noruler
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" NERDComToggleComment shortcut and configuration
nnoremap ' :call NERDComment(0,"toggle")<CR>
vnoremap ' :call NERDComment(0,"toggle")<CR>
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'

" nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeNodeDelimiter = "\u00a0"

" general config
set nocompatible
set formatoptions=tcroql
set cb=unnamed
inoremap jj <Esc>
let mapleader = "\<Space>"
set guicursor=
set number
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set cindent
set smarttab
set expandtab
set hlsearch
set incsearch
set ignorecase
set smartcase
set nowrap
set noshowmode
set splitbelow
set splitright
set mouse=a
set nobackup
set nowritebackup
set noswapfile
set hidden
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

" search
nnoremap , :noh<CR>
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

" clan up buffers
nnoremap <Leader>b :bufdo e<CR>
nnoremap <Leader>c :bufdo bwipeout<CR>
nnoremap <Leader>s :do Syntax<CR>

" file navigation, window management
nnoremap <Leader>1 :NERDTreeToggle<CR>
nnoremap <Leader>2 :FZF<CR>
nnoremap <Leader>3 :Ag<CR>
nnoremap <Leader>h <C-W>w
nnoremap <Leader>j :bnext<CR>
nnoremap <Leader>k :bprevious<CR>
nnoremap <Leader>l :bd<CR>

" colors, theme, font
if (has("termguicolors"))
 set termguicolors
endif
set guifont=Source\ Code\ Pro:h13
syntax on
let g:airline_theme='adaptive'
let g:go_highlight_trailing_whitespace_error=0
" tweaks colors for dark snow theme
fun Dark()
 colorscheme snow
 set background=dark
 highlight VertSplit guifg=#363A3E guibg=#363A3E
 highlight LineNr guibg=#363A3E
 highlight StatusLine guifg=#363A3E guibg=#AFB7C0
 highlight WildMenu guifg=#759ABD
 highlight SignColumn guibg=#363A3E
 highlight CursorLineNr guifg=#759ABD guibg=#363A3E
 highlight ALEErrorSign guifg=#BE868C guibg=#363A3E
 highlight ALEWarningSign guifg=#AB916D guibg=#363A3E
 highlight TabLineSel guifg=#363A3E guibg=#759ABD
 highlight Visual guifg=#759ABD guibg=#2C2D30 gui=none
endfun
" tweaks colors for light snow theme
fun LightSnow()
 colorscheme snow
 set background=light
 highlight VertSplit guifg=#E5EBF1 guibg=#E5EBF1
 highlight LineNr guibg=#E5EBF1
 highlight StatusLine guifg=#E5EBF1 guibg=#535C65
 highlight WildMenu guifg=#2B7AB2
 highlight SignColumn guibg=#E5EBF1
 highlight CursorLineNr guifg=#2B7AB2 guibg=#E5EBF1
 highlight ALEErrorSign guifg=#AE5865 guibg=#E5EBF1
 highlight ALEWarningSign guifg=#906C33 guibg=#E5EBF1
 highlight TabLineSel guifg=#E5EBF1 guibg=#2B7AB2
 highlight Visual guifg=#2B7AB2 guibg=#FBFFFF gui=none
endfun
" tweaks colors for dark cosmic latte theme
fun DarkLatte()
 colorscheme cosmic_latte
 set background=dark
 highlight VertSplit guifg=#2B3740 guibg=#2B3740
 highlight LineNr guibg=#2B3740
 highlight StatusLine guifg=#2B3740 guibg=#ABB0C0
 highlight WildMenu guifg=#2B3740 guibg=#5496BD
 highlight SignColumn guibg=#2B3740
 highlight CursorLineNr guifg=#5496BD guibg=#2B3740
 highlight ALEErrorSign guifg=#C17B8D guibg=#2B3740
 highlight ALEWarningSign guifg=#B28761 guibg=#2B3740
 highlight TabLineSel guifg=#2B3740 guibg=#5496BD
 highlight Visual guibg=#5496BD guifg=#202A31 gui=none
endfun
" tweaks colors for light cosmic latte theme
fun Light()
 colorscheme cosmic_latte
 set background=light
 highlight VertSplit guifg=#EFE4D2 guibg=#EFE4D2
 highlight LineNr guibg=#EFE4D2
 highlight StatusLine guifg=#EFE4D2 guibg=#485A62
 highlight WildMenu guifg=#EFE4D2 guibg=#0075C9
 highlight SignColumn guibg=#EFE4D2
 highlight CursorLineNr guifg=#0075C9 guibg=#EFE4D2
 highlight ALEErrorSign guifg=#FF0056 guibg=#EFE4D2
 highlight ALEWarningSign guifg=#916D03 guibg=#EFE4D2
 highlight TabLineSel guifg=#EFE4D2 guibg=#0075C9
 highlight Visual guibg=#0075C9 guifg=#FFF8E7 gui=none
endfun
" default to dark snow theme
call Dark()

" move selection up, down, left, right
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-h> <gv
vnoremap <C-l> >gv

" explorer settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:NetrwIsOpen=0

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
