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

-- gitsigns keymaps
keymap.set("n", "<leader>gh", function()
  require("gitsigns").next_hunk()
  vim.defer_fn(function()
    vim.cmd("normal! zz")
  end, 1)
end)
keymap.set("n", "<leader>gp", require("gitsigns").preview_hunk)
keymap.set("n", "<leader>gr", require("gitsigns").reset_hunk)

local telescope = require("telescope.builtin")
-- telescope keymaps
keymap.set("n", "<leader><space>", telescope.buffers, { desc = "[ ] Find existing buffers" })
keymap.set("n", "<leader>?", telescope.oldfiles, { desc = "[?] Find recently opened files" })
keymap.set("n", "<leader>sf", telescope.find_files, { desc = "[S]earch [F]iles" })
keymap.set("n", "<leader>sg", telescope.live_grep, { desc = "[S]earch [G]rep" })
keymap.set("n", "<leader>sr", telescope.resume, { desc = "[S]earch [R]esume" })
keymap.set("n", "<space>sb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")   -- list current changes per file with diff preview ["gs" for git status]

-- diffview keymaps
keymap.set("n", "<leader>do", ":DiffviewOpen<CR>")
keymap.set("n", "<leader>dc", ":DiffviewClose<CR>")
keymap.set("n", "<leader>dh", ":DiffviewFileHistory<CR>")
keymap.set("n", "<leader>dr", ":DiffviewRefresh<CR>")
keymap.set("n", "<leader>df", ":DiffviewFileHistory %<CR>")

-- fugitive keymaps
keymap.set("n", "<leader>gc", ":Git commit<CR>")

-- window control
keymap.set("n", "<leader>a", "<C-w>")

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tc", ":tabclose<CR>")

-- github thing
keymap.set("n", "<leader>git", require("utils.git").open_web_client)

