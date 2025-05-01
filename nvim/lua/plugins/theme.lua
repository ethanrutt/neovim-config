return {
    {
        "catppuccin/nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "palenight",
            },
        },
    },
}
