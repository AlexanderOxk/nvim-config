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
  { 'marko-cerovac/material.nvim',
    lazy = false,
    priority = 10000,
  },
  { 'lewis6991/gitsigns.nvim' },
  { 'tpope/vim-fugitive' },
  {
    -- Autosave
    'pocco81/auto-save.nvim',
    config = function()
      require('auto-save').setup {
        execution_message = {
          message = function() -- message to print on save
            return ("Saved at " .. vim.fn.strftime("%H:%M:%S"))
          end,
          dim = 0.5,                -- dim the color of `message`
          cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea
        },
        debounce_delay = 800,
      }
    end,
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'material',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- LSP completion
      'hrsh7th/cmp-buffer',   -- Buffer completion
      'hrsh7th/cmp-nvim-lua', -- neovim lua completion

      -- Snippets
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
  },
  {
    'stevearc/oil.nvim',
    opts = {},
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  {
    'tzachar/local-highlight.nvim',
    config = function()
      require('local-highlight').setup()
    end
  },
  { 'folke/which-key.nvim', opts = {} },
})

-- Configure plugins
require("plugin_config")
vim.cmd 'colorscheme material'
require("lsp_config")
require("oil").setup()
require("ibl").setup()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/submodules/friendly-snippets" } })
