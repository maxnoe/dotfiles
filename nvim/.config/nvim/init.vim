call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'

Plug 'terryma/vim-multiple-cursors'

" Make stuff easier
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Making and Code checkers
Plug 'benekastah/neomake'
Plug 'milkypostman/vim-togglelist'

" IDE Stuff
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" language support
Plug 'klen/python-mode', {'branch': 'develop'}
Plug 'tpope/vim-markdown'

" colors
Plug 'chriskempson/base16-vim'
Plug 'gisraptor/vim-lilypond-integrator'

call plug#end()

set t_Co=256
let base16colorspace=256
colorscheme base16-default-dark

" General Settings
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


let g:python_host_prog = "/home/maxnoe/.local/anaconda3/envs/neovim2/bin/python"
let g:python3_host_prog = "/home/maxnoe/.local/anaconda3/envs/neovim3/bin/python"

let g:pymode_lint=0 " using neomake for linting
let g:pymode_rope=0 " using deoplete for auto-completion

let g:deoplete#sources#jedi#server_timeout=30

" set default syntax to latex for .tex files:
let g:tex_flavor = "latex"

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" tex 
autocmd BufNewFile,BufRead *.cls set ft=tex

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
function SetWarningType(entry)
    let a:entry.type = 'W'
endfunction

let g:neomake_tex_enabled_makers = []
let g:neomake_python_enabled_makers = ['pycodestyle', 'pyflakes']
let g:neomake_python_pycodestyle_maker = {
    \ 'args': ['--max-line-length=90', '--ignore=E741' ],
    \ 'postprocess': function('SetWarningType')
    \ }

let g:neomake_cpp_gcc_maker = {
    \ 'args': [ '--std=c++14', '-fsyntax-only', '-Wall', '-Wextra', '-pedantic']
    \ }

" easy align:
vmap <Enter> <Plug>(EasyAlign)

let g:signify_vcs_list = ['git', 'svn']

let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" nerdtree on shift tab
map <S-Tab> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" start nerdtree if no files are given
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
