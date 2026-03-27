return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-mini/mini.icons", version = "*", opts = {} },
	config = function()
		local fzf = require("fzf-lua")
		local map = vim.keymap.set

		fzf.setup({
			keymap = {
				fzf = {
					true,
					["ctrl-u"] = "unix-line-discard",
					["ctrl-q"] = "select-all+accept",
					["ctrl-f"] = "half-page-down",
					["ctrl-b"] = "half-page-up",
					["ctrl-a"] = "beginning-of-line",
					["ctrl-e"] = "end-of-line",
					["ctrl-k"] = "kill-line",
				},
			},
			previewers = {
				builtin = {
					-- don't syntax highlight for files larger than 100 kb
					syntax_limit_b = 1024 * 100,
				},
			},
			winopts = {
				backdrop = 100,
			},
		})

		local function smart_find_files()
			local root = vim.fn.systemlist("git rev-parse --show-toplevel")
			if vim.v.shell_error ~= 0 or #root == 0 then
				fzf.files()
			else
				fzf.git_files()
			end
		end

		map("n", "<leader>f", smart_find_files, { desc = "Search [F]iles" })
		map("n", "<leader>b", fzf.buffers, { desc = "Search [B]uffers" })
		map("n", "<leader>s", fzf.live_grep_native, { desc = "Search with [G]rep" })
		map("n", "<leader>r", fzf.resume, { desc = "[R]esume Search" })
		map("n", "<leader>c", fzf.commands, { desc = "Search [C]ommands" })
		map("n", "<leader>/", fzf.lgrep_curbuf, { desc = "[/] Fuzzily search current buffer" })

		map("n", "<leader>g", fzf.git_status, { desc = "[G]it Status" })

		map("n", "<leader>l", fzf.lsp_code_actions, { desc = "[L]SP Code actions" })
	end,
}
