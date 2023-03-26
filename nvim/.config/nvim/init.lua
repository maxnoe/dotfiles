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


-- hide the tags file
g.gutentags_ctags_tagfile = ".tags"

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
    "vim",
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

-- Sync tree open/close between tabs
local nt_api = require("nvim-tree.api")
local tree_open = false
local function tab_enter()
    if tree_open then
        nt_api.tree.open()
        api.nvim_command("wincmd p")
    else
        nt_api.tree.close()
    end
end
nt_api.events.subscribe(nt_api.events.Event.TreeOpen, function() tree_open=true end)
nt_api.events.subscribe(nt_api.events.Event.TreeClose, function() tree_open=false end)
api.nvim_create_autocmd("TabEnter,TabNewEnter", {callback=tab_enter})

-- Auto-close if tree is only thing open_float
-- from https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close#rwblokzijl
local function tab_win_closed(winnr)
  local api = require"nvim-tree.api"
  local tabnr = vim.api.nvim_win_get_tabpage(winnr)
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local buf_info = vim.fn.getbufinfo(bufnr)[1]
  local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
  local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
  if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
    -- Close all nvim tree on :q
    if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
      api.tree.close()
    end
  else                                                      -- else closed buffer was normal buffer
    if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
      local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
      if last_buf_info.name:match(".*NvimTree_%d*$") then       -- and that buffer is nvim tree
        vim.schedule(function ()
          if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
            vim.cmd "quit"                                        -- then close all of vim
          else                                                  -- else there are more tabs open
            vim.api.nvim_win_close(tab_wins[1], true)             -- then close only the tab
          end
        end)
      end
    end
  end
end

vim.api.nvim_create_autocmd("WinClosed", {
  callback = function ()
    local winnr = tonumber(vim.fn.expand("<amatch>"))
    vim.schedule_wrap(tab_win_closed(winnr))
  end,
  nested = true
})


-- show diagnostics automatically
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Keybindings
local map = vim.api.nvim_set_keymap
local opt = {noremap=true, silent=true}
map('n', '<F7>', '<cmd>NvimTreeToggle<CR>', opt)
map('n', '<F8>', '<cmd>TagbarToggle<CR>', opt)
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
