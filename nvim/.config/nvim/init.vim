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

" IDE Stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'maxnoe/vim-snippets'
Plug 'cdelledonne/vim-cmake'
Plug 'dpelle/vim-LanguageTool'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" programming language support
Plug 'bfrg/vim-cpp-modern'
Plug 'tpope/vim-markdown'
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'leafOfTree/vim-svelte-plugin'

" Plug 'euclio/vim-markdown-composer', { 'do': 'cargo build --release' }
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

" spell checker
hi clear SpellBad
hi SpellBad cterm=undercurl gui=undercurl

" deactivate all bells
set noerrorbells
set visualbell
set t_vb=

" comments for lilypond
autocmd FileType lilypond setlocal commentstring=%\ %s

" highlight trailing spaces:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Settings for CoC
" Plugins
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c

let g:coc_global_extensions = [
    \'coc-json',
    \'coc-julia',
    \'coc-pyright',
    \'coc-rust-analyzer',
    \'coc-snippets',
    \'coc-tag',
    \'coc-texlab',
	\'coc-svelte',
    \]


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Fix
nmap <leader>qf  <Plug>(coc-fix-current)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" see :h coc#float#has_scroll
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = {"python", "cpp", "rust", "javascript"},

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
EOF

" don't fold by default
" use treesitter for folding
set foldlevel=10
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()


" cmake
let g:cmake_build_options = ['-j6']
let g:cmake_generate_options = ['-DCMAKE_EXPORT_COMPILE_COMMANDS=ON']


" Remove trailing whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()


let g:indent_blankline_space_char = ' '


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

" better key bindings for UltiSnipsExpandTrigger
let g:ultisnips_python_style="numpy"
let g:ultisnips_python_quoting_style="single"

" nerdtree on ctrl tab
map <F7> :NERDTreeTabsToggle<CR>
nmap <F8> :TagbarToggle<CR>

" start nerdtree if no files are given
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
