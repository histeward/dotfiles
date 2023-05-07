vim.opt.cursorline = false
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]]

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = '*',
  callback = function()
    vim.cmd [[highlight CursorLineNr guifg=#fe8019 guibg=none gui=nocombine]]
    vim.opt.cursorline = true
    vim.opt.cursorlineopt = "number"
  end
})
