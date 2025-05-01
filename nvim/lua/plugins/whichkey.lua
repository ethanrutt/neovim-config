return {
    "folke/which-key.nvim",
    config = function()
        require("which-key").add({
            { "<leader>c",  group = "Quickfix List" },
            { "<leader>c_", hidden = true },
            { "<leader>d",  group = "[D]ocument / delete to void register" },
            { "<leader>d_", hidden = true },
            { "<leader>g",  group = "[G]it / [G]o to" },
            { "<leader>g_", hidden = true },
            { "<leader>h",  group = "More git" },
            { "<leader>h_", hidden = true },
            { "<leader>s",  group = "[S]earch" },
            { "<leader>s_", hidden = true },
            { "<leader>t",  group = "[T]oggle blame" },
            { "<leader>t_", hidden = true },
            { "<leader>w",  group = "[W]orkspace" },
            { "<leader>w_", hidden = true },
        })
    end
}
