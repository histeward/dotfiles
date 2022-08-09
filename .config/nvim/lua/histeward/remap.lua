local nnoremap = require("histeward.keymap").nnoremap
local opts = { noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>fp", "<cmd>Telescope find_files<CR>")
nnoremap("<C-t>", "<cmd>Telescope live_grep<CR>", opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>")
