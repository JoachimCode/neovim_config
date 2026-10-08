vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"

opt.scrolloff = 8

opt.splitright = true
opt.splitbelow = true

opt.clipboard = "unnamedplus"

opt.undofile = true

opt.updatetime = 250


-- ========================================
-- lazy.nvim
-- ========================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)


-- ========================================
-- Plugins
-- ========================================

require("lazy").setup({

    -- Theme
   {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,

    config = function()
        vim.cmd.colorscheme("tokyonight-day")
    end,
},

-- Status bar
    {
        "nvim-lualine/lualine.nvim",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                },
            })
        end,
    },

    -- Syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",

        lazy = false,

        build = ":TSUpdate",

        config = function()

            require("nvim-treesitter").install({
                "c",
                "cpp",
                "rust",
                "python",
                "java",
                "lua",
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "c",
                    "cpp",
                    "rust",
                    "python",
                    "java",
                    "lua",
                },

                callback = function()
                    vim.treesitter.start()
                end,
            })
        end,
    },

    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",

        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- Mason
    {
        "mason-org/mason.nvim",

        opts = {},
    },

    -- LSP servers
    {
        "mason-org/mason-lspconfig.nvim",

        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },

        opts = {
            ensure_installed = {
                "clangd",
                "rust_analyzer",
                "basedpyright",
                "jdtls",
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
    },

    -- Autocomplete
    {
        "saghen/blink.cmp",

        version = "1.*",

        opts = {
            keymap = {
                preset = "enter",
            },

            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 300,
                },
            },

            signature = {
                enabled = true,
            },

            sources = {
                default = {
                    "lsp",
                    "path",
                    "snippets",
                    "buffer",
                },
            },

            fuzzy = {
                implementation = "prefer_rust",
            },
        },
    },

    
    {
    "stevearc/oil.nvim",

    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    opts = {
        default_file_explorer = true,

        view_options = {
            show_hidden = true,
        },
    },

    keys = {
        {
            "-",
            "<cmd>Oil<cr>",
            desc = "Open parent directory",
        },
    },
},

    -- Formatting
    {
        "stevearc/conform.nvim",

        opts = {
            formatters_by_ft = {
                cpp = { "clang_format" },
                c = { "clang_format" },

                rust = { "rustfmt" },

                python = { "ruff_format" },

                java = { "google-java-format" },
            },

            format_on_save = {
                timeout_ms = 1000,
                lsp_format = "fallback",
            },
        },
    },

})


-- ========================================
-- LSP
-- ========================================

local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("*", {
    capabilities = capabilities,
})

vim.lsp.enable({
    "clangd",
    "rust_analyzer",
    "basedpyright",
    "jdtls",
})


-- LSP keybindings
vim.api.nvim_create_autocmd("LspAttach", {

    callback = function(args)

        local opts = {
            buffer = args.buf,
        }

        vim.keymap.set(
            "n",
            "gd",
            vim.lsp.buf.definition,
            opts
        )

        vim.keymap.set(
            "n",
            "gD",
            vim.lsp.buf.declaration,
            opts
        )

        vim.keymap.set(
            "n",
            "gr",
            vim.lsp.buf.references,
            opts
        )

        vim.keymap.set(
            "n",
            "K",
            vim.lsp.buf.hover,
            opts
        )

        vim.keymap.set(
            "n",
            "<leader>rn",
            vim.lsp.buf.rename,
            opts
        )

        vim.keymap.set(
            "n",
            "<leader>ca",
            vim.lsp.buf.code_action,
            opts
        )

        vim.keymap.set(
            "n",
            "<leader>d",
            vim.diagnostic.open_float,
            opts
        )

        vim.keymap.set(
            "i",
            "<C-k>",
            vim.lsp.buf.signature_help,
            opts
        )

    end,
})


-- ========================================
-- Telescope
-- ========================================

local telescope = require("telescope.builtin")

vim.keymap.set(
    "n",
    "<leader>ff",
    telescope.find_files
)

vim.keymap.set(
    "n",
    "<leader>fg",
    telescope.live_grep
)

vim.keymap.set(
    "n",
    "<leader>fb",
    telescope.buffers
)

vim.keymap.set(
    "n",
    "<leader>fs",
    telescope.lsp_document_symbols
)


-- ========================================
-- Diagnostics
-- ========================================

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,

    update_in_insert = false,
    severity_sort = true,

    float = {
        border = "rounded",
        source = true,
    },
})


-- ========================================
-- General keybindings
-- ========================================

vim.keymap.set(
    "n",
    "<leader>w",
    "<cmd>w<cr>"
)

vim.keymap.set(
    "n",
    "<leader>q",
    "<cmd>q<cr>"
)


-- Window movement
vim.keymap.set(
    "n",
    "<leader>h",
    "<C-w>h"
)

vim.keymap.set(
    "n",
    "<leader>j",
    "<C-w>j"
)

vim.keymap.set(
    "n",
    "<leader>k",
    "<C-w>k"
)

vim.keymap.set(
    "n",
    "<leader>l",
    "<C-w>l"
)


-- Splits
vim.keymap.set(
    "n",
    "<leader>sv",
    "<cmd>vsplit<cr>"
)

vim.keymap.set(
    "n",
    "<leader>sh",
    "<cmd>split<cr>"
)


