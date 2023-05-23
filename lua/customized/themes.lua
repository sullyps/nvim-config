-- Enable gruvbox theme
require("gruvbox").setup({
	contrast = "hard",
	italic = {
		strings = false,
		operators = false,
		comments = true
	},
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
-- Enable oxocarbon theme with settings
vim.cmd("colorscheme oxocarbon")
vim.cmd("set laststatus=3")
vim.cmd("hi TelescopeBorder guifg=#ffffff")

-- Enable darcula theme
-- vim.cmd("colorscheme dracula")

-------------- GLOBAL STYLING OPTIONS --------------
-- Popup menu settings
vim.cmd("highlight PMenu guibg=#282828")
----------------- KEEP UNCOMMENTED -----------------

