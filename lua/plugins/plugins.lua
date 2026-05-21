return {

  {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = true
  },

  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>dR",
        function()
          local function shell_split(s)
            local args, buf, quote = {}, nil, nil
            local i = 1
            while i <= #s do
              local c = s:sub(i, i)
              if quote then
                if c == quote then
                  quote = nil
                elseif c == "\\" and quote == '"' and i < #s then
                  i = i + 1
                  buf = (buf or "") .. s:sub(i, i)
                else
                  buf = (buf or "") .. c
                end
              elseif c == '"' or c == "'" then
                quote = c
                buf = buf or ""
              elseif c:match("%s") then
                if buf then
                  args[#args + 1] = buf
                  buf = nil
                end
              elseif c == "\\" and i < #s then
                i = i + 1
                buf = (buf or "") .. s:sub(i, i)
              else
                buf = (buf or "") .. c
              end
              i = i + 1
            end
            if buf then args[#args + 1] = buf end
            return args
          end

          vim.ui.input({ prompt = "Debug: ", default = "python " }, function(line)
            if not line or line:match("^%s*$") then return end
            line = line:gsub("^%s*python3?%s+", "")
            local parts = shell_split(line)
            local cfg = {
              type = "python",
              request = "launch",
              name = "Pasted command",
              console = "integratedTerminal",
              cwd = vim.fn.getcwd(),
              justMyCode = false,
            }
            if parts[1] == "-m" then
              cfg.module = parts[2]
              cfg.args = vim.list_slice(parts, 3)
            else
              cfg.program = vim.fn.fnamemodify(parts[1], ":p")
              cfg.args = vim.list_slice(parts, 2)
            end
            require("dap").run(cfg)
          end)
        end,
        desc = "Debug pasted python command",
      },
    },
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
