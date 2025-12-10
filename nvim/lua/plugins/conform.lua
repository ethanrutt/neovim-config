return {
	"stevearc/conform.nvim",
	dependencies = {
		"mason-org/mason.nvim",
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- add additional formatters here
		},
	},
	config = function(_, opts)
		local conform = require("conform")

		conform.setup(opts)

		vim.keymap.set("n", "<leader>F", function()
			conform.format({ async = true, lsp_fallback = true })
		end, { desc = "[F]ormat buffer" })
	end,
}
