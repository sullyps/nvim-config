-- Imports mentioned below can be found in the 'lua' directory

-- Import vim options from options module
require('options')

-- Set keymappings through the kepmapping module
require('keymaps')

-- Import packer plugins from plugins module
require('plugins')

vim.cmd("hi ColorColumn guibg=#ffffff")
