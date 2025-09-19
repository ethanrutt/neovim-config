return {
    {
        "nvim-mini/mini.nvim",
        version = "*",
        config = function()
            require("mini.icons").setup()
            require("mini.surround").setup()
            require("mini.pairs").setup()

            require("mini.trailspace").setup()
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*",
                callback = function()
                    require("mini.trailspace").trim()
                    require("mini.trailspace").trim_last_lines()
                end,
            })
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        opts = {},
    },
}
