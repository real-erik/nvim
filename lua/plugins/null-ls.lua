return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    local function format()
      vim.lsp.buf.format({ timeout_ms = 2000 })
    end

    vim.keymap.set("n", "<Leader>f", format)

    null_ls.setup({
      sources = {
        -- Formatters
        formatting.prettier,
        formatting.stylua,
        formatting.yamlfmt,

        -- Linters
        diagnostics.ansiblelint,
        diagnostics.eslint,
      },
    })
  end,
}
