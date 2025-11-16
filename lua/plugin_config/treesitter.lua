local parser_configs = require 'nvim-treesitter.parsers'.get_parser_configs()
parser_configs["verilog"] = {
    install_info = {
        url = "~/.config/nvim/submodules/tree-sitter-verilog",
        files = { 'src/parser.c' },
        branch = 'master',
    },
    filetype = { "sv", "v", "svh", "vh" },
}

---@diagnostic disable-next-line: missing-fields
require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "css",
        "diff",
        "gdscript",
        "godot_resource",
        "gdshader",
        "html",
        "java",
        "javascript",
        "json",
        "latex",
        "lua",
        "make",
        "markdown",
        "matlab",
        "php",
        "python",
        "query",
        "rust",
        "verilog",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
    },
    auto_install = false,
    highlight = {
        enable = true,

        disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 kB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        additional_vim_regex_highlighting = false,
    },
}
