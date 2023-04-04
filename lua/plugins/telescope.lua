return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.1",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      pickers = {
        buffers = {
          mappings = {
            n = {
              ["d"] = "delete_buffer",
            },
          },
        },
      },
    })
    telescope.load_extension("file_browser")
  end,
}
