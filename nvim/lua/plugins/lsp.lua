return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{
				"stevearc/conform.nvim",
				event = { "BufWritePre" },
				cmd = { "ConformInfo" },
				keys = {
					{
						"<leader>F",
						function()
							require("conform").format({ async = true, lsp_fallback = true })
						end,
						mode = "",
						desc = "Format buffer",
					},
				},
				opts = {
					notify_on_error = true,
					log_level = vim.log.levels.INFO,
					formatters_by_ft = {
						lua = { "stylua" },
						-- add other filetypes and their formatters here
					},
				},
			},
		},
		config = function()
			require("mason").setup()
			require("mason-tool-installer").setup({
				-- this is the name of the language server in mason
				-- add other lsp's here
				ensure_installed = {
					"lua-language-server",
					"stylua",
				},
			})

			-- this is the name of the language server in lspconfig
			-- add other lsp's here
			vim.lsp.enable({
				"lua_ls",
			})

			local map = vim.keymap.set
			map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "[W]orkspace [A]dd Folder" })
			map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "[W]orkspace [R]emove Folder" })
			map("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, { desc = "[W]orkspace [L]ist Folders" })
		end,
	},
}
