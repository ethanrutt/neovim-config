local o = vim.o

vim.g.netrw_banner = 0

o.number = true
o.cursorline = true
o.wrap = false
o.scrolloff = 10
o.sidescrolloff = 8

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

o.ignorecase = true
o.smartcase = true
o.hlsearch = false

o.termguicolors = true
o.colorcolumn = "80"
o.signcolumn = "yes"

o.writebackup = false
o.swapfile = false
o.autoread = true

o.mouse = ""

vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = false,
})
