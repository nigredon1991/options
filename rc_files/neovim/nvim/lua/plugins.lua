vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("folke/neoconf.nvim")
	use("wbthomason/packer.nvim")
	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use("Wansmer/langmapper.nvim") -- Команды на русском языке
	use("powerman/vim-plugin-ruscmd") -- Команды на русском языке
	use("psliwka/vim-smoothie") -- замедленная прокрутка, более приятная

	-- use 'wellle/context.vim' -- context в функциях

	use("camspiers/animate.vim")
	use("camspiers/lens.vim")
	use("mechatroner/rainbow_csv")
	-- use({
	-- 	"cameron-wags/rainbow_csv.nvim",
	-- 	config = function()
	-- 		require("rainbow_csv").setup()
	-- 	end,
	-- 	-- optional lazy-loading below
	-- 	module = { "rainbow_csv", "rainbow_csv.fns" },
	-- 	ft = {
	-- 		"csv",
	-- 		"tsv",
	-- 		"csv_semicolon",
	-- 		"csv_whitespace",
	-- 		"csv_pipe",
	-- 		"rfc_csv",
	-- 		"rfc_semicolon",
	-- 	},
	-- })

	-- Simple plugins can be specified as strings
	use("rstacruz/vim-closer")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

	use("nvim-tree/nvim-web-devicons")
	use("nvim-tree/nvim-tree.lua")
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-treesitter/nvim-treesitter-context")
	use("neovim/nvim-lspconfig")
	use("simrat39/rust-tools.nvim")

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp-signature-help")

	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use({ "lukas-reineke/indent-blankline.nvim", commit = "9637670" })
	use("voldikss/vim-floaterm")
	use("will133/vim-dirdiff")
	-- Lua
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use("nvimtools/none-ls.nvim")
	use("mfussenegger/nvim-lint")
	use("mfussenegger/nvim-dap")
	use("mfussenegger/nvim-dap-python")
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Lua
	-- use "dhananjaylatkar/cscope_maps.nvim"  -- пока не работает ничего
end)
