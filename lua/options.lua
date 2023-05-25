-- Custom install options
vim.g.using_unity = true

-- External package 'Global' values
vim.g.loaded_netrw = 1
vim.g.splitright = true
vim.g.loaded_netrwPlugin = 1
vim.g.rainbow_active = 1
vim.g.blamer_enabled = 1
vim.g.godot_executable = "/Applications/godot.app/Contents/MacOS/godot"
vim.g.in_startup_screen = true

-- External package 'Option' values
vim.o.incsearch = true
vim.o.number = true
vim.o.splitright = true
vim.o.showmode = false
vim.o.cursorline = true
vim.o.splitright = true
vim.o.termguicolors = true

-- Personalized language shiftwidths to fit community standards / personal preference
vim.cmd("autocmd FileType javascript set shiftwidth=2")
vim.cmd("autocmd FileType typescriptreact set shiftwidth=2")
