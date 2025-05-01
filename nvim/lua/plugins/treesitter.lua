return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            -- add more parsers here as needed
            ensure_installed = {
                "lua",
                "luadoc",
                "vim",
                "vimdoc",
                "printf",
                "git_config",
                "git_rebase",
                "diff",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "markdown",
                "json",
                "html",
                "css",
                "yaml",
                "regex",
                "c",
                "cpp",
                "rust",
                "bash",
                "javascript",
                "python",
                "sql",
                "doxygen",
                "dockerfile",
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


            --
            -- Text Objects
            --
            -- requires nvim-treesitter-textobjects
            -- dependency specified in dependencies of treesitter
            textobjects = {
                move = {
                    enable = true,

                    -- whether to set jumps in the jumplist
                    set_jumps = true,
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                },
            },
        })
    end
}
