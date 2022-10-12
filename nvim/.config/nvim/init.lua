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
o.smarttab = true

wo.number = true
wo.cursorline = true
wo.signcolumn = 'yes'

bo.tabstop = 4
bo.shiftwidth = 4
bo.softtabstop = 0
bo.expandtab = true
bo.smartindent = true


-- hide the tags file
g.gutentags_ctags_tagfile = ".tags"

-- Plugins
require('plugins')

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
  highlight = {
    enable = true,
  }
}

-- More
require("nvim-tree").setup()
require("nvim-web-devicons").setup()
require("lsp_signature").setup()
--require("lualine").setup()

-- show diagnostics automatically
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Keybindings
local map = vim.api.nvim_set_keymap
local opt = {noremap=true, silent=true}
map('n', '<F8>', '<cmd>TagbarToggle<CR>', opt)
map('n', '<leader>qf', '<cmd>lua vim.lsp.buf.code_action({apply=true})<CR>', opt)
