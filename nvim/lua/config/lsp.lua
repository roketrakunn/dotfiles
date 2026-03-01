local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.pyright.setup({
    capabilities = capabilities,
})

lspconfig.gopls.setup({
    capabilities = capabilities,
})

lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
})

lspconfig.clangd.setup({
    capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
})
