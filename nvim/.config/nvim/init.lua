local g = vim.g
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd

-- disable netrw at the very start of your init.lua
-- strongly advised by file tree
g.loaded = 1
g.loaded_netrwPlugin = 1

-- Basic Settings
o.termguicolors = true
o.swapfile = true

o.ignorecase = true
o.smartcase = true
o.hlsearch = false

o.scrolloff = 10
o.laststatus = 2
o.updatetime = 250
o.completeopt = 'menu,menuone,noselect'
o.errorbells = false
o.visualbell = true
o.hidden = true
o.list = true

wo.number = true
wo.cursorline = true
wo.signcolumn = 'yes'

bo.tabstop = 4
bo.shiftwidth = 4
bo.expandtab = true
bo.smartindent = true

g.gutentags_ctags_tagfile = ".tags"



-- Plugins

require('packer').startup(function(use)
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    -- General IDE stuff
    use {
        'nvim-treesitter/nvim-treesitter',
        run=':TSUpdate'
    }
    use 'tpope/vim-endwise'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'preservim/nerdcommenter'
    use 'Raimondi/DelimitMate'
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons',
      },
      tag = 'nightly'
    }
    use 'preservim/tagbar'
    --use {
      --'nvim-lualine/lualine.nvim',
      --requires = { 'nvim-tree/nvim-web-devicons'}
    --}
    use 'vim-airline/vim-airline'
    use 'ludovicchabant/vim-gutentags'

    -- Git
    use 'tpope/vim-fugitive'
    use 'junegunn/gv.vim'
    use 'mhinz/vim-signify'

    -- Syntax Plugins
    use 'Vimjas/vim-python-pep8-indent'

    -- Colors
    use 'norcalli/nvim-base16.lua'
end)

-- Color
local base16 = require('base16')
base16(base16.themes["default-dark"], true)

-- LSP
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()
lsp.ensure_installed({
  'pyright',
  'texlab',
})

-- TreeSitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "c", "cpp", "cmake",
    "python",
    "latex", "bibtex",
    "bash",
    "lua",
    "toml",
  },
}

-- More
require("nvim-tree").setup()
require("nvim-web-devicons").setup()
--require("lualine").setup()

-- show diagnostics automatically
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Keybindings
vim.api.nvim_set_keymap('n', '<F8>', '<cmd>TagbarToggle<CR>', {noremap=true})
