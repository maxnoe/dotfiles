local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
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
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use 'tpope/vim-endwise'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'Raimondi/DelimitMate'
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons',
      },
      tag = 'nightly'
    }
    use 'preservim/tagbar'
    use "ray-x/lsp_signature.nvim"
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
    use 'aklt/plantuml-syntax'

    -- Colors
    use 'norcalli/nvim-base16.lua'
end)
