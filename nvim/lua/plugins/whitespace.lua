return {
    {
        "nmac427/guess-indent.nvim",
        opts = {},
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    {
        "johnfrankmorgan/whitespace.nvim",
        config = function()
            require("whitespace-nvim").setup()

            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function()
                    require("whitespace-nvim").trim()
                end
            })
        end
    },
}
