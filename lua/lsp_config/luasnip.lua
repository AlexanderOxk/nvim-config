local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Use <C-n> <C-p> to jump in snippets
keymap("i", "<C-n>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<C-n>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<C-p>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<C-p>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
