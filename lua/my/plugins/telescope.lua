return {
    -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    tag = 'v0.1.9',
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

    config = function()
        require('telescope').setup {
            pickers = {
                buffers = {
                    -- For buffer picker, use <C-d> to close a buffer
                    mappings = {
                        n = {
                            ['<C-d>'] = require('telescope.actions').delete_buffer,
                        },
                        i = {
                            ['<C-d>'] = require('telescope.actions').delete_buffer,
                        },
                    },
                },
            },
            extensions = {
                fzf = {}
            }
        }

        -- Enable telescope fzf native, if installed
        require('telescope').load_extension('fzf')

        local builtin = require("telescope.builtin")

        --
        -- Custom function to smart-select git_files or find_files
        local function find_git_files_or_files()
            local _, ret, _ = require("telescope.utils").get_os_command_output({ 'git', 'rev-parse',
                '--is-inside-work-tree' })
            if ret == 0 then
                builtin.git_files({
                    show_untracked = true,
                })
            else
                builtin.find_files()
            end
        end

        vim.api.nvim_create_user_command('FindGitFilesOrFiles', find_git_files_or_files, {})

        vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
        vim.keymap.set('n', '<leader>/', function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 15,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

        vim.keymap.set('n', '<leader>pp', ':FindGitFilesOrFiles<cr>', { desc = '[pp] Search git files' })
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[pf] Search files' })
        vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = '[ph] Search help' })
        vim.keymap.set('n', '<leader>pq', builtin.quickfix, { desc = '[pq] Search quickfix' })
        vim.keymap.set('n', '<leader>pw', builtin.grep_string, { desc = '[pw] Search current word' })
        vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = '[pd] Search diagnostics' })
        vim.keymap.set('n', '<leader>pr', builtin.resume, { desc = '[pr] Search resume' })
        vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = '[pb] Find existing buffers' })

        -- Custom pickers
        vim.keymap.set("n", "<leader>pg", require("my.telescope.multigrep").live_multigrep, { desc = "[pg] Multi Grep" })
    end
}
