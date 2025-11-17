return {
    'lewis6991/gitsigns.nvim',
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
            virt_text_priority = 100,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',

        on_attach = function(bufnr)
            local gs = require("gitsigns")
            local move_hunk = function(dir)
                if vim.wo.diff then
                    vim.api.nvim_feedkeys("]c", "n", true)
                else
                    gs.nav_hunk(dir)
                end
            end
            local move_next_hunk = function() move_hunk('next') end
            local move_prev_hunk = function() move_hunk('prev') end

            vim.keymap.set('n', 'gs', gs.preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })
            vim.keymap.set('n', '<leader>gr', gs.reset_hunk, { buffer = bufnr, desc = 'Reset git hunk' })
            vim.keymap.set('n', ']]', move_next_hunk, { buffer = bufnr, desc = 'Next git hunk' })
            vim.keymap.set('n', '[[', move_prev_hunk, { buffer = bufnr, desc = 'Previous git hunk' })
            vim.keymap.set('n', 'gb', gs.blame_line, { buffer = bufnr, desc = 'Show git blame for line' })
        end,
    }
}
