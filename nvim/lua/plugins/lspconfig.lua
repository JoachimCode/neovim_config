return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Capabilities for completion (works with nvim-cmp if installed)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      -- Optional: standard keymaps on attach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buf = args.buf
          local map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = buf })
          end
          map("n", "gd", vim.lsp.buf.definition)
          map("n", "gr", vim.lsp.buf.references)
          map("n", "K", vim.lsp.buf.hover)
          map("n", "<leader>rn", vim.lsp.buf.rename)
          map("n", "<leader>ca", vim.lsp.buf.code_action)
        end,
      })

      -- Configure servers (no require("lspconfig")!)
      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })

      vim.lsp.config("clangd", {
        capabilities = capabilities,
        cmd = { "clangd", "--background-index", "--clang-tidy" },
      })

      -- Enable them
      vim.lsp.enable({ "pyright", "clangd" })
    end,
  },
}

