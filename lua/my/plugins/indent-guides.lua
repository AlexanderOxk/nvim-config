return {
    'saghen/blink.indent',
    dependencies = { 'catppuccin/nvim' },

    config = function()
        --- @module 'blink.indent'
        --- @type blink.indent.Config
        require('blink.indent').setup({
            scope = {
                highlights = { 'BlinkIndentViolet' },
            },
        })

        -- Set guide color to match theme
        local colors = require('catppuccin.palettes').get_palette()
        vim.api.nvim_set_hl(0, 'BlinkIndentViolet', { fg = colors.lavender })
    end
}
