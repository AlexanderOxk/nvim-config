return {
    'stevearc/oil.nvim',
    lazy = false,
    priority = 1000,
    opts = {
        buf_options = {
            buflisted = false,
            bufhidden = "hide",
            modifiable = true,
            readonly = false,
        },
        view_options = {
            is_always_hidden = function(name, _)
                -- for godot projects ignore *.uid files
                if vim.uv.fs_stat(vim.fn.getcwd() .. '/project.godot') then
                    -- ignore *.uid files introduced in godot 4.4
                    if vim.endswith(name, '.uid') then
                        return true
                    end
                    -- ignore server.pipe file
                    if name == 'server.pipe' then
                        return true
                    end
                else
                    return false
                end
            end,
        },
    },
}
