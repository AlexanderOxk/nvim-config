-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = {".bashrc.user", ".bashrc"},
  callback = function()
    vim.cmd 'set filetype=bash'
  end
})
