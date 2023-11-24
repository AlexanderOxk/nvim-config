
require("gitsigns").setup {
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
    vim.keymap.set('n', '<leader>hs', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })
    vim.keymap.set('n', '<leader>hr', require('gitsigns').reset_hunk, { buffer = bufnr, desc = 'Reset git hunk' })
    vim.keymap.set('n', '<leader>hn', require('gitsigns').next_hunk, { buffer = bufnr, desc = 'Next git hunk' })
    vim.keymap.set('n', '<leader>gb', require('gitsigns').blame_line, { buffer = bufnr, desc = 'Show git blame for line' })

    -- don't override the built-in and fugitive keymaps
    -- local gs = package.loaded.gitsigns
    -- vim.keymap.set({ 'n', 'v' }, '<leader>gn', function()
    --   if vim.wo.diff then
    --     return ']c'
    --   end
    --   vim.schedule(function()
    --     gs.next_hunk()
    --   end)
    --   return '<Ignore>'
    -- end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
    -- vim.keymap.set({ 'n', 'v' }, '<leader>gp', function()
    --   if vim.wo.diff then
    --     return '[c'
    --   end
    --   vim.schedule(function()
    --     gs.prev_hunk()
    --   end)
    --   return '<Ignore>'
    -- end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
  end,
}
