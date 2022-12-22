packer = require("packer")

-- Install all plugins here
packer.startup(function(use)
	use("wbthomason/packer.nvim")
	-- use("ellisonleao/gruvbox.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("williamboman/null-ls.nvim")
	use("mfussenegger/nvim-dap")
	use("mfussenegger/nvim-lint")
	use("nvim-lualine/lualine.nvim")
	use("mhartington/formatter.nvim")
	use("nvim-tree/nvim-tree.lua")
	use("cohama/lexima.vim")
	use("nvim-tree/nvim-web-devicons")
	-- use("Mofiqul/dracula.nvim")
	use("lewis6991/gitsigns.nvim")
	use("nyoom-engineering/oxocarbon.nvim")
	use("akinsho/bufferline.nvim")
	use("noib3/nvim-cokeline")
	use("glepnir/lspsaga.nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("onsails/lspkind.nvim")
	use("rcarriga/nvim-notify")
	use("luochen1990/rainbow")
	use("tjdevries/colorbuddy.nvim")
	use({
		"David-Kunz/cmp-npm",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
end)
-- Require customized plugin configurations
require("customized/customized_formatter")
require("customized/customized_lualine")
require("customized/customized_cokeline")
--require("customized/customized_lspsaga") -- UNCOMMENT THIS LATER
require("customized/customized_cmp")

-- Initalize nvim-tree plugin
require("nvim-tree").setup()

-- Initalize GitSigns plugin
require("gitsigns").setup()

-- Initalize Mason plugin
require("mason").setup()
require("mason-lspconfig").setup() -- Creates 'LspInstall' command

-- Automatically start servers depending on file type, no manual configuration needed
require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,
})

-- Initalize commentstring module on treesitter
require("nvim-treesitter.configs").setup({
	context_commentstring = {
		enable = true,
	},
})

-- Manually customize gruvbox theme
--[[
require("gruvbox").setup({
	bold = true,
	italic = true,
	italicize_strings = true,
	italicize_comments = true,
	contrast = 'hard'
	--overrides = {
	--	Normal = {bg = "#000000"}
	--}
})
--]]

-- Get fancy notifications for plugins by overriding default notifier
vim.notify = require("notify")

-- Enable dracula
-- vim.cmd("colorscheme dracula")

-- Enable oxocarbon
vim.opt.background = "dark" -- set this to dark or light
vim.cmd("colorscheme oxocarbon")


-- Switch colorscheme to gruvbox with customized background split with vimscript commands
-- vim.cmd("colorscheme gruvbox")
vim.cmd("highlight WinSeparator guibg=None")
vim.cmd("set laststatus=3")

-- Set color overrides after theme is set
vim.cmd("highlight CursorLine guibg=#30293a")

-- Set color overrides for vim cmp (for some reason this code block doesn't work when placed at the bottom of the
-- customized cmp file)
vim.cmd("highlight CmpItemKindFunction guibg=NONE guifg=#b385dd")
vim.cmd("highlight CmpItemKindProperty guibg=NONE guifg=#b385dd")
vim.cmd("highlight CmpItemKindField guibg=NONE guifg=#b385dd")
vim.cmd("highlight CmpItemKindSnippet guibg=NONE guifg=#b385dd")
vim.cmd("highlight CmpItemKindText guibg=NONE guifg=#b385dd")
vim.cmd("highlight CmpItemKindKeyword guibg=NONE guifg=#b385dd")
vim.cmd("highlight CmpItemKindEnum guibg=NONE guifg=#b385dd")
vim.cmd("highlight CmpItemKindMethod guibg=NONE guifg=#b385dd")
vim.cmd("highlight CmpItemKindConstant guibg=NONE guifg=#b385dd")
vim.cmd("highlight CmpItemKindVariable guibg=NONE guifg=#b385dd")
vim.cmd("highlight CmpItemKindClass guibg=NONE guifg=#b385dd")
vim.cmd("highlight CmpItemKindModule guibg=NONE guifg=#b385dd")

vim.cmd("highlight CmpItemMenu guibg=NONE guifg=#898989")
