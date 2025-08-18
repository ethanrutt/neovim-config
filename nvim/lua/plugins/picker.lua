return {
	"ibhagwan/fzf-lua",
	config = function()
		require("fzf-lua").setup({
			keymap = {
				fzf = {
					true,
					["ctrl-d"] = "preview-page-down",
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
		})

		local fzf = require("fzf-lua")
		local map = vim.keymap.set

		local function smart_find_files()
			local root = vim.fn.systemlist("git rev-parse --show-toplevel")
			if vim.v.shell_error ~= 0 or #root == 0 then
				fzf.files()
			else
				fzf.git_files()
			end
		end

		map("n", "<leader>ff", smart_find_files, { desc = "[F]ind [F]iles" })
		map("n", "<leader>sg", fzf.live_grep, { desc = "[S]earch with [G]rep" })
		map("n", "<leader><space>", fzf.buffers, { desc = "[ ] Search buffers" })
		map("n", "<leader>/", fzf.lgrep_curbuf, { desc = "[/] Fuzzily search current buffer" })

		map("n", "<leader>gd", fzf.lsp_definitions, { desc = "[G]oto [D]efinition" })
		map("n", "<leader>gr", fzf.lsp_references, { desc = "[G]oto [R]eferences" })
		map("n", "<leader>gI", fzf.lsp_implementations, { desc = "[G]oto [I]mplementation" })
		map("n", "<leader>D", fzf.lsp_typedefs, { desc = "Type [D]efinition" })
		map("n", "<leader>ds", fzf.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
		map("n", "<leader>ws", fzf.lsp_live_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })

		map("n", "<leader>sk", fzf.keymaps, { desc = "[S]earch [K]eymaps" })
		map("n", "<leader>sh", fzf.helptags, { desc = "[S]earch [H]elp tags" })
		map("n", "<leader>sc", fzf.commands, { desc = "[S]earch [C]ommands" })
		map("n", "<leader>sm", fzf.manpages, { desc = "[S]earch [M]anpages" })
	end,
}
