-- 'Global' values
vim.g.loaded_netrw = 1
vim.g.splitright = true
vim.g.loaded_netrwPlugin = 1
vim.g.rainbow_active = 1
vim.g.blamer_enabled = 1
vim.g.godot_executable = "/Applications/godot.app/Contents/MacOS/godot"

-- 'Option' values
vim.o.incsearch = true
vim.o.relativenumber = true
vim.o.scrolloff = 99999 -- Keep the cursor in the middle when the screen is full of text
vim.o.splitright = true
vim.o.showmode = false
vim.o.cursorline = true
vim.o.splitright = true
vim.o.termguicolors = true

-- Personalized language shiftwidths to fit community standards / personal preference
vim.cmd("autocmd FileType javascript set shiftwidth=2")
vim.cmd("autocmd FileType typescriptreact set shiftwidth=2")

local GODOT_PATH = "/Applications/godot.app/Contents/MacOS/godot"

-- Commands to integrate with godot
-- vim.api.nvim_add_user_command("GodotHere", GODOT_PATH .. " <q-args>", { nargs = 1 })
-- vim.api.nvim_add_user_command("Godot")
