return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import lspconfig plugin safely
    local lspconfig_status, lspconfig = pcall(require, "lspconfig")
    if not lspconfig_status then
      return
    end

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- LSP settings.
    --  This function gets run when an LSP connects to a particular buffer.

    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
      end

      local fzf = require("fzf-lua")

      nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
      nmap("gr", fzf.lsp_references, "[G]oto [R]eferences")
      nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
      nmap("fd", vim.diagnostic.open_float, "[F]loat [D]escription")
      nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

      -- See `:help K` for why this keymap
      nmap("K", vim.lsp.buf.hover, "Hover Documentation")
      nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
    end

    lspconfig.tsserver.setup({
      on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        on_attach(client, bufnr)
      end,
      capabilities = capabilities,
    })

    lspconfig.yamlls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        yaml = {
          schemas = {
            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          },
        },
      },
    })

    lspconfig.graphql.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.gopls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
  end,
}
