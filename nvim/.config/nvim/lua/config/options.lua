-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false
vim.g.autoformat = false

vim.opt.list = true
vim.opt.listchars = {
  tab = " > ",
  nbsp = "·",
  trail = "·",
}

vim.opt.conceallevel = 0
