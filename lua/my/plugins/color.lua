return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 10000,

    config = function()
        require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = {     -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false, -- disables setting the background color.
            show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
            term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = true,             -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.1,           -- percentage of the shade to apply to the inactive window
            },
            no_italic = false,              -- Force no italic
            no_bold = false,                -- Force no bold
            no_underline = false,           -- Force no underline
            styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" },    -- Change the style of comments
                conditionals = {},
                loops = {},
                functions = {},
                keywords = { "bold" },
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },
            color_overrides = {
                mocha = {
                    text = "#cccccc",
                    subtext1 = "#bbbbbb",
                    subtext0 = "#aaaaaa",
                    overlay2 = "#999999",
                    overlay1 = "#888888",
                    overlay0 = "#777777",
                    surface2 = "#666666",
                    surface1 = "#555555",
                    surface0 = "#444444",
                    base = "#222222",
                    mantle = "#1f1f1f",
                    crust = "#333333",
                },
            },
            custom_highlights = {},
            default_integrations = false,
            integrations = {
                cmp = true,
                gitsigns = true,
                treesitter = true,
                diffview = true,
                mason = true,
                which_key = true,
                telescope = {
                    enabled = true,
                },
                indent_blankline = {
                    enabled = true,
                    scope_color = "lavender",
                    colored_indent_levels = false,
                },
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                        ok = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                        ok = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
            },
        })

        -- setup must be called before loading
        vim.cmd.colorscheme("catppuccin")
    end
}
