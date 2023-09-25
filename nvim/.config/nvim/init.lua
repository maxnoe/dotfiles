local g = vim.g
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd
local api = vim.api

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
o.backspace = 'indent,start,eol'

wo.number = true
wo.cursorline = true
wo.signcolumn = 'yes'

bo.tabstop = 4
bo.shiftwidth = 4
bo.softtabstop = 0
bo.expandtab = true
bo.smartindent = true

-- Plugins
require('plugins')

-- Color
local base16 = require('base16')
base16(base16.themes["default-dark"], true)

local theme_names = base16.theme_names()
table.sort(theme_names)

local function get_theme_names(ArgLead)
    completions = {}
    for i, name in pairs(theme_names) do
        if name:find(ArgLead, 1, true) == 1 then
            table.insert(completions, name)
        end
    end
    return completions
end

api.nvim_create_user_command(
    "Base16Set",
    function(input)
        local name = input["args"]
        local theme = base16.themes[name]
        if theme == nil then
            error("Unknown base16 theme: " .. name)
        end
        base16(theme, true)
    end,
    {complete=get_theme_names, nargs=1, force=true}
)

-- LSP
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed({
  'pyright',
  'clangd',
  'texlab',
})


vim.cmd[[
if executable('cmake-language-server')
  au User lsp_setup call lsp#register_server({
  \ 'name': 'cmake',
  \ 'cmd': {server_info->['cmake-language-server']},
  \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'build/'))},
  \ 'whitelist': ['cmake'],
  \ 'initialization_options': {
  \   'buildDirectory': 'build',
  \ }
  \})
end
]]

lsp.configure('cmake', {force_setup = true})

-- TreeSitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "c", "cpp", "cmake",
    "python",
    "latex", "bibtex",
    "bash",
    "lua",
    "vim",
    "toml",
  },
  highlight = {
    enable = true,
  }
}
lsp.setup()

-- More
require("lsp_signature").setup()


-- show diagnostics automatically
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Keybindings
local map = vim.api.nvim_set_keymap
local opt = {noremap=true, silent=true}
map('n', '<F7>', '<cmd>NvimTreeToggle<CR>', opt)
map('n', '<F8>', '<cmd>TagbarToggle<CR>', opt)
map('n', '<F7>', '<cmd>NERDTreeTabsToggle<CR>', opt)
map('n', '<leader>qf', '<cmd>lua vim.lsp.buf.code_action({apply=true})<CR>', opt)

local parser_config = require("nvim-treesitter.parsers").get_parser_configs();
parser_config.d2 = {
  install_info = {
    url = 'https://github.com/pleshevskiy/tree-sitter-d2',
    revision = 'main',
    files = { 'src/parser.c', 'src/scanner.cc' },
  },
  filetype = 'd2',
};

parser_config.plantuml = {
  install_info = {
    url = 'https://github.com/lyndsysimon/tree-sitter-plantuml',
    revision = 'main',
    files = { 'src/parser.c' },
  },
  filetype = 'plantuml',
};

-- hide the tags file
g.gutentags_ctags_tagfile = ".tags"
