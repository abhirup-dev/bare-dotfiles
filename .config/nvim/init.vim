"for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
"   exe 'source' f
"endfor
let mapleader = " "

" Load Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deathlyfrantic/deoplete-spell'
Plug 'Rip-Rip/clang_complete'
Plug 'davidhalter/jedi-vim'
Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'
Plug 'majutsushi/tagbar'
" Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'zhimsel/vim-stay'
Plug 'lervag/vimtex', {'for': 'latex'}
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'unblevable/quick-scope'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/neovim-remote', {'do': 'python setup.py install --user'}
Plug 'Yggdroot/indentLine' " Why important?
Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'SidOfc/mkdx'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }
Plug 'dag/vim-fish', {'for': 'fish'}
call plug#end()

set ignorecase
set autochdir
syntax on
set foldmethod=syntax
set backspace=indent,eol,start                            " Fixes backspace
set ruler                                                 " Enable line/column info at bottom
set history=100
set cursorline                                            " highlights current line
set scrolloff=10
set ai                                                    " Autoindentation
filetype plugin on
filetype indent plugin on
" set clipboard+=unnamedplus                                " Copies using system clipboard
set tabstop=4                                             " Tab = 4 spaces
set shiftwidth=4
set expandtab                                             " set sta
set sts=4                                                 " softtabstop, makes spaces feel like tabs when deleting
set mouse=a mousemodel=popup                              " enable mouse support
set synmaxcol=200
autocmd Filetype markdown set spell complete+=kspell
autocmd Filetype tex set spell complete+=kspell
autocmd BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif
autocmd BufNewFile,BufReadPost *.md set filetype=markdown" markdown file recognition
autocmd BufNewFile,BufReadPost *.md.html set filetype=markdownd

" Enabling vertical indentation guides
" :set listchars=tab:\|\
" :set list
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping

set number
set relativenumber

" Configuring theme
set termguicolors     " enable true colors support
let g:gruvbox_italic = 1
colorscheme gruvbox
set background=dark

" " Configuring Airline
let g:airline_theme='luna'
let g:airline#extensions#ale#enabled = 0
" hi Normal guibg=NONE ctermbg=NONE

" set noshowmode " Already handled well by powerline/airline/lightline

let g:python3_host_prog = "/usr/bin/python"
let g:python_host_prog = "/usr/bin/python2"

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
" let g:vim_markdown_folding_level = 3
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
autocmd Filetype markdown set conceallevel=0
autocmd Filetype markdown normal zR
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_math = 1
let g:vim_markdown_json_frontmatter = 1
" Indent and auto-insert disabled because conflicts with MKDX plugin
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0

" Configuring vim-stay
set viewoptions=cursor,folds,slash,unix

" Configuring indentLine
let g:indentLine_conceallevel = 0

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
highlight ALEErrorSign ctermbg = NONE ctermfg = red
highlight ALEWarningSign ctermbg = NONE ctermfg = yellow

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
let g:tex_conceal = 'abdmg'
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_quickfix_mode=1
let g:vimtex_compiler_progname = 'nvr'
if has("nvim")
    let g:vimtex_latexmk_progname = 'nvr'
endif
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" NERDTree
nmap <leader>nt :NERDTreeToggle<CR>
nmap <leader>Nt :NERDTree
nmap <leader>nf :NERDTreeFind<CR>| " Open NERDTree to buffer
nmap <F8> :TagbarToggle<CR>
nmap <leader>go :Goyo<CR>
" nmap <Leader>ll <Plug>(Limelight)
" xmap <Leader>ll <Plug>(Limelight)
" Goyo and Limelight
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

nmap <leader>cp :let @" = expand("%:p")<CR>

" Quick-Scope (quick scope) for use with Seeker commands like f,F,t,T
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
augroup qs_colors
    autocmd!
    autocmd ColorScheme * highlight QuickScopePrimary guifg="#afff5f" gui=underline ctermfg=155 cterm=underline
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
let g:qs_lazy_highlight = 1

" powerline symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" Live markdown preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 1
let g:mkdp_browser = 'google-chrome-stable'
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''
" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''
" use a custom port to start server or random for empty
let g:mkdp_port = ''
" preview page title
let g:mkdp_page_title = '「${name}」'




" Custom | Personal Hacks for everyday ease

" Had to add <bs>l because https://vi.stackexchange.com/a/1878
" Adds n trailing spaces
" nmap <leader>il a<space><esc><bs>l
" Adds n leading spaces
" nmap <leader>ih i<space><esc>
" Adds newline in insert mode
" imap <leader><cr> <esc>o

" C-c and C-v - Copy/Paste to global clipboard
vmap <C-c> "+ya
imap <C-v> <esc>"+gpa

" Allows searching selected text (https://vim.fandom.com/wiki/Search_for_visually_selected_text)
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

nmap <M-j> ddp
nmap <M-k> kddpk

nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wq<CR>
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

