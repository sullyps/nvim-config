local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
vim.g.mapleader = " " -- The elite leader key..

-- Exit vim (save and quit all)
map("n", "<Leader>q", ":wqa<CR>", opts)

-- Save current file (don't quit)
map("n", "<Leader>s", ":w<CR>", opts)

-- Toggle file explorer
map("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- Close current buffer
map("n", "<Leader>c", ":bd<CR>", opts)

-- Open find files pane
map("n", "<Leader>ff", ":Telescope find_files<CR>", opts)

-- Goto definition
map("n","gd", "<cmd>Lspsaga goto_definition<CR>", opts)

-- Peek definition
map("n","gp", "<cmd>Lspsaga peek_definition<CR>", opts)

-- Toggle error highlight menu
map("n", "<Leader>t", ":TroubleToggle<CR>", opts)

-- Format the current file
map("n", "<Leader>fo", ":Format<CR>", opts)

-- Quick jumps
map("n", "K", "5k", opts)
map("v", "K", "5k", opts)
map("n", "J", "5j", opts)
map("v", "J", "5j", opts)

-- Jump buffers
map("n", "H", "<Plug>(cokeline-focus-prev)<CR>", opts)
map("n", "L", "<Plug>(cokeline-focus-next)<CR>", opts)

-- Jump windows
map("n", "<C-h>", "<C-w><Left>", opts)
map("n", "<C-l>", "<C-w><Right>", opts)
map("n", "<C-j>", "<C-w><Down>", opts)
map("n", "<C-k>", "<C-w><Up>", opts)

-- Clear word search highlights
map("n", "<Escape>", ":noh<CR>", opts)
