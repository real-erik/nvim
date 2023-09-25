local keymap = vim.keymap

-- default vim keymap overrides
keymap.set("n", "U", ":redo<CR>")
keymap.set("n", "<leader>e", vim.cmd.Ex)
keymap.set("n", "<leader>w", vim.cmd.w)
keymap.set("n", "<c-u>", "<c-u>zz")
keymap.set("n", "<c-d>", "<c-d>zz")
keymap.set("n", "<c-i>", "<c-i>zz")
keymap.set("n", "<c-o>", "<c-o>zz")
keymap.set("n", "}", "}zz")
keymap.set("n", "{", "{zz")
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")
keymap.set("n", "<leader>a", "<C-w>")

-- clear search highlights
keymap.set("n", "<ESC>", ":nohl<CR>", { silent = true })

-- logger keymaps
local logger = require("variable-logger")
local function logWithAsterisk()
  logger.log_variable(" ******** ")
end
keymap.set("n", "<leader>ya", logWithAsterisk)
keymap.set("n", "<leader>y", logger.log_variable)

-- rekt keymaps
local rekt = require("rekt")
keymap.set("n", "<leader>tf", rekt.open_test_file)
keymap.set("n", "<leader>ts", rekt.open_source_file)

-- new formatting - wip
-- keymap.set("n", "<leader>ff", ":Format<CR>")

-- leap
keymap.set("n", "s", function()
  local current_window = vim.fn.win_getid()
  require("leap").leap({ target_windows = { current_window } })
end)

-- gitsigns keymaps
local gitsigns = require("gitsigns")
keymap.set("n", "<leader>gh", function()
  gitsigns.next_hunk()
  vim.defer_fn(function()
    vim.cmd("normal! zz")
  end, 1)
end)
keymap.set("n", "<leader>gp", gitsigns.preview_hunk)
keymap.set("n", "<leader>gr", gitsigns.reset_hunk)

-- fzf-lua keymaps
local fzf = require("fzf-lua")
keymap.set("n", "<leader><leader>", fzf.buffers)
keymap.set("n", "<leader>sf", fzf.files)
keymap.set("n", "<leader>sg", function()
  fzf.grep({ search = "" })
end)
keymap.set("n", "<leader>sr", fzf.resume)
keymap.set("n", "<leader>gb", fzf.git_branches)

-- diffview keymaps
keymap.set("n", "<leader>do", ":DiffviewOpen<CR>")
keymap.set("n", "<leader>dc", ":DiffviewClose<CR>")
keymap.set("n", "<leader>dh", ":DiffviewFileHistory<CR>")
keymap.set("n", "<leader>dr", ":DiffviewRefresh<CR>")
keymap.set("n", "<leader>df", ":DiffviewFileHistory %<CR>")

-- fugitive keymaps
keymap.set("n", "<leader>gc", ":Git commit<CR>")

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tc", ":tabclose<CR>")
keymap.set("n", "<tab>", ":tabnext<CR>")
keymap.set("n", "<s-tab>", ":tabprev<CR>")

-- github thing
local github_utils = require("github-utils")
vim.keymap.set("n", "<leader>gitw", github_utils.open_web_client)
vim.keymap.set("n", "<leader>gitf", github_utils.open_web_client_file)
vim.keymap.set("n", "<leader>gitp", github_utils.create_permalink)
vim.keymap.set("v", "<leader>gitm", github_utils.create_permalink_multiline)

-- override <c-l> in file browser
keymap.set("n", "<leader>z", "<Plug>NetrwRefresh")

-- spider keymaps
vim.keymap.set({"n", "o", "x"}, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({"n", "o", "x"}, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({"n", "o", "x"}, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
vim.keymap.set({"n", "o", "x"}, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
