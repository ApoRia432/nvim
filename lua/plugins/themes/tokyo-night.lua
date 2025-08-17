return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "moon",
		transparnet = vim.g.transparent_enabled,
		styles = {
			comments = { italic = true },
			keywords = { italic = false },
		},
	},
}
