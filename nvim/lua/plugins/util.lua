return {
	{ "windwp/nvim-ts-autotag", event = "InsertEnter", opts = {} },
	{ "nvim-mini/mini.icons", version = "*", opts = {} },
	{ "nvim-mini/mini.surround", version = "*", opts = {} },
	{ "nvim-mini/mini.pairs", version = "*", opts = {} },

	{
		"nvim-mini/mini.trailspace",
		version = "*",
		config = function()
			ts = require("mini.trailspace")
			ts.setup()
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function()
					ts.trim()
					ts.trim_last_lines()
				end,
			})
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
		},
	},
}
