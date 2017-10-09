call plug#begin('~/.config/nvim/plugged')


Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'terryma/vim-multiple-cursors'

" Make stuff easier
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Git support
Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Making and Code checkers
Plug 'benekastah/neomake'

" Auto-completion
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" language support
Plug 'klen/python-mode', {'branch': 'develop'}
Plug 'tpope/vim-markdown'

" colors
Plug 'chriskempson/base16-vim'

call plug#end()


set t_Co=256
let base16colorspace=256
colorscheme base16-default-dark

" General Settings
syntax on
set number
set ignorecase
set smartcase
set scrolloff=5
set autoindent
set colorcolumn=90
set laststatus=2

" deactivate all bells
set noerrorbells 
set visualbell
set t_vb=
let mapleader = ' '


let g:pymode_rope=0 " do not use rope (conflicts with deoplete)
let g:pymode_python='python3'
let pymode_lint_checkers = [] " Use neomake for checkers

" set default syntax to latex for .tex files:
let g:tex_flavor = "latex"

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" tex 
autocmd BufNewFile,BufRead *.cls set ft=tex

" enable Neomake on open and write but not on exit
autocmd! BufWritePost,BufReadPost * Neomake
autocmd! QuitPre * let g:neomake_verbose = 0
let g:neomake_open_list = 2
highlight NeoMakeErrorSign ctermfg=196
highlight NeoMakeError ctermfg=196
highlight NeoMakeWarningSign ctermfg=226
highlight NeoMakeWarning ctermfg=226

" python linting
function SetWarningType(entry)
    let a:entry.type = 'W'
endfunction

let g:neomake_python_enabled_makers = ['pycodestyle', 'pyflakes']
let g:neomake_python_pycodestyle_maker = {
    \ 'args': ['--max-line-length=90', '--ignore=E741' ],
    \ 'postprocess': function('SetWarningType')
    \ }


" easy align:
vmap <Enter> <Plug>(EasyAlign)

let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" nerdtree on shift tab
map <S-Tab> :NERDTreeToggle<CR>

" start nerdtree if no files are given
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
