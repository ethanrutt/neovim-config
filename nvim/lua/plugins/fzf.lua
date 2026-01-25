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

		map("n", "<leader>sf", smart_find_files, { desc = "[S]earch [F]iles" })
		map("n", "<leader>sb", fzf.buffers, { desc = "[S]earch [B]uffers" })
		map("n", "<leader>sg", fzf.live_grep_native, { desc = "[S]earch with [G]rep" })
		map("n", "<leader>sr", fzf.resume, { desc = "[S]earch [R]esume" })
		map("n", "<leader>sc", fzf.commands, { desc = "[S]earch [C]ommands" })
		map("n", "<leader>/", fzf.lgrep_curbuf, { desc = "[/] Fuzzily search current buffer" })

		map("n", "<leader>gs", fzf.git_status, { desc = "[G]it [S]tatus" })

		map("n", "<leader>lc", fzf.lsp_code_actions, { desc = "[L]SP [C]ode actions" })
		map("n", "<leader>ld", fzf.lsp_document_symbols, { desc = "[L]SP [D]ocument symbols" })

		map("n", "<leader>ff", smart_find_files, { desc = "[F]ind [F]iles" })
		map("n", "<leader>fb", fzf.builtin, { desc = "[F]ind [B]uiltin pickers" })
		map("n", "<leader>fh", fzf.helptags, { desc = "[F]ind [H]elp" })
		map("n", "<leader>fm", fzf.manpages, { desc = "[F]ind [M]anpages" })
		map("n", "<leader>fp", fzf.registers, { desc = "[F]ind in registers to [P]aste" })
		map("n", "<leader>fq", fzf.quickfix, { desc = "[F]ind in [Q]uickfix" })
		map("n", "<leader>fl", fzf.loclist, { desc = "[F]ind in [L]oclist" })
	end,
}
