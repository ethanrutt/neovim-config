return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	dependencies = {
		"mason-org/mason.nvim",
	},
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
			-- add additional formatters here
		},
	},
}
