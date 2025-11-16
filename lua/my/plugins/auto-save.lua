return {
    'pocco81/auto-save.nvim',
    opts = {
        -- function that determines whether to save the current buffer or not
        -- return true: if buffer is ok to be saved
        -- return false: if it's not ok to be saved
        condition = function(buf)
            local fn = vim.fn
            local utils = require("auto-save.utils.data")
            local buf_name = fn.expand('%')

            -- Do not autosave an oil buffer
            if string.len(buf_name) > 6 and string.sub(buf_name, 1, 6) == "oil://" then
                return false
            end

            -- Only try to save modifiable buffers
            if fn.getbufvar(buf, "&modifiable") == 1 and
                utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
                return true -- met condition(s), can save
            end
            return false    -- can't save
        end,
        debounce_delay = 800,
    }
}
