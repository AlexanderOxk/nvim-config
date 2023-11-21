-- Run my/init first
require("my")

--
-- Plugins
--
-- Bootstrapping lazy-vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Specify plugins
require("lazy").setup({
  {
    -- Colorscheme
    'navarasu/onedark.nvim',
    lazy=false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
})

