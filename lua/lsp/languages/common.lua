local M = {}

M.keybinding = function(buf)
  local function buf_set_map(...)
    vim.api.nvim_buf_set_keymap(buf, ...)
  end
  require("common.keybindings").map_lsp(buf_set_map)
end

M.disableFormat = function(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

M.flutterKeybinding = function(buf, keybindings)
  local function buf_set_map(...)
    vim.api.nvim_buf_set_keymap(buf, ...)
  end
  keybindings.map_flutter_tools(buf_set_map)
end

M.tsKeybinding = function(buf, keybindings)
  local function buf_set_map(...)
    vim.api.nvim_buf_set_keymap(buf, ...)
  end
  keybindings.map_ts_util(buf_set_map)
end

local cmpOk, cmp = pcall(require, "cmp_nvim_lsp")
local epoOk, epo = pcall(require, "epo")

if epoOk then
  M.capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    epo.register_cap()
  )
elseif cmpOk then
  M.capabilities = cmp.default_capabilities {
    snippetSupport = false,
  }
end

M.flags = {
  debounce_text_changes = 150,
}

M.border = {
  { "┌", "highlight" },
  { "─", "highlight" },
  { "┐", "highlight" },
  { "│", "highlight" },
  { "┘", "highlight" },
  { "─", "highlight" },
  { "└", "highlight" },
  { "│", "highlight" },
}

M.handlers = {
  ["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = M.border }
  ),
  ["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = M.border }
  ),
}

return M
