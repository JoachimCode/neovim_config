return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      vim.lsp.config("pyright", { capabilities = capabilities })
      vim.lsp.config("clangd", { capabilities = capabilities })

      vim.lsp.enable({ "pyright", "clangd" })
    end,
  },
}

