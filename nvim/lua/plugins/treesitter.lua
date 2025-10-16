return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	dependencies = {
		"mason-org/mason.nvim",
	},
	build = ":TSUpdate",
	opts_extend = {
		"ensure_installed",
	},
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"css",
			"diff",
			"dockerfile",
			"graphql",
			"git_commit",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitignore",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"jsonc",
			"json5",
			"jsx",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"ruby",
			"rust",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter").install(opts.ensure_installed)

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				local lang = vim.treesitter.language.get_lang(ev.match)

				if vim.tbl_contains(opts.ensure_installed, lang) then
					vim.treesitter.start()
				end
			end,
		})
	end,
}
