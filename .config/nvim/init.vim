"for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
"   exe 'source' f
"endfor
let mapleader = " "

" Load Plugins
call plug#begin('~/.config/nvim/plugged')
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python'}
Plug 'deathlyfrantic/deoplete-spell'
" Plug 'Rip-Rip/clang_complete'
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'rust-lang/rust.vim'
" Plug 'autozimu/LanguageClient-neovim', {
"             \ 'branch': 'next',
"             \ 'do': 'bash install.sh',
"             \ }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'
Plug 'rhysd/vim-clang-format'
Plug 'majutsushi/tagbar'
" Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'dag/vim-fish', {'for': 'fish'}
Plug 'jceb/vim-orgmode', {'for': 'org'}
Plug 'zhimsel/vim-stay'
" Plug 'lervag/vimtex', {'for': 'latex'}
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'unblevable/quick-scope'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/neovim-remote', {'do': 'python3 setup.py install --user'}
" Plug 'Yggdroot/indentLine' " Why important?
Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
" Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'ryanoasis/vim-devicons'
" Plug 'elzr/vim-json', {'for': 'json'}
" Plug 'SidOfc/mkdx'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-abolish'
Plug 'ap/vim-css-color'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-obsession'
call plug#end()

set hidden
set incsearch
set ignorecase
set smartcase
set autochdir
set hidden
syntax on
set foldmethod=expr
set backspace=indent,eol,start                            " Fixes backspace
set ruler                                                 " Enable line/column info at bottom
set history=100
set cursorline                                            " highlights current line
" set guicursor+=a:blinkon0
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
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd Filetype markdown set conceallevel=0
autocmd Filetype markdown normal zR

" Enabling vertical indentation guides
" :set listchars=tab:\|\
" :set list
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping

set number
set relativenumber

" Configuring theme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors     " enable true colors support
let base16colorspace=256  " Access colors present in 256 colorspace
let g:gruvbox_italic = 1

" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif
colorscheme base16-gruvbox-dark-hard
" new colorschemes should be in ~/.config/nvim/colors/
" colorscheme pencil
" hi Normal guibg=NONE ctermbg=NONE
" set background=dark

" " Configuring Airline
let g:airline_theme='bubblegum'
" let g:airline#extensions#ale#enabled = 1

" set noshowmode " Already handled well by powerline/airline/lightline

let g:python3_host_prog = "/usr/bin/python3"

" " " Configuring deoplete
" " let runtimepath .= ',/usr/share/nvim/runtime'
" let g:deoplete#enable_at_startup = 1
" " call deoplete#custom#var('omni', 'input_patterns', {
" "             \ 'tex': g:vimtex#re#deoplete
" "             \})
" " Pass a dictionary to set multiple options
" call deoplete#custom#option({
"             \ 'auto_complete_delay': 1,
"             \ 'smart_case': v:true,
"             \ })
" " Disable the candidates in Comment/String syntaxes.
" call deoplete#custom#source('_',
"             \ 'disabled_syntaxes', ['Comment', 'String'])
" call deoplete#custom#source('LanguageClient', 'min_pattern_length', 2)
" call deoplete#custom#option('sources', {
"             \ 'cpp': ['LanguageClient'],
"             \ 'c': ['LanguageClient'],
"             \ 'python': ['deoplete-jedi', 'ale'],
"             \ 'rust': ['LanguageClient'],
"             \})
"" Configuring LanguageClient
"let g:LanguageClient_serverCommands={
"            \ 'rust': ['~/.local/bin/rust-analyzer'],
"            \ 'cpp': ['/usr/bin/ccls'],
"            \ 'c': ['/usr/bin/ccls'],
"            \}
""
"" \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],

"" Turn of inline linting
"let g:LanguageClient_useVirtualText = "CodeLens"
"let g:LanguageClient_usePopupHover = 0
"let g:LanguageClient_useFloatingHover = 0
"let g:LanguageClient_diagnosticsDisplay = {
"    \     1: {
"    \         "name": "Error",
"    \         "texthl": "ALEError",
"    \         "signText": "✘",
"    \         "signTexthl": "ALEErrorSign",
"    \     },
"    \     2: {
"    \         "name": "Warning",
"    \         "texthl": "ALEWarning",
"    \         "signText": "⚠",
"    \         "signTexthl": "ALEWarningSign",
"    \     },
"    \     3: {
"    \         "name": "Information",
"    \         "texthl": "ALEInfo",
"    \         "signText": "ℹ",
"    \         "signTexthl": "ALEInfoSign",
"    \     },
"    \     4: {
"    \         "name": "Hint",
"    \         "texthl": "ALEInfo",
"    \         "signText": "➤",
"    \         "signTexthl": "ALEInfoSign",
"    \     },
"    \ }
"" let g:LanguageClient_devel=1
"command! GotoDocumentation :call LanguageClient#textDocument_hover()<CR>
"command! GotoDefinition :call LanguageClient#textDocument_definition()<CR>
"command! GotoImplementation :call LanguageClient#textDocument_implementation()<CR>
"command! RenameSymbol :call LanguageClient#textDocument_rename()<CR>
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

" nnoremap <leader>p :pclose<CR>
" Uncomment when in WSL/ Ubuntu
"let g:python3_host_prog = "/home/abhirup/Software/intelpython3/bin/python"
"let g:python_host_prog = "/usr/bin/python2"

" " Configuring deoplete
let g:deoplete#enable_at_startup = 1
"call deoplete#custom#var('omni', 'input_patterns', {
"            \ 'tex': g:vimtex#re#deoplete
"            \})
" Pass a dictionary to set multiple options
call deoplete#custom#option({
            \ 'auto_complete_delay': 20,
            \ 'smart_case': v:true,
            \ })
" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])
call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)
call deoplete#custom#option('sources', {
            \ 'cpp': ['LanguageClient'],
            \ 'c': ['LanguageClient'],
            \ 'python': ['deoplete-jedi', 'ale'],
            \})
" Configuring LanguageClient
let g:LanguageClient_serverCommands={
            \ 'cpp': ['/usr/bin/ccls'],
            \ 'c': ['/usr/bin/ccls'],
            \}

" Configuring Coc.nvim
source ~/.config/nvim/setup-coc.vim
" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Configuring jedi-vim
let g:jedi#force_py_version = 3
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
let g:jedi#completions_enabled = 1

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
" let g:rust_clip_command = 'xclip -selection clipboard'

" Configuring vim-markdown
" let g:vim_markdown_folding_level = 3
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
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


" " Configuring ale
" let g:ale_completion_enabled = 0
" let g:ale_lint_on_enter = 1
" let g:ale_fix_on_save = 1
" let g:ale_fixers = {
"             \ '*': ['trim_whitespace'],
"             \ 'rust': ['rustfmt'],
"             \}
" " \ , 'ale#fixers#generic_python#BreakUpLongLines'
" " \ 'yapf']
" let g:ale_linters = {
"             \'python': ['flake8', 'pycodestyle'],
"             \'rust': ['rls'],
"             \}
" let g:ale_sign_error = '✘'
" let g:ale_sign_warning = '⚠'
" highlight ALEErrorSign ctermbg = NONE ctermfg = red
" highlight ALEWarningSign ctermbg = NONE ctermfg = yellow

" " Configuring Neoformat
" let g:neoformat_enabled_python = ['autopep8', 'yapf', 'docformatter']
" " Enable alignment
" let g:neoformat_basic_format_align = 1
" " Enable tab to spaces conversion
" let g:neoformat_basic_format_retab = 1
" " Enable trimmming of trailing whitespace
" let g:neoformat_basic_format_trim = 1

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
" FZF
nnoremap <leader>ff :Files<CR>
nnoremap <C-f> :Rg<CR>
nnoremap <leader>bb :Buffers<CR>
function! s:copy_fzf_results(lines)
    let joined_lines = join(a:lines, "\n")
    if len(a:lines) > 1
        let joined_lines .= "\n"
    endif
    let @+ = joined_lines
endfunction
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': function('s:copy_fzf_results'),
  \ }



nmap <leader>cp :let @" = expand("%:p")<CR>

" Quick-Scope (quick scope) for use with Seeker commands like f,F,t,T
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_lazy_highlight = 1


" let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''[$]'', ''[:]'')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
" powerline symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols={}
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
" C-c and C-v - Copy/Paste to global clipboard
vmap <C-c> "+ya
imap <C-v> <esc>"+gpa

" Allows searching selected text (https://vim.fandom.com/wiki/Search_for_visually_selected_text)
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

nmap <M-j> ddp
nmap <M-k> kddpk

" nnoremap <leader>bb :ls<CR>
nnoremap <leader>b<tab> :b#<CR>
nnoremap <leader>bo :b<space>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wq<CR>
" Moving between split windows
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <leader>k <C-w>5+
nmap <leader>j <C-w>5-
nmap <leader>h <C-w>5<
nmap <leader>l <C-w>5>
nmap <leader>s= <C-w>=
nmap <leader>RR :so ~/.config/nvim/init.vim<CR>
tnoremap <Esc> <C-\><C-n>

" clear registry
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" yank to Windows clipboard
if system('uname -r') =~ "Microsoft"
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * :call system('clip.exe ', @")
    augroup END
endif

" paste from Windows clipboard
noremap "wp :exe 'norm a'.system('/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard')<CR>

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

let &t_SI="\<Esc>[2 q"
