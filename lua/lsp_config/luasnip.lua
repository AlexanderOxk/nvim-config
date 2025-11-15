local ls = require('luasnip')
local opts = { noremap = true, silent = true }

-- Use <C-j> <C-k> to jump in snippets
vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(1) end, opts)
vim.keymap.set({ "i", "s" }, "<C-k>", function() ls.jump(-1) end, opts)


-- Use <C-l> <C-h> to select choice in snippet
vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, opts)

vim.keymap.set({ "i", "s" }, "<C-h>", function()
    if ls.choice_active() then
        ls.change_choice(-1)
    end
end, opts)
