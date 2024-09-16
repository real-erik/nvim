return {
	dir = '~/RSS/plugins-custom/variable-logger',
	-- "real-erik/variable-logger.nvim",
	config = function()
		require("variable-logger").setup({
			prefix = "🐢🐢🐢 - ",
		})
	end,
}
