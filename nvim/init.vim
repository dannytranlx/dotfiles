"plugins {{{
    call plug#begin('~/.local/share/nvim/plugged')
    " core
    Plug 'bling/vim-airline'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'mhartington/oceanic-next'
    Plug 'scrooloose/nerdtree', {
            \ 'on': ['NERDTreeToggle',
            \        'NERDTreeFind']
            \ }

    " js
    Plug 'w0rp/ale'
    Plug 'millermedeiros/vim-esformatter'
    Plug 'othree/yajs.vim'
    call plug#end()
" }}}

" keybinds {{{
    " remap jk
    :imap jk <Esc>
    nnoremap j gj
    nnoremap k gk

    " clear hightlight
    nnoremap <CR> :noh<CR><CR>
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

    " Tabulation
    set backspace=indent,eol,start
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4

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
" }}}

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tmuxline#enabled=1
let g:airline#extensions#ale#enabled=1

" ctrl p
let g:ctrlp_custom_ignore='\v[\/](node_modules|target|dist|bower_components)|(\.(swp|ico|git|svn))$'
let g:ctrlp_dont_split='NERD'
let g:ctrlp_working_path_mode=0
let g:ctrlp_show_hidden=1

" GitGutter
let g:gitgutter_realtime=1

"colorscheme {{{
    if (has("termguicolors"))
        set termguicolors
    endif

    "colorscheme oceanic
    let g:oceanic_next_terminal_bold=1
    let g:oceanic_next_terminal_italic=1

    " colorscheme OceanicNext
    syntax on
    filetype plugin on
    colorscheme OceanicNext

    " airline
    let g:airline_theme='oceanicnext'
"}}}
