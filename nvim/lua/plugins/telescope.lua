return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            -- allow fzf syntax
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
    },
    config = function()
        pcall(require("telescope").load_extension, "fzf")

        -- see telescope source code for how to mess around with this
        -- lua/telescope/theme.lua
        -- lua/telescope/pickers.layout_strategies.lua
        require("telescope").setup({
            defaults = {
                results_title = false,
                sorting_strategy = "ascending",
                layout_strategy = "vertical",
                layout_config = {
                    preview_cutoff = 1, -- Preview should always show (unless previewer = false)
                    width = function(_, max_columns, _)
                        return math.min(max_columns, 120)
                    end,
                    height = function(_, _, max_lines)
                        return math.min(max_lines, 40)
                    end,
                },
                border = true,
                borderchars = {
                    prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    results = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                },
            }
        })

        local builtin = require("telescope.builtin")
        local map = vim.keymap.set
        map("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles via Telescope" })
        map("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles via Telescope" })
        map("n", "<leader>gc", builtin.git_commits, { desc = "Search [G]it [C]ommits via Telescope" })
        map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch with [G]rep via Telescope" })
        map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps via Telescope" })
        map("n", "<leader>sb", builtin.builtin, { desc = "[S]earch [B]uiltin pickers via Telescope" })
        map("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics via Telescope" })
        map("n", "<leader>sr", builtin.resume, { desc = "[R]esume previous [S]earch via Telescope" })
        map("n", "<leader>sc", builtin.commands, { desc = "[S]earch [C]ommands via Telescope" })
        map("n", "<leader>sj", builtin.jumplist, { desc = "[S]earch [J]umplist via Telescope" })
        map("n", "<leader><space>", builtin.buffers, { desc = "[ ] Search buffers via Telescope" })
        map("n", "<leader>/", builtin.current_buffer_fuzzy_find,
            { desc = "[/] Fuzzily search current buffer via Telescope" })
        map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp tags via Telescope" })
        map("n", "<leader>gd", builtin.lsp_definitions, { desc = "[G]oto [D]efinition" })
        map("n", "<leader>gr", builtin.lsp_references, { desc = "[G]oto [R]eferences" })
        map("n", "<leader>gI", builtin.lsp_implementations, { desc = "[G]oto [I]mplementation" })
        map("n", "<leader>D", builtin.lsp_type_definitions, { desc = "Type [D]efinition" })
        map("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
        map("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })
    end,
}
