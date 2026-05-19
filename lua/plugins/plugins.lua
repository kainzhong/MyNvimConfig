return {

  {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = true
  },

  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      win = {
        height = { min = 4, max = math.huge },
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "clang-format",
        "clangd",
        "cmake-language-server",
        "cmakelang",
        "cmakelint",
        "cpplint",
        "cpptools",
        "eslint_d",
        "flake8",
        "jq",
        "lua-language-server",
        "prettier",
        "typescript-language-server",
      },
    },
  },

  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    opts = {
      -- add your options that should be passed to the setup() function here
      position = "right",
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    -- Pinned to 'master'; the 'main' rewrite is a separate config migration.
    -- Folding uses Neovim's vim.treesitter.foldexpr() (set in init.lua), which
    -- bypasses master's broken fold.lua.
    branch = "master",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "rust",
        "go",
        "cpp",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      -- 启用代码高亮功能
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
      },
      -- 启用增量选择
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          node_incremental = '<CR>',
          node_decremental = '<BS>',
          scope_incremental = '<TAB>',
        }
      },
      -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
      indent = {
        enable = true
      }
    },
  },

}
