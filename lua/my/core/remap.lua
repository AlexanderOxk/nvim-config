local keymap = vim.keymap.set
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Lua execution and file sourcing
keymap("n", "<leader><space>x", "<cmd>source %<CR>", { desc = "Source current file" })
keymap("n", "<leader>x", ":.lua<CR>", { desc = "Execute current line" })
keymap("v", "<leader>x", ":lua<CR>", { desc = "Execute current selection" })

-- File navigation
keymap("n", "<leader>n", "<CMD>Oil<CR>", { desc = "Open parent directory" })
keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Undo tree
keymap("n", "<leader>u", "<CMD>UndotreeToggle<CR>", { desc = "Open undo tree" })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -5<CR>", opts)
keymap("n", "<C-Down>", ":resize +5<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -5<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +5<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Toggle spell
local function toggle_spell_check()
    ---@diagnostic disable-next-line: undefined-field
    vim.opt.spell = not (vim.opt.spell:get())
end
keymap("n", "<leader><space>s", toggle_spell_check, { desc = "Toggle spelling" })

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Center on cursor for G, n, and N
keymap("n", "G", "Gzz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- Substitute word under cursor
keymap("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/", opts)
