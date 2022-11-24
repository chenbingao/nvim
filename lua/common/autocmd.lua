local autoGroup = vim.api.nvim_create_augroup("autoGroup", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
  group = autoGroup,
  pattern = { "*.res", "*.rs", "*.ml", "*.go", "*.h", "*.hpp", "*.c", "*.cpp", "*.lua" },
  callback = vim.lsp.buf.formatting,
})

-- vim.cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = true}"
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { on_visual = true }
  end,
  group = autoGroup,
  pattern = "*",
})
