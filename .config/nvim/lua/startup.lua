local function startup_screen()
  -- Set Neovim options for the start-up screen
  vim.opt_local.bufhidden = 'wipe'
  vim.opt_local.buftype = 'nofile'
  vim.opt_local.swapfile = false
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.opt_local.signcolumn = 'no'

  -- Create the start-up screen content
  local lines = {
    'Welcome to Neovim!',
    '',
    'To open a file, use: :e <file>',
    'For help, type: :help',
  }

  -- Set the buffer content
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)

  -- Set the buffer as read-only
  vim.api.nvim_buf_set_option(0, 'modifiable', false)
  vim.api.nvim_buf_set_option(0, 'readonly', true)

  -- Add a highlight group for the start-up screen header
  vim.api.nvim_command('highlight StartupScreenHeader ctermfg=white ctermbg=blue guifg=#ffffff guibg=#4c4cff')

  -- Apply the header highlight to the first line
  vim.api.nvim_buf_add_highlight(0, -1, 'StartupScreenHeader', 0, 0, -1)
end

return {
  startup_screen = startup_screen,
}
