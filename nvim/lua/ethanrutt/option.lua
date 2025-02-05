local o = vim.o
local opt = vim.opt

vim.cmd([[autocmd BufWritePre * :StripWhitespace]])

vim.wo.number = true
vim.wo.signcolumn = "yes"

vim.g.netrw_banner = 0

o.hlsearch = false
o.mouse = "a"
o.breakindent = true
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.updatetime = 250
o.timeoutlen = 300
o.completeopt = "menuone,noselect"
o.termguicolors = true

opt.tabstop = 4
opt.shiftwidth = 0
opt.expandtab = true
opt.colorcolumn = "80"

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})
