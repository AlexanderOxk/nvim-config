-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { ".bashrc.user", ".bashrc" },
    callback = function()
        vim.cmd 'set filetype=bash'
    end
})

-- Highlight trailing spaces red
vim.api.nvim_set_hl(0, "ExtraWhitespace", { bg = "red" })
vim.api.nvim_create_autocmd({ "BufWinEnter", "InsertLeave" }, {
    callback = function()
        vim.fn.matchadd("ExtraWhitespace", [[\s\+$]])
    end,
})
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        vim.fn.matchadd("ExtraWhitespace", [[\s\+\%#\@<!$]])
    end,
})
