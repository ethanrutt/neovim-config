return {
    -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    config = function()
        -- document existing key chains
        require('which-key').add({
            { "<leader>c", group = "[C]ode / Quickfix" },
            { "<leader>c_", hidden = true },
            { "<leader>d", group = "[D]ocument / delete to void register" },
            { "<leader>d_", hidden = true },
            { "<leader>g", group = "[G]it" },
            { "<leader>g_", hidden = true },
            { "<leader>h", group = "More git" },
            { "<leader>h_", hidden = true },
            { "<leader>r", group = "[R]ename" },
            { "<leader>r_", hidden = true },
            { "<leader>s", group = "[S]earch" },
            { "<leader>s_", hidden = true },
            { "<leader>w", group = "[W]orkspace" },
            { "<leader>w_", hidden = true },
        })
    end
}
