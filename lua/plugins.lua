packer = require("packer")
util = require("packer.util")

-- Hide the "packer_compiled" lua file generated by packer
-- packer.init must be ran before packer.startup
packer.init({
	compile_path = util.join_paths(vim.fn.stdpath("config"), ".packer_compiled", "packer_compiled.lua"),
})

-- Install all plugins here
packer.startup(function(use)
	-- Themes
	use("wbthomason/packer.nvim")
	use("ellisonleao/gruvbox.nvim")
	use("rakr/vim-one")
	use("nyoom-engineering/oxocarbon.nvim")
	use("Mofiqul/dracula.nvim")

	-- Lsp
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("mhartington/formatter.nvim")
	use("onsails/lspkind.nvim")
	use("glepnir/lspsaga.nvim")
	use("ray-x/lsp_signature.nvim")

	-- Cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("David-Kunz/cmp-npm")
	use("L3MON4D3/LuaSnip")
	use("folke/trouble.nvim")

	-- Tabline & status line
	use("nvim-lualine/lualine.nvim")
	use("noib3/nvim-cokeline")

	-- Tmux
	use("christoomey/vim-tmux-navigator")

	-- Misc
	use("https://github.com/arnamak/stay-centered.nvim")
	use("https://github.com/startup-nvim/startup.nvim")
	use("folke/neodev.nvim")
	use("folke/todo-comments.nvim")
	use("BurntSushi/ripgrep") -- requirement for todo-comments
	use("EtiamNullam/deferred-clipboard.nvim")
	use("steelsojka/pears.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("williamboman/null-ls.nvim")
	use("mfussenegger/nvim-dap")
	use("mfussenegger/nvim-lint")
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("lewis6991/gitsigns.nvim")
	use("APZelos/blamer.nvim")
	use("akinsho/bufferline.nvim")
	use("luochen1990/rainbow")
	use("tjdevries/colorbuddy.nvim")
	use("othree/html5.vim")
	use("pangloss/vim-javascript")
	use("evanleck/vim-svelte")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use("habamax/vim-godot")
end)
-- Require customized plugin configurations
require("customized/customized_formatter")
require("customized/customized_lualine")
require("customized/customized_cokeline")
require("customized/customized_lspsaga")
require("customized/customized_cmp")
require("customized/customized_lspsignature")

-- Because I have different preferences for different themes, this file contains commented out lists of other themes
-- alongside the current theme that is being imported
require("customized/themes")

require("stay-centered").setup()

require("neodev").setup()

require("startup").setup(require"customized/customized_startup") -- put theme name here

require("todo-comments").setup()

require("pears").setup()

-- Initalize nvim-tree plugin
require("nvim-tree").setup()

-- Initalize GitSigns plugin
require("gitsigns").setup()

-- Initalize Mason plugin
require("mason").setup()
require("mason-lspconfig").setup() -- Creates 'LspInstall' command

require("deferred-clipboard").setup({
	fallback = 'unnamedplus'
})

-- Automatically start servers depending on file type, no manual configuration needed
require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,
})

-- Initalize commentstring module on treesitter
require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = {
		enable = true
	},
	context_commentstring = {
		enable = true,
	},
})
