-- require files to initialize
require("histeward.set") -- settings for neovim (like relative line numbers)
require("histeward.keymap") -- has some function to make remapping things easier ( don't remember how it functions because I took this from the primeagen youtuber)
require("histeward.remap") -- contains some keys i remapped like leader pv opens netrw
require("histeward.packer") -- file that initializes packer and all hosts all plugins
require("histeward.cmp") -- autocomplete engine (requires a snippet engine like luasnip or vimsnip)
require("histeward.autopairs") -- this file got it somewhere it handles autopairs like (), "", [] etc
require("histeward.telescope") -- config file for fuzzyfinder
require("histeward.treesitter") -- got this file somewhere does what most want from treesitter dunno what it acutally does completely
require("histeward.lsp") -- redirects to LSP directory where all configs are for LSP
require("histeward.blankline") -- config for indent vertical lines
require("histeward.lualine")

-- TODO: set things up
-- set up lsp and config very important and this is a headache cuz im a dummy
