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
