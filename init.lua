local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

function Log_variable()
  vim.fn.setreg('"', "")
  local current_position = vim.api.nvim_win_get_cursor(0)
  vim.cmd("normal! viwy")
  local yanked_text = vim.fn.getreg('"')
  vim.fn.setreg('"', "console.log('" .. yanked_text .. "', " .. yanked_text .. ")\n")
  vim.api.nvim_win_set_cursor(0, current_position)
end

require("core.options")
require("lazy").setup("plugins")
require("core.keymaps")
