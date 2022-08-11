-- WARNING:if Multiple instances of sumneko_lua server occurs after sourcing the file :so %
-- execute vim command -->  :lua vim.lsp.stop_client(vim.lsp.get_active_clients())

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

local capabilities = require('histeward.lsp.handlers').capabilities
local on_attach = require('histeward.lsp.handlers').on_attach

--local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


--local on_attach = function(client)
--    require 'completion'.on_attach(client)
--end

-- Standard keymaps on neovim lsp github
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

-- SETTING UP SERVERS
require('lspconfig').html.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    filetypes = { "html", "htmldjango" },
    opts = {
        settings = {
            html = {
                format = {
                    templating = true,
                    wrapLineLength = 120,
                    wrapAttributes = 'auto',
                },
                hover = {
                    documentation = true,
                    references = true,
                },
            },
        },
    }

}

require('lspconfig').cssls.setup {

}

require 'lspconfig'.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    filetypes = { "python" },
    single_file_support = true,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off"
            }
        }
    },
}

require('lspconfig').sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
}

-- TODO: set up tsserver config
require('lspconfig').tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}

-- TODO: set up json config
require 'lspconfig'.jsonls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}
