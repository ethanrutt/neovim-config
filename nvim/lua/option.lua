local o = vim.o

--
-- basic
--
vim.g.netrw_banner = 0
o.number = true
o.cursorline = true
o.wrap = false
o.scrolloff = 10
o.sidescrolloff = 8
o.mouse = ""

--
-- indentation
--
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.autoindent = true
o.breakindent = true

--
-- search
--
o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true

--
-- view
--
o.termguicolors = true
o.colorcolumn = "80"
o.signcolumn = "yes"

--
-- undodir
--
local undodir = vim.fn.expand("~/.nvim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
o.undofile = true
o.undodir = undodir

--
-- file
--
o.backup = false
o.writebackup = false
o.swapfile = false
o.autoread = true
o.autowrite = false

--
-- virtual line
--
vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = false,
})
