"for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
"	exe 'source' f
"endfor
" Enable syntax highlighting
" Set Leader key
:let mapleader = " "


"  ██▓███   ██▓    █    ██   ▄████  ██▓ ███▄    █   ██████ 
" ▓██░  ██▒▓██▒    ██  ▓██▒ ██▒ ▀█▒▓██▒ ██ ▀█   █ ▒██    ▒ 
" ▓██░ ██▓▒▒██░   ▓██  ▒██░▒██░▄▄▄░▒██▒▓██  ▀█ ██▒░ ▓██▄   
" ▒██▄█▓▒ ▒▒██░   ▓▓█  ░██░░▓█  ██▓░██░▓██▒  ▐▌██▒  ▒   ██▒
" ▒██▒ ░  ░░██████▒▒█████▓ ░▒▓███▀▒░██░▒██░   ▓██░▒██████▒▒
" ▒▓▒░ ░  ░░ ▒░▓  ░▒▓▒ ▒ ▒  ░▒   ▒ ░▓  ░ ▒░   ▒ ▒ ▒ ▒▓▒ ▒ ░
" ░▒ ░     ░ ░ ▒  ░░▒░ ░ ░   ░   ░  ▒ ░░ ░░   ░ ▒░░ ░▒  ░ ░
" ░░         ░ ░   ░░░ ░ ░ ░ ░   ░  ▒ ░   ░   ░ ░ ░  ░  ░  
"              ░  ░  ░           ░  ░           ░       ░  
                                                         
" Load Plugins 
call plug#begin('~/.config/nvim/plugged')
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'godlygeek/tabular'
Plug 'lervag/vimtex'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/neovim-remote', {'do': 'python setup.py install --user'}
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
" Theming
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ayu-theme/ayu-vim'
" Vim Syntax Highlight support 
Plug 'elzr/vim-json'
Plug 'dcharbon/vim-flatbuffers'
Plug 'dag/vim-fish' 
call plug#end()

set backspace=indent,eol,start                            " Fixes backspace
set ruler                                                 " Enable line/column info at bottom
set history=100
set cursorline                                            " highlights current line
set scrolloff=10
set ai                                                    " Autoindentation
filetype indent plugin on
set clipboard+=unnamedplus                                " Copies using system clipboard
set tabstop=4                                             " Tab = 4 spaces
set shiftwidth=4
set expandtab                                             " set sta
set sts=4                                                 " softtabstop, makes spaces feel like tabs when deleting
set mouse=a mousemodel=popup                              " enable mouse support
autocmd BufNewFile,BufReadPost *.md set filetype=markdown " markdown file recognition
autocmd BufNewFile,BufReadPost *.md.html set filetype=markdownd

" Enabling vertical indentation guides
" :set listchars=tab:\|\ 
" :set list

set number
set relativenumber


" Configuring theme
set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu


 " ▄▄▄       ██▓ ██▀███   ██▓     ██▓ ███▄    █▓█████ 
" ▒████▄    ▓██▒▓██ ▒ ██▒▓██▒    ▓██▒ ██ ▀█   █▓█   ▀ 
" ▒██  ▀█▄  ▒██▒▓██ ░▄█ ▒▒██░    ▒██▒▓██  ▀█ ██▒███   
" ░██▄▄▄▄██ ░██░▒██▀▀█▄  ▒██░    ░██░▓██▒  ▐▌██▒▓█  ▄ 
 " ▓█   ▓██▒░██░░██▓ ▒██▒░██████▒░██░▒██░   ▓██░▒████▒
 " ▒▒   ▓▒█░░▓  ░ ▒▓ ░▒▓░░ ▒░▓  ░░▓  ░ ▒░   ▒ ▒░░ ▒░ ░
 "  ▒   ▒▒ ░ ▒ ░  ░▒ ░ ▒░░ ░ ▒  ░ ▒ ░░ ░░   ░ ▒░░ ░  ░
 "  ░   ▒    ▒ ░  ░░   ░   ░ ░    ▒ ░   ░   ░ ░   ░   
 "      ░  ░ ░     ░         ░  ░ ░           ░   ░  ░
                                                    
" Configuring Airline
let g:airline_theme='luna'
" let g:airline_left_sep='>>'
" let g:airline_right_sep='<<'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''    "" Causing lot of errors
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.maxlinenr = ''


" Disabling arrow keys
imap <Up> <Esc>:throw 'you are fucked UP' <CR>
imap <Down> <Esc>:throw 'you are beat DOWN' <CR>
imap <Left> <Esc>:throw 'you suck LEFT' <CR>
imap <Right> <Esc>:throw 'you suck RIGHt' <CR>
nmap <Up> <Esc>:throw 'you are fucked UP' <CR>
nmap <Down> <Esc>:throw 'you are beat DOWN' <CR>
nmap <Left> <Esc>:throw 'you suck LEFT' <CR>
nmap <Right> <Esc>:throw 'you suck RIGHt' <CR>

autocmd VimEnter * :silent !chcaps
" autocmd VimLeave * :silent !chback


" ▓██   ██▓ ▄████▄   ███▄ ▄███▓
"  ▒██  ██▒▒██▀ ▀█  ▓██▒▀█▀ ██▒
"   ▒██ ██░▒▓█    ▄ ▓██    ▓██░
"   ░ ▐██▓░▒▓▓▄ ▄██▒▒██    ▒██ 
"   ░ ██▒▓░▒ ▓███▀ ░▒██▒   ░██▒
"    ██▒▒▒ ░ ░▒ ▒  ░░ ▒░   ░  ░
"  ▓██ ░▒░   ░  ▒   ░  ░      ░
"  ▒ ▒ ░░  ░        ░      ░   
"  ░ ░     ░ ░             ░   
"  ░ ░     ░                   
" Configuring You Complete Me
let g:ycm_server_python_interpretor = "/usr/bin/python2.7" 
let g:python3_host_prog = "/usr/bin/python"

let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_complete_in_comments = 1 " turn on completion in comments
let g:ycm_confirm_extra_conf=0 " load .ycm_conf by default
let g:ycm_collect_identifiers_from_tags_files=1 " use tag information
" set completeopt- = preview " start completion from first character
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_cache_omnifunc = 0
let g:ycm_seed_identifiers_with_syntax=1 " complete syntax keywords

" Shorcut for Ycm FixIt feature
map <F2> :YcmCompleter FixIt<CR> 

" VimTex extension configurations
let g:tex_flavor = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
if has("nvim")
  let g:vimtex_latexmk_progname = 'nvr'
endif
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = "zathura"

" Move lines around
nmap <M-j> ddp 
nmap <M-k> kddpk

  " ██████  ██▓███   ██▓     ██▓▄▄▄█████▓
" ▒██    ▒ ▓██░  ██▒▓██▒    ▓██▒▓  ██▒ ▓▒
" ░ ▓██▄   ▓██░ ██▓▒▒██░    ▒██▒▒ ▓██░ ▒░
  " ▒   ██▒▒██▄█▓▒ ▒▒██░    ░██░░ ▓██▓ ░ 
" ▒██████▒▒▒██▒ ░  ░░██████▒░██░  ▒██▒ ░ 
" ▒ ▒▓▒ ▒ ░▒▓▒░ ░  ░░ ▒░▓  ░░▓    ▒ ░░   
" ░ ░▒  ░ ░░▒ ░     ░ ░ ▒  ░ ▒ ░    ░    
" ░  ░  ░  ░░         ░ ░    ▒ ░  ░      
  "     ░               ░  ░ ░           
                                       
" Moving between split windows
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
" Resizing split windows
" nmap <Leader>k :resize +3<cr>
" nmap <Leader>j :resize -3<cr>
nmap <leader>k <C-w>2+
nmap <leader>j <C-w>2-
nmap <leader>h <C-w>2<
nmap <leader>l <C-w>2>
nmap <leader>s= <C-w>=
" Assist during hot-reloading vimrc
" augroup myvimrchooks
"     au!
"     autocmd bufwritepost .vimrc source ~/.vimrc
" augroup END
