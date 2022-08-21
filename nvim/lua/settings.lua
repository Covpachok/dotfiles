local g = vim.g
local o = vim.o
local cmd = vim.cmd

-- our leader is the great \
g.mapleader = "\\"

-- proper colors
o.termguicolors = true

-- gruvbox setup
g.gruvbox_contrast_dark = 'hard'
g.gruvbox_bold = true
g.gruvbox_italic = true
g.gruvbox_underline = true
cmd('colorscheme gruvbox')

-- ??? numbers ???
o.number = true
o.numberwidth = 4
o.relativenumber = true
o.cursorline = true
o.signcolumn = 'yes'

-- something about tab
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.autoindent = true
o.smartindent = true

-- something about mouse
o.mouse = 'a'

-- other
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.hlsearch = true

-- easy motion
g.EasyMotion_do_mapping = false
g.EasyMotion_smartcase = true
g.EasyMotion_startofline = true
