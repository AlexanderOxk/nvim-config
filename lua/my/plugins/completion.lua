return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp', -- LSP completion
            'hrsh7th/cmp-buffer',   -- Buffer completion
            'hrsh7th/cmp-nvim-lua', -- neovim lua completion

            -- Snippets
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local cmp = require('cmp')

            cmp.setup(
                {
                    snippet = {
                        expand = function(args)
                            require('luasnip').lsp_expand(args.body)
                        end,
                    },
                    completion = {
                        completeopt = 'menu,menuone,noinsert'
                    },
                    mapping = cmp.mapping.preset.insert {
                        ['<C-n>'] = cmp.mapping.select_next_item(),
                        ['<C-p>'] = cmp.mapping.select_prev_item(),
                        ['<C-j>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-k>'] = cmp.mapping.scroll_docs(4),
                        -- ['<C-Space>'] = cmp.mapping.complete {},
                        ['<C-Space>'] = cmp.mapping.confirm {
                            behavior = cmp.ConfirmBehavior.Replace,
                            select = true,
                        },
                        ['<Tab>'] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            else
                                fallback()
                            end
                        end, { 'i', 's' }),
                        ['<S-Tab>'] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            else
                                fallback()
                            end
                        end, { 'i', 's' }),
                    },
                    sources = {
                        { name = 'nvim_lsp' },
                        { name = 'luasnip' },
                        {
                            name = 'buffer',
                            keyword_length = 3,
                            option = {
                                get_bufnrs = function()
                                    local bufs = {}
                                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                                        bufs[vim.api.nvim_win_get_buf(win)] = true
                                    end
                                    return vim.tbl_keys(bufs)
                                end
                            },
                        },
                    },
                }
            )
        end
    },
}
