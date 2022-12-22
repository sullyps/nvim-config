local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
vim.g.mapleader = " " -- The elite leader key..

-- Exit vim (save and quit)
map("n", "<Leader>q", ":wq<CR>", opts)

-- Save current file (don't quit)
map("n", "<Leader>s", ":w<CR>", opts)

-- Toggle file explorer
map("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- Close current buffer
map("n", "<Leader>c", ":bd<CR>", opts)

-- Open find files pane
map("n", "<Leader>ff", ":Telescope find_files<CR>", opts)

-- Format the current file
map("n", "<Leader>fo", ":Format<CR>", opts)

-- Quick jumps
map("n", "K", "5k", opts)
map("v", "K", "5k", opts)
map("n", "J", "5j", opts)
map("v", "J", "5j", opts)

-- Jump buffers
map("n", "H", ":bprevious<CR>", opts)
map("n", "L", ":bnext<CR>", opts)

-- Jump windows
map("n", "<C-h>", "<C-w><Left>", opts)
map("n", "<C-l>", "<C-w><Right>", opts)

-- Clear word search lighlights
map("n", "<Escape>", ":noh<CR>", opts)
