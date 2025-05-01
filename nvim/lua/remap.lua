--
-- only vim default keybindings will be in this file ; keybinds that have to do
-- with plugins will be in their respective configuration file
--
vim.g.mapleader = " "

local map = vim.keymap.set


--
-- Miscellaneous
--
map({ "n", "v", }, "<Space>", "<Nop>", { silent = true })
map("n", "Q", "<nop>", { silent = true })

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
-- keep cursor in middle while jumping
--
-- when squashing lines
map("n", "J", "mzJ`z")

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
-- Quickfix List
--
map("n", "<Space>co", vim.cmd.copen, { desc = "Open quickfix list window" })
map("n", "<Space>cl", vim.cmd.ccl, { desc = "Close quickfix list window" })


--
-- Diagnostic List
--
map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end,
    { desc = "Go to previous diagnostic message" })
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end,
    { desc = "Go to next diagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })


--
-- nvimdiff
--
map("n", "<leader>gh", "<cmd>diffget LOCAL<CR><cmd>diffupdate<CR>", { desc = "diffget LOCAL change into working file" })
map("n", "<leader>gl", "<cmd>diffget REMOTE<CR><cmd>diffupdate<CR>", { desc = "diffget REMOTE change into working file" })
map("n", "<leader>gk", "<cmd>diffget BASE<CR><cmd>diffupdate<CR>", { desc = "diffget BASE change into working file" })
