local opt = vim.opt

-- set the mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- line numbers
opt.number = true

-- line wrapping
opt.wrap = false

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.incsearch = true -- move to your search as you write it
opt.hlsearch = false -- highlight my search

opt.splitright = true
