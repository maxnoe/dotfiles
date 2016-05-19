call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'terryma/vim-multiple-cursors'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-markdown'
Plug 'Raimondi/delimitMate'
Plug 'klen/python-mode'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'junegunn/vim-easy-align'

Plug 'benekastah/neomake'

call plug#end()

let mapleader = ' '
set noerrorbells visualbell t_vb=

colorscheme atom-dark-256

set scrolloff=5

set ignorecase
set smartcase

set number
syntax on
set autoindent
set colorcolumn=90
set laststatus=2

" set default syntax to latex for .tex files:
let g:tex_flavor = "latex"


" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" tex 
autocmd BufNewFile,BufRead *.cls set ft=tex
autocmd FileType tex set shiftwidth=2 | set tabstop=2 | set expandtab | set softtabstop=2 | set shiftround | set linebreak

let g:pymode_rope = 0
let g:pymode_lint_write = 0
let g:pymode_lint_checkers=[]
" python linting
autocmd! BufWritePost,BufEnter * Neomake
autocmd! QuitPre * let g:neomake_verbose = 0
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_maker = {
    \ 'args': ['--max-line-length=90'],
    \ }

" easy align:
vmap <Enter> <Plug>(EasyAlign)

" indent guide
let g:indent_guides_start_level = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=Black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=DarkGray

let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" nerdtree on ctrl tab
map <C-Tab> :NERDTreeToggle<CR>

" start nerdtree if no files are given
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
