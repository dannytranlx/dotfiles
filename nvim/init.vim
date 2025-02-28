"plugins {{{
    call plug#begin('~/.local/share/nvim/plugged')
    " core
    Plug 'mileszs/ack.vim'
    Plug 'bling/vim-airline'
    Plug 'jeetsukumaran/vim-buffergator'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'mhartington/oceanic-next'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'

    " js
    Plug 'w0rp/ale'
    Plug 'geekjuice/vim-mocha'
    Plug 'prettier/vim-prettier', {
      \ 'do': 'npm install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
    Plug 'leafgarland/typescript-vim'
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

    " python
    Plug 'psf/black'
    call plug#end()
" }}}

" keybinds {{{
    " remap jk
    :imap jk <Esc>
    nnoremap j gj
    nnoremap k gk

    " clear hightlight
    nnoremap <CR> :noh<CR><CR>

    " folding
    nnoremap <space> za
" }}}

" nvim settings {{{
    set cursorline
    set hidden
    set hlsearch
    set mouse=a
    set nocompatible
    set nowrap
    set number
    set splitright
    set updatetime=100
    set wildmenu
    set ignorecase
    set foldmethod=indent
    set foldlevel=99

    " Map Leader key to ","
    let mapleader = ","

    " Tabulation
    set backspace=indent,eol,start
    set expandtab
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2

    " Display tabs and eol
    nmap <leader>lc :set list!<CR>
    set list
    set listchars=tab:▸\ ,trail:·

    " Whitespace hightlight
    autocmd BufWritePre *.py,*.java,*.rb,*.coffee,*.rake,*.js,*.json,*.yml :%s/\s\+$//e
    set fileformat=unix
    highlight ExtraWhitespace ctermbg=red guibg=red

    " scroll the viewport faster
    nnoremap <C-e> 3<C-e>
    nnoremap <C-y> 3<C-y>

    " separator
    set fillchars+=vert:\ 
" }}}

" ack
cnoreabbrev Ack Ack!

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tmuxline#enabled=1
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1

" Buffergator
let g:buffergator_viewport_split_policy = 'B'
let g:buffergator_suppress_keymaps = 1

nmap <leader>jj :BuffergatorMruCyclePrev<cr>
nmap <leader>kk :BuffergatorMruCycleNext<cr>
nmap <leader>bl :BuffergatorOpen<cr>

" Close the current buffer and move to previous
nmap <leader>bq :bp <BAR> bd #<CR>

" ctrl p
let g:ctrlp_custom_ignore='\v[\/](.git|node_modules|target|dist|bower_components|vendor)|(\.(swp|ico|git|svn))$'
let g:ctrlp_dont_split='NERD'
let g:ctrlp_working_path_mode=0
let g:ctrlp_show_hidden=1
let g:ctrlp_max_files = 0

" GitGutter
let g:gitgutter_realtime=1

" nerdtree
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>

" prettier
nmap <Leader>f <Plug>(Prettier)

"colorscheme {{{
    "if (has("termguicolors"))
        "set termguicolors
    "endif

    "colorscheme oceanic
    "let g:oceanic_next_terminal_bold=1
    "let g:oceanic_next_terminal_italic=1

    " colorscheme OceanicNext
    syntax on
    filetype plugin on
    "colorscheme OceanicNext
    colorscheme catppuccin-macchiato " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

    " airline
    let g:airline_theme='catppuccin'
"}}}
