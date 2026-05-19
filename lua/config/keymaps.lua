-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")


-- Use option+left/right to move to the start/ end of line in insert mode
vim.api.nvim_set_keymap('i', '<M-left>', '<Esc>^i', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<M-right>', '<Esc>$a', {noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<M-S-left>', '<Esc>bi', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<M-S-right>', '<Esc>ea', {noremap = true, silent = true})

-- Use option+shift+up/down to move around in insert mode and exit any prompt
vim.api.nvim_set_keymap('i', '<M-S-up>', '<Esc>ka', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<M-S-down>', '<Esc>ja', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<M-S-up>', '<C-u>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-S-down>', '<C-d>', {noremap = true, silent = true})

-- Use option+left/right to move around in normal mode
vim.api.nvim_set_keymap('n', '<M-left>', '^', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-right>', '$', {noremap = true, silent = true})

-- Use option+shift+arrow keys to select text
vim.api.nvim_set_keymap('n', '<M-S-left>', 'b', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-S-right>', 'e', {noremap = true, silent = true})

vim.api.nvim_set_keymap('v', '<M-left>', '^', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<M-right>', '$', {noremap = true, silent = true})

vim.api.nvim_set_keymap('v', '<M-S-left>', 'b', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<M-S-right>', 'e', {noremap = true, silent = true})

-- Use control+arrow keys to move to the beginning/end of line
vim.api.nvim_set_keymap('n', '<C-left>', '^', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-right>', '$', {noremap = true, silent = true})

wk.add({
  { "<leader>fP", "<cmd>echo expand('%:p')<cr>", desc = "Echo absolute path"},
  { "<leader>fp", "<cmd>echo expand('%p')<cr>", desc = "Echo relative path"},
})

wk.add({
  { "<leader>bw", "<cmd>set wrap!<cr>", desc = "Toggle wrap lines" }
})

wk.add({
  { "<leader>t", desc = "picker" },
  {
    mode = { "n" },
    { "<leader>tm", function() Snacks.picker.keymaps() end,                 desc = "keymaps" },
    { "<leader>tq", function() Snacks.picker.qflist() end,                  desc = "quickfix" },
    { "<leader>tl", function() Snacks.picker.loclist() end,                 desc = "loclist" },
    { "<leader>tf", function() Snacks.picker.files() end,                   desc = "find files" },
    { "<leader>tg", function() Snacks.picker.grep() end,                    desc = "live grep" },
    { "<leader>tb", function() Snacks.picker.buffers() end,                 desc = "buffers" },
    { "<leader>th", function() Snacks.picker.help() end,                    desc = "help tags" },
    { "<leader>ts", function() Snacks.picker.lsp_symbols() end,             desc = "document symbols" },
    { "<leader>td", function() Snacks.picker.lsp_definitions() end,         desc = "definitions" },
    { "<leader>ti", function() Snacks.picker.lsp_implementations() end,     desc = "implementations" },
    { "<leader>tt", function() Snacks.picker.lsp_type_definitions() end,    desc = "type definitions" },
    { "<leader>tr", function() Snacks.picker.lsp_references() end,          desc = "references" },
    { "<leader>tc", function() Snacks.picker.commands() end,                desc = "commands" },
    { "<leader>tw", function() Snacks.picker.lsp_workspace_symbols() end,   desc = "workspace symbols" },
    { "<leader>to", function() Snacks.picker.diagnostics_buffer() end,      desc = "document diagnostics" },
    { "<leader>ta", function() Snacks.picker.diagnostics() end,             desc = "workspace diagnostics" },
    { "<leader>ty", function() Snacks.picker.lsp_workspace_symbols() end,   desc = "dynamic workspace symbols" },
  },

  { "<leader>l", desc = "lazy"},
  {
    mode = { "n", "v"},
    { "<leader>ll", "<cmd>Lazy<cr>", desc = "lazy home"},
    { "<leader>le", "<cmd>LazyExtras<cr>", desc = "lazy extra home"},
  }
})

