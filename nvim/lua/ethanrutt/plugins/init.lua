return {
    --
    -- Util
    --
    -- -- Uncomment then restart nvim and run :StartupTime to test.
    -- "dstein64/vim-startuptime",
    {
        "tpope/vim-sleuth",
        event = { "BufRead", "BufNewFile" },
    },

    {
        "ntpeters/vim-better-whitespace",
        event = { "BufRead", "BufNewFile" },
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufRead", "BufNewFile" },
        main = "ibl",
        opts = {},
    },

    {
        "numToStr/Comment.nvim",
        event = { "BufRead", "BufNewFile" },
        opts = {},
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },

    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true, -- Auto close tags
                    enable_rename = true, -- Auto rename pairs of tags
                    enable_close_on_slash = false -- Auto close on trailing </
                },
                -- check docs for if we need to add autotag for different
                -- filetypes i.e. js for react jsx or other things
            })
        end,
    },

    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gv", "<cmd>Gvdiffsplit!<CR>", { desc = "[V]ertical diff split" })
            vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>", { desc = "Diffget left change into conflict" })
            vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>", { desc = "Diffget right change into conflict" })
        end,
    },

    {
        "folke/which-key.nvim",
        config = function()
            require("ethanrutt.plugin_configs.whichkey")()
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        opts = require("ethanrutt.plugin_configs.gitsigns"),
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
        config = function()
            require("ethanrutt.plugin_configs.treesitter")()
        end,
    },


    --
    -- Telescope
    --
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        cmd = "Telescope",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                -- allow fzf syntax
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable "make" == 1
                end,
            },
        },
        config = function()
            pcall(require("telescope").load_extension, "fzf")
        end
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

