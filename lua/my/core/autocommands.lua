-- Highlight Yanked Text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = 'Highlight yanked text',
    group = vim.api.nvim_create_augroup('my-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    desc = 'Recognize bashrc files as bash filetype',
    group = vim.api.nvim_create_augroup('my-bash-file-detection', { clear = true }),
    pattern = { ".bashrc.user", ".bashrc" },
    callback = function()
        vim.cmd('set filetype=bash')
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "fugitive",
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        local lines = vim.api.nvim_buf_line_count(buf)
        vim.api.nvim_win_set_height(0, math.min(lines + 2, 30))
    end
})
