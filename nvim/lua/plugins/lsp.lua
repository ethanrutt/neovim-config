return {
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		opts_extend = {
			"ensure_installed",
			"ensure_enabled",
		},
		opts = {
			-- lsp name in mason
			-- :Mason
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"tree-sitter-cli",
				-- add additional tools to install with mason here
			},
			-- lsp name in lspconfig
			-- https://github.com/neovim/nvim-lspconfig
			ensure_enabled = {
				"lua_ls",
				-- add additional lsp's to enable here
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)

			local mr = require("mason-registry")
			mr.refresh(function()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end)

			vim.lsp.enable(opts.ensure_enabled)
		end,
	},

	{
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
	},
}
