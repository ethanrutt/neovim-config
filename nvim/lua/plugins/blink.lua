return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
		keymap = {
			preset = "super-tab",
			["<C-x>"] = { "show", "show_documentation", "hide_documentation" },
		},
		completion = {
			menu = {
				auto_show = false,
			},
		},
	},
}
