-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}


-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

    -- Packer can manage itself
    use 'wbthomason/packer.nvim' -- Packer package manager

    -- colour scheme
    use 'folke/tokyonight.nvim' -- Color theme

    use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- autopairs
    use 'windwp/nvim-autopairs' -- Auto pair brackets
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim this was required by some other plugin in here that i do not remember what
    use "nvim-lua/plenary.nvim" -- Useful lua functions don't remember what it does again though something works 

    -- LSP
    use "neovim/nvim-lspconfig" -- Configurations for Nvim LSP

    --treesitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp" -- lsp completion
    use "hrsh7th/cmp-nvim-lua" -- completion for lua (helpful when configuring neovim lua)

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- Telescope
    use "nvim-telescope/telescope.nvim" -- super coustomizable fuzzy finder plugin
    use 'nvim-telescope/telescope-media-files.nvim' -- can display media files in telescope viewer

    -- vertical line highlight
    -- use "lukas-reineke/indent-blankline.nvim"
    use({
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPre",
        config = function()
            require("histeward.blankline")
        end,
    })
end)
