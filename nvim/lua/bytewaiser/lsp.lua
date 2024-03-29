local lspconfig = require("lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Lsp Signature
    require "lsp_signature".on_attach({}, bufnr)


    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('n', '<leader>ge', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '<leader>p', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)

    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)
end

-- Needs nvim-cmp installed
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig["pylsp"].setup { on_attach = on_attach, capabilities = capabilities }
lspconfig["r_language_server"].setup { on_attach = on_attach, capabilities = capabilities }
-- lspconfig["ruff_lsp"].setup { on_attach = on_attach, capabilities = capabilities }
lspconfig["clangd"].setup { on_attach = on_attach, capabilities = capabilities }
lspconfig["cmake"].setup { on_attach = on_attach, capabilities = capabilities }
lspconfig["verible"].setup { on_attach = on_attach, capabilities = capabilities }
lspconfig["rust_analyzer"].setup { on_attach = on_attach, capabilities = capabilities }
lspconfig["julials"].setup { on_attach = on_attach, capabilities = capabilities }
lspconfig["texlab"].setup { on_attach = on_attach, capabilities = capabilities }
-- lspconfig["denols"].setup { on_attach = on_attach, capabilities = capabilities,
--    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc") }
lspconfig["svelte"].setup { on_attach = on_attach, capabilities = capabilities }
lspconfig["astro"].setup { on_attach = on_attach, capabilities = capabilities }
lspconfig["tsserver"].setup { on_attach = on_attach, capabilities = capabilities }
lspconfig["html"].setup { on_attach = on_attach, capabilities = capabilities }
lspconfig["emmet_ls"].setup { on_attach = on_attach, capabilities = capabilities }
lspconfig["jsonls"].setup { on_attach = on_attach, capabilities = capabilities }
lspconfig["gopls"].setup { on_attach = on_attach, capabilities = capabilities, single_file_support = true }

lspconfig["lua_ls"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
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
    }
}
