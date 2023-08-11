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
keymap.set("n", "<c-k>", ":wincmd k<CR>")
keymap.set("n", "<c-j>", ":wincmd j<CR>")
keymap.set("n", "<c-h>", ":wincmd h<CR>")
keymap.set("n", "<c-l>", ":wincmd l<CR>")

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
keymap.set("n", "<leader>tf", require("rekt").open_test_file)
keymap.set("n", "<leader>ts", require("rekt").open_source_file)

-- new formatting - wip
-- keymap.set("n", "<leader>ff", ":Format<CR>")

-- gitsigns keymaps
keymap.set("n", "<leader>gh", function()
  require("gitsigns").next_hunk()
  vim.defer_fn(function()
    vim.cmd("normal! zz")
  end, 1)
end)
keymap.set("n", "<leader>gp", require("gitsigns").preview_hunk)
keymap.set("n", "<leader>gr", require("gitsigns").reset_hunk)

-- fzf-lua keymaps
local fzf = require("fzf-lua")
keymap.set("n", "<leader><space>", fzf.buffers)
keymap.set("n", "<leader>sf", fzf.files)
keymap.set("n", "<leader>sg", function()
  fzf.grep({ search = "" })
end)
keymap.set("n", "<leader>sr", fzf.resume)

-- telescope keymaps
keymap.set("n", "<space>sb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]

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

-- github thing
vim.keymap.set("n", "<leader>gitw", require("github-utils").open_web_client)
vim.keymap.set("n", "<leader>gitf", require("github-utils").open_web_client_file)
vim.keymap.set("n", "<leader>gitp", require("github-utils").create_permalink)
vim.keymap.set("v", "<leader>gitm", require("github-utils").create_permalink_multiline)
