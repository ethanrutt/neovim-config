local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
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

    {
        "nvim-tree/nvim-web-devicons",
        lazy = false,
        opts = {},
    },


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
                    enable_close = true,          -- Auto close tags
                    enable_rename = true,         -- Auto rename pairs of tags
                    enable_close_on_slash = false -- Auto close on trailing </
                },
                -- check docs for if we need to add autotag for different
                -- filetypes i.e. js for react jsx or other things
            })
        end,
    },

    {
        "folke/which-key.nvim",
        config = require("ethanrutt.plugin_configs.whichkey"),
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
        config = require("ethanrutt.plugin_configs.treesitter"),
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
        end,
    },


    --
    -- LSP
    --
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {},
            },
            {
                "j-hui/fidget.nvim",
                opts = {},
            },
        },
        config = require("ethanrutt.plugin_configs.lsp"),
    },


    --
    -- CMP
    --
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
        },
        config = require("ethanrutt.plugin_configs.cmp"),
    },
})
