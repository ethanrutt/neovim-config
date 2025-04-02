vim.g.mapleader = " "

local map = vim.keymap.set


--
-- Keymaps for better default experience
--
-- Disable
map({ "n", "v", }, "<Space>", "<Nop>", { silent = true })
map("n", "Q", "<nop>", { silent = true })

-- Move lines up and down while highlighting them with J and K
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- When squashing lines, keep cursor at beginning
map("n", "J", "mzJ`z")

-- while highlighting and pasting, don't yank into register
map("x", "<leader>p", [["_dP]], { desc = "[p]aste without yanking" })

-- yank into system clipboard
map({ "n", "v", }, "<leader>y", [["+y]], { desc = "[y]ank into system clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "[Y]ank into system clipboard" })

-- delete into void register
map({ "n", "v", }, "<leader>d", [["_d]], { desc = "[d]elete into void register" })

-- don't cancel me, I have this for 3 reasons
-- 1. when going into visual block mode, then insert mode, if you C-c, the
--    insert doesn't apply to all lines
-- 2. when hitting C-c in normal mode, in the cmd line it tells you "use :qa!
--    to exit vim" every single time, which is annoying
-- 3. nvim guru ThePrimeagen has it :P
map({ "n", "v", "s", "x", "i", }, "<C-c>", "<Esc>")


--
-- Quickfix List
--
map("n", "<Space>co", vim.cmd.copen, { desc = "Open quickfix list window" })
map("n", "<Space>cl", vim.cmd.ccl, { desc = "Close quickfix list window" })
map("n", "<Space>cn", "<cmd>cnext<CR>zz", { desc = "Go to next item" })
map("n", "<Space>cp", "<cmd>cprev<CR>zz", { desc = "Go to previous item" })


--
-- Diagnostic keymaps
--
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })


--
-- Keep cursor in the middle when jumping
--
-- forward and backwards search
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- half page and full page jumping
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-f>", "<C-f>zz")
map("n", "<C-b>", "<C-b>zz")

-- forward and backwards in jump list
map("n", "<C-o>", "<C-o>zz")
map("n", "<C-i>", "<C-i>zz")


--
-- nvimdiff
--
map("n", "<leader>gh", "<cmd>diffget LOCAL<CR><cmd>diffupdate<CR>", { desc = "diffget LOCAL change into working file" })
map("n", "<leader>gl", "<cmd>diffget REMOTE<CR><cmd>diffupdate<CR>", { desc = "diffget REMOTE change into working file" })
map("n", "<leader>gk", "<cmd>diffget BASE<CR><cmd>diffupdate<CR>", { desc = "diffget BASE change into working file" })


--
-- Telescope
--
map("n", "<leader><space>", function()
    require("telescope.builtin").buffers(require("telescope.themes").get_dropdown())
end, { desc = "[ ] Find existing buffers" })

map("n", "<leader>/", function()
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown())
end, { desc = "[/] Fuzzily search in current buffer" })

map("n", "<leader>gf", function()
    require("telescope.builtin").git_files()
end, { desc = "Search [G]it [F]iles" })

map("n", "<leader>sf", function()
    require("telescope.builtin").find_files(require("telescope.themes").get_ivy())
end, { desc = "[S]earch [F]iles" })

map("n", "<leader>sh", function()
    require("telescope.builtin").help_tags()
end, { desc = "[S]earch [H]elp" })

map("n", "<leader>sk", function()
    require("telescope.builtin").keymaps()
end, { desc = "[S]earch [K]eymaps" })

map("n", "<leader>sg", function()
    require("telescope.builtin").live_grep()
end, { desc = "[S]earch by [G]rep" })

map("n", "<leader>sd", function()
    require("telescope.builtin").diagnostics(require("telescope.themes").get_ivy())
end, { desc = "[S]earch [D]iagnostics" })

map("n", "<leader>sr", function()
    require("telescope.builtin").resume()
end, { desc = "[S]earch [R]esume" })
