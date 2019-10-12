call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'

Plug 'terryma/vim-multiple-cursors'

" Make stuff easier
Plug 'tpope/vim-endwise'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Making and Code checkers
Plug 'benekastah/neomake'
Plug 'milkypostman/vim-togglelist'

" IDE Stuff
Plug 'yggdroot/indentline'
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs'

Plug 'SirVer/ultisnips'
Plug 'maxnoe/vim-snippets'

" language support
Plug 'tpope/vim-markdown'
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'euclio/vim-markdown-composer', { 'do': 'cargo build --release' }
Plug 'JuliaEditorSupport/julia-vim'

" colors
Plug 'chriskempson/base16-vim'
Plug 'gisraptor/vim-lilypond-integrator'

call plug#end()

set t_Co=256
let base16colorspace=256
colorscheme base16-default-dark

" General Settings
set tabstop=4
set shiftwidth=4
set number
set ignorecase
set smartcase
set scrolloff=5
set colorcolumn=90
set noshowmode

" deactivate all bells
set noerrorbells 
set visualbell
set t_vb=
let mapleader = ' '


let g:python3_host_prog = $HOME . '/.local/venvs/neovim/bin/python'


" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" tex 
let g:tex_flavor = "latex"
autocmd BufNewFile,BufRead *.cls set ft=tex
autocmd BufNewFile,BufRead *.tex IndentLinesDisable

" enable Neomake on open and write but not on exit
autocmd! BufWritePost,BufReadPost * Neomake

let g:pymode_rope = 0
let g:pymode_lint_write = 0
let g:pymode_lint_checkers=[]

" python linting
autocmd! BufWritePost,BufEnter * Neomake
autocmd! QuitPre * let g:neomake_verbose = 0

highlight NeoMakeErrorSign ctermfg=196
highlight NeoMakeError ctermfg=196
highlight NeoMakeWarningSign ctermfg=226
highlight NeoMakeWarning ctermfg=226

" python linting
function! SetWarningType(entry)
    let a:entry.type = 'W'
endfunction

let g:neomake_tex_enabled_makers = []
let g:neomake_python_enabled_makers = ['pycodestyle', 'pyflakes']
let g:neomake_cpp_enabled_makers = ['gxx']
let g:neomake_python_pycodestyle_maker = {
    \ 'args': ['--max-line-length=90', '--ignore=E741,W503' ],
    \ 'postprocess': function('SetWarningType'),
	\ 'exe': $HOME . '/.local/venvs/neovim/bin/pycodestyle'
    \ }

let g:neomake_python_pyflakes_maker = {
	\ 'exe': $HOME . '/.local/venvs/neovim/bin/pyflakes'
    \ }

let g:neomake_cpp_gxx_maker = {
	\ 'exe': 'g++',
    \ 'args': [ '--std=c++14', '-fsyntax-only', '-Wall', '-Wextra', '-pedantic']
    \ }

" easy align:
vmap <Enter> <Plug>(EasyAlign)

let g:python_highlight_all = 1

let g:signify_vcs_list = ['git', 'svn']

let g:neomake_warning_sign={'text': '.'}

let g:markdown_syntax_conceal = 0

let g:indentLine_char = '┆'

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#server_timeout = 60
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:ultisnips_python_style="numpy"
let g:ultisnips_python_quoting_style="single"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" nerdtree on shift tab
map <S-Tab> :NERDTreeTabsToggle<CR>
nmap <F8> :TagbarToggle<CR>

" start nerdtree if no files are given
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
