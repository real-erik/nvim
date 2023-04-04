return {
	"rose-pine/neovim",
	config = function()
		require("rose-pine").setup({})
		vim.cmd("colorscheme lunaperche")
    vim.opt.termguicolors = true
	end,
}
