-- Ensure XDG_RUNTIME_DIR points to a writable path. Some remote hosts have no
-- /run/user/$UID set up, which breaks plugins that call serverstart() (e.g. fzf-lua).
do
  local xdg = vim.env.XDG_RUNTIME_DIR
  if not xdg or vim.fn.isdirectory(xdg) == 0 or vim.fn.filewritable(xdg) ~= 2 then
    local fallback = "/tmp/runtime-" .. (vim.env.USER or tostring(vim.loop.os_getpid()))
    vim.fn.mkdir(fallback, "p", "0700")
    vim.env.XDG_RUNTIME_DIR = fallback
  end
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Folding: use Neovim's built-in treesitter foldexpr.
-- nvim-treesitter's master-branch fold.lua calls node:range() which no longer
-- exists on current Neovim, so nvim_treesitter#foldexpr() throws E5108.
-- LazyVim re-sets foldexpr per-buffer, so we re-assert ours via FileType too.
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("force_ts_folding", { clear = true }),
  callback = function(args)
    if pcall(vim.treesitter.get_parser, args.buf) then
      vim.api.nvim_buf_call(args.buf, function()
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      end)
    end
  end,
})
