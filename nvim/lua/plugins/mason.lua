return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",      -- python
        "clangd",       -- cpp
        "cmake-language-server",
        "bash-language-server",
        "lua-language-server",
      },
    },
  },
}

