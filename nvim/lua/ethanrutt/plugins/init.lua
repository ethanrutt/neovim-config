return {
    --
    -- Util
    --
    {
        "tpope/vim-sleuth",
        event = "BufRead",
    },

    {
        "ntpeters/vim-better-whitespace",
        event = "BufRead",
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    {
        "numToStr/Comment.nvim",
        opts = {},
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    --
    -- Treesitter
    --
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufRead", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = require("ethanrutt.plugin_configs.treesitter"),
    },

    --
    -- Telescope
    --
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },


    --
    -- Theme
    --
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        opts = {
            options = {
                icons_enabled = false,
                theme = "palenight",
                component_separators = "|",
                section_separators = "",
            },
        },
    },
}
