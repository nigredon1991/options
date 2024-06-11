local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"


vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup({
	"folke/neoconf.nvim",
	"tpope/vim-commentary",
	"tpope/vim-surround",
	"Wansmer/langmapper.nvim", -- Команды на русском языке
	"powerman/vim-plugin-ruscmd", -- Команды на русском языке
	"psliwka/vim-smoothie", -- замедленная прокрутка, более приятная
	"camspiers/animate.vim",
	"camspiers/lens.vim",
	"mechatroner/rainbow_csv",
	"rstacruz/vim-closer",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		depedencies = { { "nvim-lua/plenary.nvim" } },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},

	"nvim-tree/nvim-web-devicons",
	"nvim-tree/nvim-tree.lua",
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/nvim-treesitter-context",
	"neovim/nvim-lspconfig",
	"simrat39/rust-tools.nvim",

	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp-signature-help",

	"hrsh7th/cmp-vsnip",
	"hrsh7th/vim-vsnip",

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{ "lukas-reineke/indent-blankline.nvim", commit = "9637670" },
	"voldikss/vim-floaterm",
	"will133/vim-dirdiff",
  {
  "folke/trouble.nvim",
  cmd = "Trouble",
},
	{
		"nvim-lualine/lualine.nvim",
		depedencies = { "nvim-tree/nvim-web-devicons"},
	},
	"nvimtools/none-ls.nvim",
	"mfussenegger/nvim-lint",
	"mfussenegger/nvim-dap",
	"mfussenegger/nvim-dap-python",
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
}
})

-- -- vim.cmd([[packadd packer.nvim]])

-- return require("packer").startup(function(use)
-- 	-- Packer can manage itself
-- 	use("folke/neoconf.nvim")
-- 	use("wbthomason/packer.nvim")
-- 	use("tpope/vim-commentary")
-- 	use("tpope/vim-surround")
-- 	use("Wansmer/langmapper.nvim") -- Команды на русском языке
-- 	use("powerman/vim-plugin-ruscmd") -- Команды на русском языке
-- 	use("psliwka/vim-smoothie") -- замедленная прокрутка, более приятная

-- 	-- use 'wellle/context.vim' -- context в функциях

-- 	use("camspiers/animate.vim")
-- 	use("camspiers/lens.vim")
-- 	use("mechatroner/rainbow_csv")
-- 	-- use({
-- 	-- 	"cameron-wags/rainbow_csv.nvim",
-- 	-- 	config = function()
-- 	-- 		require("rainbow_csv").setup()
-- 	-- 	end,
-- 	-- 	-- optional lazy-loading below
-- 	-- 	module = { "rainbow_csv", "rainbow_csv.fns" },
-- 	-- 	ft = {
-- 	-- 		"csv",
-- 	-- 		"tsv",
-- 	-- 		"csv_semicolon",
-- 	-- 		"csv_whitespace",
-- 	-- 		"csv_pipe",
-- 	-- 		"rfc_csv",
-- 	-- 		"rfc_semicolon",
-- 	-- 	},
-- 	-- })

-- 	-- Simple plugins can be specified as strings
-- 	use("rstacruz/vim-closer")

-- 	use({
-- 		"nvim-telescope/telescope.nvim",
-- 		tag = "0.1.4",
-- 		requires = { { "nvim-lua/plenary.nvim" } },
-- 	})
-- 	use({
-- 		"nvim-telescope/telescope-fzf-native.nvim",
-- 		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
-- 	})

-- 	use("nvim-tree/nvim-web-devicons")
-- 	use("nvim-tree/nvim-tree.lua")
-- 	use("nvim-treesitter/nvim-treesitter")
-- 	use("nvim-treesitter/nvim-treesitter-context")
-- 	use("neovim/nvim-lspconfig")
-- 	use("simrat39/rust-tools.nvim")

-- 	use("hrsh7th/cmp-nvim-lsp")
-- 	use("hrsh7th/cmp-buffer")
-- 	use("hrsh7th/cmp-path")
-- 	use("hrsh7th/cmp-cmdline")
-- 	use("hrsh7th/nvim-cmp")
-- 	use("hrsh7th/cmp-nvim-lua")
-- 	use("hrsh7th/cmp-nvim-lsp-signature-help")

-- 	use("hrsh7th/cmp-vsnip")
-- 	use("hrsh7th/vim-vsnip")

-- 	use("williamboman/mason.nvim")
-- 	use("williamboman/mason-lspconfig.nvim")
-- 	use({ "lukas-reineke/indent-blankline.nvim", commit = "9637670" })
-- 	use("voldikss/vim-floaterm")
-- 	use("will133/vim-dirdiff")
-- 	-- Lua
-- 	use({
-- 		"folke/trouble.nvim",
-- 		requires = "nvim-tree/nvim-web-devicons",
-- 		config = function()
-- 			require("trouble").setup({
-- 				-- your configuration comes here
-- 				-- or leave it empty to use the default settings
-- 				-- refer to the configuration section below
-- 			})
-- 		end,
-- 	})
-- 	use({
-- 		"nvim-lualine/lualine.nvim",
-- 		requires = { "nvim-tree/nvim-web-devicons", opt = true },
-- 	})
-- 	use("nvimtools/none-ls.nvim")
-- 	use("mfussenegger/nvim-lint")
-- 	use("mfussenegger/nvim-dap")
-- 	use("mfussenegger/nvim-dap-python")
-- 	use({
-- 		"iamcco/markdown-preview.nvim",
-- 		run = function()
-- 			vim.fn["mkdp#util#install"]()
-- 		end,
-- 	})

-- 	-- Lua
-- 	-- use "dhananjaylatkar/cscope_maps.nvim"  -- пока не работает ничего
-- end)
