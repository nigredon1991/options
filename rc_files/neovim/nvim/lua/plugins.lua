vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'folke/neoconf.nvim'
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'powerman/vim-plugin-ruscmd' -- Команды на русском языке
    use 'psliwka/vim-smoothie'       -- замедленная прокрутка, более приятная

    use 'wellle/context.vim'       -- context в функциях


    use 'camspiers/animate.vim'
    use 'camspiers/lens.vim'
    use 'mechatroner/rainbow_csv'

    -- Simple plugins can be specified as strings
    use 'rstacruz/vim-closer'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-treesitter/nvim-treesitter'
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'


    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'


    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'voldikss/vim-floaterm'
    -- Lua
    use {
        'folke/trouble.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('trouble').setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'

    -- Lua
    -- use "dhananjaylatkar/cscope_maps.nvim"  -- пока не работает ничего
end)
