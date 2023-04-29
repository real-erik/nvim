return {
	-- dir = '~/RSS/plugins-custom/variable-logger',
	"ErikAasen-RSS/variable-logger.nvim",
	config = function()
		require("variable-logger").setup({
			prefix = "🪵 - ",
		})
	end,
}
