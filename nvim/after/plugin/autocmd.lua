local api = vim.api

-- shut down all lsp servers and restart lsp
-- to get rid of multiple instances of lsp servers when opening a new buffer
-- mostly happens when I use telescope

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]] -- hopefully formats the document on save (I just passed it in here lol")



--local group = api.nvim_create_augroup("GetRidOfMultiInstanceLsoServers", { clear = true })
--api.nvim_create_autocmd("BufRead",
--    { command = ":lua vim.lsp.stop_client(vim.lsp.get_active_clients())", group = group, pattern = '*,' })
--api.nvim_create_autocmd("BufRead", { command = ":LspRestart", group = group, pattern = '*', })
--api.nvim_create_autocmd("BufRead", { command = "LspStart", group = group, pattern = '*', })

-- TODO: figure out how to stop multi instances of lua to spawn after sourcing the file
-- mostly happens when sourcing the file
--local group_2 = api.nvim_create_augroup("GetRidOfMultiInstanceLsoServersLua", { clear = true })
--api.nvim_create_autocmd("SourcePre",
--    { command = ":LspStop", group = group_2 })
--api.nvim_create_autocmd("SourcePost",
--    { command = ":LspStart", group = group_2 })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

local change_set_group = vim.api.nvim_create_augroup('SetTabstopShiftWidth', { clear = true })

api.nvim_create_autocmd("FileType", {
    pattern = "html",
    group = change_set_group,
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end
})

-- 👇 chunk of code below not neccesary anymore I hope
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "htmldjango",
--     callback = function()
--         vim.opt_local.shiftwidth = 2
--         vim.opt_local.tabstop = 2
--     end
-- })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "css",
    group = change_set_group,
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end
})

local change_filetype_group = api.nvim_create_augroup('ChangeFiletype', { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "htmldjango",
    group = change_filetype_group,
    callback = function()
        vim.opt_local.filetype = "html"
    end
})
