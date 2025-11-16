return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        -- list of servers for mason to install
        ensure_installed = {
            "bashls",
            "clangd",
            "cssls",
            "html",
            "phpactor",
            "pyright",
            "lua_ls",
            "cmake",
        },
    },
    dependencies = {
        {
            "williamboman/mason.nvim",
            opts = {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            },
        },
        { "neovim/nvim-lspconfig", },
        { 'j-hui/fidget.nvim',     opts = {} },
        {
            "folke/lazydev.nvim",
            ft = "lua",     -- only load on lua files
            opts = {
                library = {
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },
}
