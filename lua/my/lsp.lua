vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions

        local map = function(mode, keys, func, desc)
            if desc then
                desc = 'LSP: ' .. desc
            end

            vim.keymap.set(mode, keys, func, { buffer = ev.buf, silent = true, desc = desc })
        end

        -- set keybinds
        map('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('n', '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        map('n', 'gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('n', 'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('n', 'gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('n', 'gt', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('n', 'gds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

        -- See `:help K` for why this keymap
        map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
        map('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        -- Lesser used LSP functionality
        map('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(ev.buf, 'Format', function(_)
            vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })
        map('n', '<leader>f', ':Format<cr>', 'Format document')
        map('v', '<leader>f', ':Format<cr>', 'Format document')
    end,
})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
})

vim.lsp.config('*', {
    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    capabilities = require('cmp_nvim_lsp').default_capabilities()
})


vim.lsp.enable({
    "bashls",
    "clangd",
    "cssls",
    "html",
    "phpactor",
    "pyright",
    "lua_ls",
    "cmake",
})

require('lazydev').setup()


local gdproject = io.open(vim.fn.getcwd() .. '/project.godot', 'r')
if gdproject then
    io.close(gdproject)
    vim.fn.serverstart '/tmp/godot.pipe'
end
