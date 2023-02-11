-- Enable gruvbox theme
require("gruvbox").setup({
	contrast = "hard",
	italic = false,
	transparent_mode = true,
	overrides = {
		--[[
		-- Solid background for static backgrounds
		Normal = {bg = "#000000"}, 		GruvboxGreenSign = { bg = "#000000" },
		GruvboxAquaSign = { bg = "#000000" },
		GruvboxBlueSign = { bg = "#000000" },
		GruvboxOrangeSign = { bg = "#000000" },
		GruvboxYellowSign = { bg = "#000000" },
		GruvboxRedSign = { bg = "#000000" }
		--]]
	}
})
vim.cmd("colorscheme gruvbox")
vim.cmd("set laststatus=3")

-- Enable oxocarbon theme
--[[
vim.opt.background = "dark" -- set this to dark or light
vim.cmd("colorscheme oxocarbon")
--]]

-- Enable darcula theme
-- vim.cmd("colorscheme dracula")

-------------- GLOBAL STYLING OPTIONS --------------
vim.cmd("highlight WinSeparator guibg=None")
vim.cmd("set laststatus=3")
vim.cmd("highlight TabLineFill guibg=#1c0e38")
vim.cmd("highlight CursorLine guibg=#1c0e38")
vim.cmd("highlight CursorLineNr guibg=1c0e38")
-- vim.cmd("highlight CursorLine guibg=#30293a") -- Light gray cursor line
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

-- Popup menu settings
vim.cmd("set pumblend=15") -- 15% transparency
vim.cmd("highlight PMenu guibg=#282828")
----------------- KEEP UNCOMMENTED -----------------

