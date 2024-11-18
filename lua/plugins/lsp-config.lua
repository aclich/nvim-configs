return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "dockerls",
                    "docker_compose_language_service",
                    "gopls",
                    "pylsp",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
            })
            lspconfig.dockerls.setup({
                capabilities = capabilities,
            })
            lspconfig.docker_compose_language_service.setup({
                capabilities = capabilities,
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })
            lspconfig.pylsp.setup({
                capabilities = capabilities,
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                ignore = { "W391" },
                                maxLineLength = 160,
                            },
                        },
                    },
                },
            })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
            -- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = "rounded",
            })
        end,
    },
}
