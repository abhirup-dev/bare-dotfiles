"for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
"   exe 'source' f
"endfor
" Enable syntax highlighting
" Set Leader key
:let mapleader = " "

" Load Plugins
call plug#begin('~/.config/nvim/plugged')
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'Rip-Rip/clang_complete'
Plug 'davidhalter/jedi-vim'
Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'zhimsel/vim-stay'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'unblevable/quick-scope'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/neovim-remote', {'do': 'python setup.py install --user'}
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Smooth scrolling
Plug 'yuttie/comfortable-motion.vim'
" Plug 'tpope/vim-vinegar'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
" Plug 'ryanoasis/vim-devicons'
" Plug 'Konfekt/FastFold'
Plug 'elzr/vim-json'
" Plug 'dcharbon/vim-flatbuffers'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'dag/vim-fish'
" Plug 'tpope/vim-fugitive'
call plug#end()

set autochdir
syntax on
set foldmethod=syntax
set backspace=indent,eol,start                            " Fixes backspace
set ruler                                                 " Enable line/column info at bottom
set history=100
set cursorline                                            " highlights current line
set scrolloff=10
set ai                                                    " Autoindentation
filetype indent plugin on
" set clipboard+=unnamedplus                                " Copies using system clipboard
set tabstop=4                                             " Tab = 4 spaces
set shiftwidth=4
set expandtab                                             " set sta
set sts=4                                                 " softtabstop, makes spaces feel like tabs when deleting
set mouse=a mousemodel=popup                              " enable mouse support
" autocmd BufNewFile,BufReadPost *.md set filetype=markdown " markdown file recognition
" autocmd BufNewFile,BufReadPost *.md.html set filetype=markdownd

" Enabling vertical indentation guides
" :set listchars=tab:\|\
" :set list
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping

set number
set relativenumber

" Configuring theme
set termguicolors     " enable true colors support
let g:gruvbox_italic=1
colorscheme gruvbox

" " Configuring Airline
let g:airline_theme='luna'
let g:airline#extensions#ale#enabled = 0
" Palenight + Lightline
set background=dark
" hi Normal guibg=NONE ctermbg=NONE

" set noshowmode " Already handled well by powerline/airline/lightline

autocmd VimEnter * :silent !chcaps
" autocmd VimLeave * :silent !chback

" Configuring deoplete
let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources = {'_': ['ale', 'deoplete-jedi', 'clang_complete']}
call deoplete#custom#var('omni', 'input_patterns', {
            \ 'tex': g:vimtex#re#deoplete
            \})

" Configuring jedi-vim
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#show_call_signatures = "1"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>a"
let g:jedi#goto_definitions_command = "<leader>f"
let g:jedi#documentation_command = "<leader>d"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = ""
let g:jedi#rename_command = "<leader>r"
" You can also use deoplete-jedi for completions, which uses Jedi, but does completions asynchronously (requires Neovim). It makes sense to use both jedi-vim and deoplete-jedi, but you should disable jedi-vim's completions then:
let g:jedi#completions_enabled = 0

" Configuring vim-markdown
let g:vim_markdown_folding_level = 3
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 1
set conceallevel=2
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_math = 1
let g:vim_markdown_json_frontmatter = 1

" Configuring vim-stay
set viewoptions=cursor,folds,slash,unix

" nmap zuz <Plug>(FastFoldUpdate)
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
" let g:markdown_folding = 1
" let g:tex_fold_enabled = 1
" let g:vimsyn_folding = 'af'
" let g:xml_syntax_folding = 1
" let g:javaScript_fold = 1
" let g:sh_fold_enabled= 7
" let g:ruby_fold = 1
" let g:perl_fold = 1
" let g:perl_fold_blocks = 1
" let g:r_syntax_folding = 1
" let g:rust_fold = 1
" let g:php_folding = 1

" Configuring gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" Configuring ale
let g:ale_completion_enabled = 1
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
            \ '*': [
            \ 'trim_whitespace'
            \]}
            " \ , 'ale#fixers#generic_python#BreakUpLongLines'
            " \ 'yapf']
let g:ale_linters = {
            \   'python': ['flake8', 'pycodestyle']
            \}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" Configuring Neoformat
let g:neoformat_enabled_python = ['autopep8', 'yapf', 'docformatter']
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" VimTex extension configurations
let g:tex_flavor = 'latex'
" set conceallevel=1
" let g:tex_conceal = 'abdmg'
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_quickfix_mode=1
let g:vimtex_compiler_progname = 'nvr'
if has("nvim")
    let g:vimtex_latexmk_progname = 'nvr'
endif
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = "zathura"

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<cr>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

nmap <M-j> ddp
nmap <M-k> kddpk

" Moving between split windows
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
" Resizing split windows
" nmap <Leader>k :resize +3<cr>
" nmap <Leader>j :resize -3<cr>
nmap <leader>k <C-w>5+
nmap <leader>j <C-w>5-
nmap <leader>h <C-w>5<
nmap <leader>l <C-w>5>
nmap <leader>s= <C-w>=
" Assist during hot-reloading vimrc
" augroup myvimrchooks
"     au!
"     autocmd bufwritepost .vimrc source ~/.vimrc
" augroup END

" NERDTree
nmap <leader>nt :NERDTreeToggle<CR>
nmap <leader>Nt :NERDTree
nmap <leader>nf :NERDTreeFind<CR>| " Open NERDTree to buffer
nmap <F8> :TagbarToggle<CR>
nmap <leader>go :Goyo<CR>
" nmap <Leader>ll <Plug>(Limelight)
" xmap <Leader>ll <Plug>(Limelight)
" Goyo and Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"smooth scrolling
" nnoremap <silent> <C-u> :call comfortable_motion#flick(75)<CR>
" nnoremap <silent> <C-U> :call comfortable_motion#flick(-75)<CR>
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(10)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-10)<CR>

" Vim markdown preview
let vim_markdown_preview_toggle=2
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'

" unresolved!
nmap <leader>cp :let @" = expand("%:p")<CR>

" Custom | Personal Hacks for everyday ease
" Had to add <bs>l because https://vi.stackexchange.com/a/1878
" Adds n trailing spaces
nmap <leader>il a<space><esc><bs>l
" Adds n leading spaces
nmap <leader>ih i<space><esc>
" Adds newline in insert mode
" imap <leader><cr> <esc>o

" Quick-Scope (quick scope) for use with Seeker commands like f,F,t,T
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
augroup qs_colors
    autocmd!
    autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
let g:qs_lazy_highlight = 1







" Optional Support

" Configuring You Complete Me (YCM)
" let g:ycm_server_python_interpretor = "/usr/bin/python2.7"
let g:python3_host_prog = "/usr/bin/python"
" let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
" let g:ycm_complete_in_comments = 1 " turn on completion in comments
" let g:ycm_confirm_extra_conf=0 " load .ycm_conf by default
" let g:ycm_collect_identifiers_from_tags_files=1 " use tag information
" set completeopt- = preview " start completion from first character
" let g:ycm_min_num_of_chars_for_completion=3
" let g:ycm_cache_omnifunc = 0
" let g:ycm_seed_identifiers_with_syntax=1 " complete syntax keywords
" Shorcut for Ycm FixIt feature
" map <F2> :YcmCompleter FixIt<CR>

" LaTeX specific theme
" autocmd BufEnter *.tex :colorscheme Tomorrow-Night
" autocmd BufEnter *.tex :let g:airline_theme='luna'
" let g:airline_left_sep='>>'
" let g:airline_right_sep='<<'

" powerline symbols
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''    "" Causing lot of errors
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.maxlinenr = ''
