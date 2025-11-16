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
        }

        -- Enable telescope fzf native, if installed
        pcall(require('telescope').load_extension, 'fzf')
        local builtin = require("telescope.builtin")

        -- Telescope live_grep in git root
        -- Function to find the git root directory based on the current buffer's path
        local function find_git_root()
            -- Use the current buffer's path as the starting point for the git search
            local current_file = vim.api.nvim_buf_get_name(0)
            local current_dir
            local cwd = vim.fn.getcwd()
            -- If the buffer is not associated with a file, return nil
            if current_file == "" then
                current_dir = cwd
            else
                -- Extract the directory from the current file's path
                current_dir = vim.fn.fnamemodify(current_file, ":h")
            end

            -- Find the Git root directory from the current file's path
            local git_root = vim.fn.systemlist("git -C " ..
                vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
            if vim.v.shell_error ~= 0 then
                print("Not a git repository. Searching on current working directory")
                return cwd
            end
            return git_root
        end

        --
        -- Custom live_grep function to search in git root
        local function live_grep_git_root()
            local git_root = find_git_root()
            if git_root then
                builtin.live_grep({
                    search_dirs = { git_root },
                })
            end
        end

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


        vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})
        vim.api.nvim_create_user_command('FindGitFilesOrFiles', find_git_files_or_files, {})

        vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
        vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
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
        vim.keymap.set('n', '<leader>pg', ':LiveGrepGitRoot<cr>', { desc = '[pg] Search by grep on Git Root' })
        vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = '[pd] Search diagnostics' })
        vim.keymap.set('n', '<leader>pr', builtin.resume, { desc = '[pr] Search resume' })
    end
}
