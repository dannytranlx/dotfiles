" Vunble configuration
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'edkolev/tmuxline.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mephux/vim-jsfmt'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'groenewege/vim-less'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'

call vundle#end()
filetype plugin indent on

" Map Leader key to ","
let mapleader = ","

" Airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='solarized'

" Tabs/Buffer
" Open new empty buffer
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to previous
nmap <leader>bx :bp <BAR> bd #<CR>
" Show all buffers
nmap <leader>bl :ls<CR>

" GitGutter
let g:gitgutter_realtime = 1

" NERDTree
let NERDTreeQuitOnOpen=1
let g:NERDTreeWinSize = 40
map <C-k>b :NERDTreeToggle<CR>

" Theme
let g:solarized_termcolors=16
set t_Co=256
colorscheme solarized
set background=dark
highlight SignColumn ctermbg=8
autocmd ColorScheme * highlight clear SignColumn

" jsfmt
let g:js_fmt_autosave = 0
let g:js_fmt_fail_silently = 0
let g:js_fmt_command = "jsfmt"

" ycm
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
set omnifunc=syntaxcomplete#Complete

" Syntax
syntax enable
let g:syntastic_check_on_open=1

" Line number
set number

" Display tabs and eol
"
nmap <leader>lc :set list!<CR>
set listchars=tab:▸\ ,trail:·

" Tabulation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Whitespace hightlight
autocmd BufWritePre *.py,*.java,*.rb,*.coffee,*.rake,*.js :%s/\s\+$//e
set fileformat=unix
highlight ExtraWhitespace ctermbg=red guibg=red

" Hotkeys
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|bower_components)|(\.(swp|ico|git|svn))$'

" Map jk  to Esc for quick Insert mode quits
:imap jk <Esc>

" Map hotkey for delimitMate
:imap <C-c> <CR><Esc>0

"disabling these keys should help me stop reaching for those keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" insert newline w/o Insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Settings
set nocompatible
set cursorline
set wildmenu
