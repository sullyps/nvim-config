-- Set up nvim-cmp.
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

-- No clue what this does, needed for [luasnip example mapping](https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings)
local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	--[[
	window = {
		completion = cmp.config.window.bordered({
			border = "double",
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Cursorline:PmenuThumb,Search:None"
		}),
	}, --]]
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

	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},

	mapping = cmp.mapping.preset.insert({
		-- Cycle through items with luasnip functionality
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
			-- they way you will only jump inside the snippet region
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		-- Accept currently selected item
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" },
	}),
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local pid = vim.fn.getpid()
local omnisharp_bin ="/home/sully/Applications/omnisharp/run"

-- Unity support
require'lspconfig'.omnisharp.setup {
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) };
	root_dir = require'lspconfig'.util.root_pattern("*.csproj", "*.sln"),
	on_attach = function (client)
	  -- HACK: Omnisharp Semantic token bug hacky fix
	  -- (https://github.com/OmniSharp/omnisharp-roslyn/issues/2483#issuecomment-1477844253)
	  if client.name == "omnisharp" then
	    client.server_capabilities.semanticTokensProvider = {
	      full = vim.empty_dict(),
	      legend = {
		tokenModifiers = { "static_symbol" },
		tokenTypes = {
		  "comment",
		  "excluded_code",
		  "identifier",
		  "keyword",
		  "keyword_control",
		  "number",
		  "operator",
		  "operator_overloaded",
		  "preprocessor_keyword",
		  "string",
		  "whitespace",
		  "text",
		  "static_symbol",
		  "preprocessor_text",
		  "punctuation",
		  "string_verbatim",
		  "string_escape_character",
		  "class_name",
		  "delegate_name",
		  "enum_name",
		  "interface_name",
		  "module_name",
		  "struct_name",
		  "type_parameter_name",
		  "field_name",
		  "enum_member_name",
		  "constant_name",
		  "local_name",
		  "parameter_name",
		  "method_name",
		  "extension_method_name",
		  "property_name",
		  "event_name",
		  "namespace_name",
		  "label_name",
		  "xml_doc_comment_attribute_name",
		  "xml_doc_comment_attribute_quotes",
		  "xml_doc_comment_attribute_value",
		  "xml_doc_comment_cdata_section",
		  "xml_doc_comment_comment",
		  "xml_doc_comment_delimiter",
		  "xml_doc_comment_entity_reference",
		  "xml_doc_comment_name",
		  "xml_doc_comment_processing_instruction",
		  "xml_doc_comment_text",
		  "xml_literal_attribute_name",
		  "xml_literal_attribute_quotes",
		  "xml_literal_attribute_value",
		  "xml_literal_cdata_section",
		  "xml_literal_comment",
		  "xml_literal_delimiter",
		  "xml_literal_embedded_expression",
		  "xml_literal_entity_reference",
		  "xml_literal_name",
		  "xml_literal_processing_instruction",
		  "xml_literal_text",
		  "regex_comment",
		  "regex_character_class",
		  "regex_anchor",
		  "regex_quantifier",
		  "regex_grouping",
		  "regex_alternation",
		  "regex_text",
		  "regex_self_escaped_character",
		  "regex_other_escape",
		},
	      },
	      range = true,
	    }
	  end
	end
}


-- Allows cmp to work without manually importing each server
require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
		})
	end,
})

-- Redrafted unity support
--[[
local lspconfig = require "lspconfig"

require'lspconfig'.omnisharp.setup {
	cmd = { "mono", omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
	filetypes = { "cs", "vb" },
	init_options = {},
	on_new_config = function(new_config, new_root_dir)
		if new_root_dir then
			table.insert(new_config.cmd, '-s')
			table.insert(new_config.cmd, new_root_dir)
			end
		end,
	root_dir = lspconfig.util.root_pattern("*.sln")
}
--]]
