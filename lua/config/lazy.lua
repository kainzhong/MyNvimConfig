local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- 恢复最后一次设置的colorscheme
local colorscheme_config = vim.fn.stdpath('config') .. '/lua/config/colorscheme.lua'
if vim.fn.filereadable(colorscheme_config) == 1 then
  dofile(colorscheme_config)
end


local telescope = require('telescope')

local search_hidden = false
-- Clone the default Telescope configuration
local vimgrep_arguments = {
  'rg',
  '--color=never',
  '--no-heading',
  '--with-filename',
  '--line-number',
  '--column',
  '--smart-case',
}
local vimgrep_no_ignore_arguments = {
  'rg',
  '--color=never',
  '--no-heading',
  '--with-filename',
  '--line-number',
  '--column',
  '--smart-case',
  '-u'     -- thats the new thing
}

function Toggle_search_hidden()
  search_hidden = not search_hidden
  local message = search_hidden and "Hidden files not excluded" or "Hidden files excluded"
  vim.notify(message, vim.log.levels.INFO)

  if search_hidden then
    telescope.setup {
      defaults = {
        vimgrep_arguments = vimgrep_no_ignore_arguments,
      },
      pickers = {
        find_files = {
          find_command = { "fd", "-HI", "--type", "f" }
        },
      }
    }
  else
    telescope.setup {
      defaults = {
        vimgrep_arguments = vimgrep_arguments
      },
      pickers = {
        find_files = {
          find_command = { "fd", "--type", "f" }
        },
      }
    }
  end
end

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

