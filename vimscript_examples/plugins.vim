" This vimscript file contains all of the plugins that the vim configuration
" uses, and is managed by the vim-plug plugin manager.

call plug#begin('./plugins')
" --- VVV Plugins list below this point VVV ---"

" Vim motions practice game
Plug 'ThePrimeagen/vim-be-good'

" The main theme I use
Plug 'morhetz/gruvbox'

" File explorer
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

"--- ^^^ Plugins list above this point ^^^ ---"
call plug#end()

" Apply additional manual configurations to the plugins listed above
let gruvbox_transparent_bg=0
let gruvbox_italic=1
let gruvbox_italicize_strings=1
let gruvbox_italicize_comments=1
let gruvbox_bold=1
let gruvbox_contrast_dark='hard'
set background=dark
set termguicolors
colorscheme gruvbox
highlight Normal guibg=050014 "
