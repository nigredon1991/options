-- vim surround
--
-- vis" -- visual surround ""
-- cis" -- change surround ""
-- dis" -- delete surround ""
--
--

local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options
local keymap = vim.keymap

require("mason").setup()
require("mason-lspconfig").setup()
require("lualine").setup({ options = { theme = "auto" }, sections = { lualine_c = { { "filename", path = 1 } } } })
require("nvim-web-devicons").setup({ default = true })

-- На данный момент не работает ничего. Потом ещё попробую
-- require('cscope_maps').setup({
--   disable_maps = false, -- true disables my keymaps, only :Cscope will be loaded
--   cscope = {
--     db_file = "./cscope.out", -- location of cscope db file
--   },
-- })

cmd("colorscheme smyck")
cmd("filetype indent plugin on")

g.mapleader = " "
g.maplocalleader = " "

opt.wrap = false
opt.number = true
opt.splitbelow = true
opt.splitright = true
opt.clipboard = "unnamedplus"
opt.backspace = "indent,eol,start"
opt.mouse = "a"
opt.mousemodel = "popup_setpos"
opt.ruler = true
opt.completeopt = { "preview", "noinsert", "noselect" }
opt.shortmess = vim.opt.shortmess + { c = true }
opt.swapfile = false
opt.history = 500
opt.lazyredraw = true
opt.synmaxcol = 240
opt.updatetime = 250
opt.showmatch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.backupdir = "/tmp/"
opt.undodir = "/tmp/"
opt.wildmenu = true
opt.wildmode = { "list", "longest" }

opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd

augroup("setIndent", { clear = true })
autocmd("FileType", {
	group = "setIndent",
	pattern = { "xml", "html", "xhtml", "css", "scss", "javascript", "typescript", "yaml", "lua", "c", "cpp", "rust" },
	command = "setlocal shiftwidth=2 tabstop=2 expandtab",
})
autocmd("FileType", {
	group = "setIndent",
	pattern = { "bash", "ruby", "python", "javascript", "php", "vim", "racket" },
	command = "setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4",
})

augroup("setExcess", { clear = true })
autocmd("FileType", {
	group = "setExcess",
	pattern = { "xml", "html", "xhtml", "css", "scss", "javascript", "typescript", "yaml", "lua" },
	command = " match Excess /\\%100v.*/",
})

vim.api.nvim_set_option("updatetime", 300)
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

opt.syntax = "on"
opt.termguicolors = true

require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--ignore-file",
			".gitignore",
		},
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = "shorten",
		winblend = 0,
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
	},
})
require("telescope").load_extension("fzf")
local telescope_builtin = require("telescope.builtin")

keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
keymap.set("n", "<leader>fg", telescope_builtin.live_grep, {})
keymap.set("n", "<leader>gs", telescope_builtin.grep_string, {})
keymap.set("n", "<leader>fb", telescope_builtin.buffers, {})
keymap.set("n", "<leader>fh", telescope_builtin.help_tags, {})

g.indent_blankline_char_list = { "|", "¦", "┆", "┊" }
g.indent_blankline_show_first_indent_level = false
g.indent_blankline_context_char_list = { "┃", "║", "╬", "█" }

require("indent_blankline").setup({
	show_trailing_blankline_indent = true,
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- For open FTP
g.netrw_uid = "anonymous"
g.netrw_passwd = "anonymous"
keymap.set("n", "\\F", "<cmd>lua ", {})
keymap.set("n", "\\f", "<cmd><C-V>iW\"xy :let @+=substitute(@%,'ftp://','ftp://anonymous:pass@','g').@x\"<CR>", {})

-- map \F ^<C-V>$jy:echo substitute(@%,'ftp://','ftp://anonymous:pass@','g').@"<CR>
-- map \f ^<C-V>iW"xy :let @+=substitute(@%,'ftp://','ftp://anonymous:pass@','g').@x"<CR>

-- Treesitter Plugin Setup
require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "rust", "toml" },
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	ident = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})

--
local function open_nvim_tree(data)
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		return
	end

	vim.cmd.cd(data.file)

	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

require("nvim-tree").setup({
	hijack_netrw = true,
	hijack_cursor = true,
	update_cwd = false,
	actions = {
		open_file = {
			quit_on_open = true,
		},
		change_dir = {
			enable = false,
			global = false,
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	keymap.set("n", "<F8>", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

local lsp_flags = {
	debounce_text_changes = 150,
}

-- for null-ls create commands
--
buf_opts_several = { silent = true }
keymap.set("n", "gD", vim.lsp.buf.declaration, buf_opts_several)
keymap.set("n", "gd", vim.lsp.buf.definition, buf_opts_several)
keymap.set("n", "K", vim.lsp.buf.hover, buf_opts_several)
keymap.set("n", "gi", vim.lsp.buf.implementation, buf_opts_several)
keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, buf_opts_several)
keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, buf_opts_several)
keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, buf_opts_several)
keymap.set("n", "<space>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, buf_opts_several)
keymap.set("n", "<space>D", vim.lsp.buf.type_definition, buf_opts_several)
keymap.set("n", "<space>rn", vim.lsp.buf.rename, buf_opts_several)
keymap.set("n", "<space>ca", vim.lsp.buf.code_action, buf_opts_several)
keymap.set("n", "gr", vim.lsp.buf.references, buf_opts_several)
keymap.set("n", "<F8>", function()
	vim.lsp.buf.format({ async = true })
end, buf_opts_several)

-- Completion Plugin Setup
local cmp = require("cmp")
cmp.setup({
	-- Enable LSP snippets
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		-- Add tab support
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},
	-- Installed sources:
	sources = {
		{ name = "path" }, -- file paths
		{ name = "nvim_lsp", keyword_length = 3 }, -- from language server
		{ name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
		{ name = "nvim_lua", keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
		{ name = "buffer", keyword_length = 2 }, -- source current buffer
		{ name = "vsnip", keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
		{ name = "calc" }, -- source for math calculation
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "λ",
				vsnip = "⋗",
				buffer = "Ω",
				path = "🖫",
			}
			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
})

require("lspconfig")["rust_analyzer"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

require("lspconfig").pyright.setup({
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig").pylsp.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "W391" },
					maxLineLength = 100,
				},
			},
		},
	},
})
require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})

function my_send_to_server()
	local dir_send = {}
	dir_send["/Local_dir"] =
		"remote_user@remote_host:/remote/path"
	local cur_pwd = vim.fn.expand("$PWD") .. "/"
	if dir_send[cur_pwd] then
		local handle = io.popen(
			"rsync -r -a -v --exclude-from $HOME/exclude_home2work.txt -e ssh " .. cur_pwd .. " " .. dir_send[cur_pwd]
		)
		local result = handle:read("*a")
		print(result)
	end
end

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = false }
map("n", "<F4>", ":lua my_send_to_server() <CR>", default_opts)

-- FloaTerm configuration
--
map("n", "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 bash <CR> ", {})
map("n", "t", ":FloatermToggle myfloat<CR>", {})
map("t", "<Esc>", "<C-\\><C-n>:q<CR>", {})

-- Go to next or prev tab by H and L accordingly
-- nnoremap H gT
-- nnoremap L gt
map("n", "H", "gT", {})
map("n", "L", "gt", {})

-- Trouble configuration
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

vim.api.nvim_set_var("lens#width_resize_max", 30)
vim.api.nvim_set_var("lens#height_resize_min", 20)
vim.api.nvim_set_var("lens#width_resize_max", 250)
vim.api.nvim_set_var("lens#width_resize_min", 100)

-- rainbow csv plugin
vim.api.nvim_set_var("rcsv_delimiters", { "\t", ",", "|" })

-- Map ctrl-movement keys to window switching

map("n", "<C-k>", "<C-w><Up>", {})
map("n", "<C-j>", "<C-w><Down>", {})
map("n", "<C-l>", "<C-w><Right>", {})
map("n", "<C-h>", "<C-w><Left>", {})

map("n", "n", "nzz", {})
map("n", "N", "Nzz", {})
map("n", "j", "gj", {})
map("n", "k", "gk", {})
map("n", "<leader>P", "ggVGy<C-o>", {}) -- скопировать весь файл

-- Вариант выхода из insert режима
map("i", "<C-c>", "<Esc>", {})

-- Удаление без использования стандартного буфера
map("n", "<leader>d", "_d", {})
map("v", "<leader>d", "_d", {})
map("v", "<leader>d", "_d", {})

local null_ls = require("null-ls")

null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.formatting.lua_format,
		null_ls.builtins.formatting.stylua,

		null_ls.builtins.completion.spell,

		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.diagnostics.shellcheck,

		null_ls.builtins.formatting.jq,
		null_ls.builtins.formatting.json_tool,

		null_ls.builtins.formatting.markdownlint,

		null_ls.builtins.diagnostics.clang_check,

		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.pylint.with({
			diagnostics_postprocess = function(diagnostic)
				diagnostic.code = diagnostic.message_id
			end,
		}),
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.autoflake,

		null_ls.builtins.formatting.sql_formatter,
		null_ls.builtins.diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "postgres" }, -- change to your dialect
		}),

		null_ls.builtins.formatting.prettier,

		null_ls.builtins.diagnostics.hadolint, -- Docker

		null_ls.builtins.formatting.yamlfmt,
	},
})

