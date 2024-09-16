return {
  -- dir = "~/RSS/plugins-custom/nitpick-nvim",
  "nitpick-dev/nitpick.nvim",
  build = "nvim -l lua/install.lua",
  config = function()
    require("nitpick").setup()
  end,
}
