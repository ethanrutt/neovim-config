return {
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end


        --
        -- Navigation
        --
        map({ "n", "v" }, "]c", function()
            if vim.wo.diff then
                return "]c"
            end
            vim.schedule(function()
                gs.next_hunk()
            end)
            return "<Ignore>"
        end, { expr = true, desc = "Jump to next hunk" })

        map({ "n", "v" }, "[c", function()
            if vim.wo.diff then
                return "[c"
            end
            vim.schedule(function()
                gs.prev_hunk()
            end)
            return "<Ignore>"
        end, { expr = true, desc = "Jump to previous hunk" })


        --
        -- Actions
        --
        map("n", "<leader>hs", gs.stage_hunk, { desc = "[S]tage [H]unk" })
        map("n", "<leader>hr", gs.reset_hunk, { desc = "[R]eset [H]unk" })
        map("v", "<leader>hs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "[S]tage [H]unk" })

        map("v", "<leader>hr", function()
            gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") }
        end, { desc = "[R]eset [H]unk" })

        map("n", "<leader>hS", gs.stage_buffer, { desc = "[S]tage Buffer" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "[U]nstage [H]unk (git restore --staged)" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "[R]eset Buffer (git reset)" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "[P]review [H]unk" })
        map("n", "<leader>hb", function()
            gs.blame_line({ full = true })
        end, { desc = "[B]lame current line (git blame)" })
        map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "[T]oggle [B]lame on line that cursor is on" })
        map("n", "<leader>hd", gs.diffthis, { desc = "[D]iff against current index" })
        map("n", "<leader>hD", function()
            gs.diffthis("~")
        end, { desc = "[D]iff against previous commit" })
        map("n", "<leader>td", gs.toggle_deleted, { desc = "[T]oggle [D]eleted lines" })


        --
        -- Hunks as text objects
        --
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end,
}
