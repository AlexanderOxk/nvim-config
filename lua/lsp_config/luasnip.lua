local ls = require('luasnip')
local opts = { noremap = true, silent = true }

-- Use <C-n> <C-p> to jump in snippets
vim.keymap.set({"i", "s"}, "<C-j>", function() ls.jump( 1) end, opts)
vim.keymap.set({"i", "s"}, "<C-k>", function() ls.jump(-1) end, opts)
