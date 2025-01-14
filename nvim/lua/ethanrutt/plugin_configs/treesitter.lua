return function()
    require("nvim-treesitter.configs").setup({
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
            "c_sharp",
            "rust",
            "bash",
            "java",
            "javascript",
            "python",
            "kotlin",
            "sql",
            "doxygen",
            "dockerfile",
        },

        auto_install = false,

        sync_install = false,

        highlight = { enable = true },
        indent = { enable = true },

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

