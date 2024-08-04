return {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    -- Highlight and Trim whitespace
    'ntpeters/vim-better-whitespace',

    {
        -- 'gc' to comment visual regions/lines
        'numToStr/Comment.nvim',
        opts = {},
        config = function()
            require('Comment').setup()
            vim.keymap.del("n", "gc")
            vim.keymap.del("n", "gb")
            local wk = require("which-key")
            wk.add({
                { "gb", group = "Comment toggle blockwise" },
                { "gc", group = "Comment toggle linewise" },
            })
        end
    },

    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = 'ibl',
        opts = {},
    },

    {
        -- Autopairs for '(' '[' '{' '"' "'"
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {},
    },

}

