local keymap = vim.keymap

-- default vim keymap overrides
keymap.set("n", "U", ":redo<CR>")
keymap.set("n", "<leader>e", vim.cmd.Ex)
keymap.set("n", "<leader>s", vim.cmd.w)

local telescope = require("telescope.builtin")

-- telescope keymaps
keymap.set("n", "<leader><space>", telescope.buffers, { desc = "[ ] Find existing buffers" })
keymap.set("n", "<leader>?", telescope.oldfiles, { desc = "[?] Find recently opened files" })
keymap.set("n", "<leader>f", telescope.find_files, { desc = "[F]iles" })
keymap.set("n", "<leader>g", telescope.live_grep, { desc = "[G]rep" })

-- diffview keymaps
keymap.set("n", "<leader>do", ":DiffviewOpen<CR>")
keymap.set("n", "<leader>dc", ":DiffviewClose<CR>")
keymap.set("n", "<leader>dh", ":DiffviewFileHistory<CR>")
keymap.set("n", "<leader>dr", ":DiffviewRefresh<CR>")

-- window control
keymap.set("n", "<leader>w", "<C-w>")

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tc", ":tabclose<CR>")
