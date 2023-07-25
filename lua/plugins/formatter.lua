return {
	"mhartington/formatter.nvim",
	config = function()
		require("formatter").setup({
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				javascript = {
					require("formatter.filetypes.javascript").prettiereslint,
				},
				javascriptreact = {
					require("formatter.filetypes.javascriptreact").prettiereslint,
				},
			},
		})
	end,
}
