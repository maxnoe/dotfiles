call plug#begin('~/.config/nvim/plugged')


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

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'milkypostman/vim-togglelist'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'yggdroot/indentline'

" IDE Stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'maxnoe/vim-snippets'

" language support
Plug 'tpope/vim-markdown'
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'euclio/vim-markdown-composer', { 'do': 'cargo build --release' }
Plug 'JuliaEditorSupport/julia-vim'
Plug 'chr4/nginx.vim'
Plug 'cespare/vim-toml'
Plug 'gisraptor/vim-lilypond-integrator'
Plug 'cstrahan/vim-capnp'
Plug 'lepture/vim-jinja'
Plug 'lervag/vimtex'

" colors
Plug 'chriskempson/base16-vim'

call plug#end()

set t_Co=256
if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif
set cursorline

let g:python3_base = $HOME . "/.local/venvs/neovim/"
let g:python3_host_prog = g:python3_base . "bin/python"


" General Settings
set tabstop=4
set shiftwidth=4
set number
set ignorecase
set smartcase
set scrolloff=5
set colorcolumn=80
set noshowmode

" deactivate all bells
set noerrorbells
set visualbell
set t_vb=

" highlight trailing spaces:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Settings for CoC
" Plugins
" CocInstall coc-pyright
" CocInstall coc-snippets
" CocInstall coc-json
" CocInstall coc-ccls
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" from coc-snipped readme, use tab for everything
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


" Remove trailing whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()


" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" tex
let g:tex_flavor = "latex"
autocmd BufNewFile,BufRead *.cls set ft=tex

" python linting

" easy align:
vmap <Enter> <Plug>(EasyAlign)

let g:python_highlight_all = 1

let g:signify_vcs_list = ['git', 'svn']

let g:markdown_syntax_conceal = 0

let g:indentLine_char = '┆'
autocmd BufNewFile,BufRead *.tex IndentLinesDisable
autocmd BufNewFile,BufRead *.json IndentLinesDisable

" better key bindings for UltiSnipsExpandTrigger
let g:ultisnips_python_style="numpy"
let g:ultisnips_python_quoting_style="single"

" nerdtree on ctrl tab
map <C-Tab> :NERDTreeTabsToggle<CR>
nmap <F8> :TagbarToggle<CR>

" start nerdtree if no files are given
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
