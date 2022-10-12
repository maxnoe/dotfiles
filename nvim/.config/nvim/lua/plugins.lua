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
    use 'tpope/vim-commentary'
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

    -- Colors
    use 'norcalli/nvim-base16.lua'
end)
