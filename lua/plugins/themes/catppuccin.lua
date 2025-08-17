return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavor = "mocha",
			term_colors = true,
			transparent_background = vim.g.transparent_enabled,
			styles = {
				comments = { "italic" },
				conditionals = {},
			},
		})
	end,
}
