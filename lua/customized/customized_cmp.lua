-- Set up nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
	--Add the cool lspkind icons
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]",
				gh_issues = "[issues]",
			},
		}),
	},

	experimental = {
		native_menu = false,
		ghost_text = true,
	},

	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["luasnip#available"](1) == 1 then
				feedkey("<Plug>(luasnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "npm", keyword_length = 4 },
		{ name = "nvim_lsp" },
		{ name = "vsnip" }, -- For vsnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
		})
	end,
})

-- Set color overrides for vim cmp
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

vim.cmd("highlight CmpItemMenu guibg=NONE guifg=#898989")
