vim.o.background = "dark"
vim.o.colorcolumn = "120"
vim.o.cursorline = true
vim.o.encoding = "utf-8"
vim.o.expandtab = true
vim.o.incsearch = true
vim.o.smartcase = true;
vim.o.mouse = "a"
vim.o.backup = false
vim.o.errorbells = false
vim.o.hlsearch = true
vim.o.swapfile = false
vim.o.wrap = false
vim.o.nu = true
vim.o.pumheight = 10
vim.o.relativenumber = true
vim.o.scrolloff = 12
vim.o.sidescrolloff = 12
vim.o.showmode = false
vim.o.showtabline = 0
vim.o.signcolumn = "yes"
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.undofile = true
vim.opt.list = true
vim.opt.listchars:append('trail: ')
vim.o.syntax = "on"
vim.o.updatetime = 300
vim.g.netrw_bufsettings = 'noma nomod rnu nowrap ro nobl'

vim.cmd('highlight WhitespaceEOL ctermbg=red ctermfg=white guibg=#ff2929')
vim.fn.matchadd('WhitespaceEOL', [[\s\+$]])
