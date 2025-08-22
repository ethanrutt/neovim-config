return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- add more parsers here as needed
            ensure_installed = {
                "bash",
                "c",
                "css",
                "cpp",
                "diff",
                "dockerfile",
                "doxygen",
                "gitattributes",
                "git_config",
                "gitcommit",
                "gitignore",
                "git_rebase",
                "graphql",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "lua",
                "luadoc",
                "markdown",
                "printf",
                "python",
                "regex",
                "ruby",
                "rust",
                "sql",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },


            --
            -- Stuff to suppress warnings
            --
            auto_install = false,
            sync_install = false,
            ignore_install = {},
            modules = {},


            --
            -- Modules
            --
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        })
    end
}
