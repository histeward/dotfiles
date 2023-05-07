-- Define a function to start the language server on a remote machine
local function start_remote_pyright(client_id)
  -- Set up the command to run on the remote machine
  local command = {
    'ssh', 'pi@192.168.1.1',
    'pyright-langserver',
    '--stdio'
  }

  -- Set up the LSP configuration to use the remote command and the root directory
  local lsp_config = {
    cmd = command,
    on_attach = function(client, bufnr)
      -- Attach any additional configuration or mappings here
    end,
    root_dir = vim.loop.cwd -- Set the root directory to the current working directory on the remote machine
  }

  -- Attach the language server to the current buffer using the specified client ID
  require('lspconfig').pyright.setup(lsp_config)
  vim.lsp.buf_attach_client(bufnr, client_id)
end

-- Define a command to start the language server on the remote machine
vim.cmd([[
  command! -nargs=1 PyrightRemote lua start_remote_pyright(tonumber(<args>))
]])

-- Set up mappings for the language server
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

-- Set up the Pyright server to automatically start when editing Python files
require('lspconfig').pyright.setup {}
-- Define a function to start the language server on a remote machine
local function start_remote_pyright(client_id)
  -- Set up the command to run on the remote machine
  local command = {
    'ssh', 'pi@192.168.1.36',
    'pyright-langserver',
    '--stdio'
  }

  -- Set up the LSP configuration to use the remote command and the root directory
  local lsp_config = {
    cmd = command,
    on_attach = function(client, bufnr)
      -- Attach any additional configuration or mappings here
    end,
    root_dir = vim.loop.cwd -- Set the root directory to the current working directory on the remote machine
  }

  -- Attach the language server to the current buffer using the specified client ID
  require('lspconfig').pyright.setup(lsp_config)
  vim.lsp.buf_attach_client(bufnr, client_id)
end

-- Define a command to start the language server on the remote machine
vim.cmd([[
  command! -nargs=1 PyrightRemote lua start_remote_pyright(tonumber(<args>))
]])

-- Set up mappings for the language server
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

-- Set up the Pyright server to automatically start when editing Python files
require('lspconfig').pyright.setup {}

