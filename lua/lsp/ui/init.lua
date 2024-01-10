-- auto show diagnostic message
-- vim.o.updatetime = 350
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
local M = {}

local lspKindOk, lspkind = pcall(require, "lspkind")
if lspKindOk then
  lspkind.init {}
  local ok, _ = pcall(require, "cmp")
  local epoOk, _ = pcall(require, "epo")

  local function get_symbol(kind)
    local symbol = lspkind.symbol_map[kind]
    local hasString = false
    if symbol then
      hasString = true
    end
    return hasString, symbol
  end

  if ok then
    M.formatting = {
      fields = { "kind", "abbr", "menu" },
      format = lspkind.cmp_format {
        mode = "text",
        -- with_text = true,
        maxwidth = 50,
        presets = "codicons",
        before = function(entry, vim_item)
          local kind = vim_item.kind
          vim_item.menu = kind
          local source = (
            { nvim_lsp = "LSP", path = "Path", buffer = "Buffer" }
          )[entry.source.name]
          if source then
            vim_item.menu = vim_item.menu .. " [" .. source .. "]"
          end
          vim_item.kind = lspkind.symbol_map[kind]
          return vim_item
        end,
      },
    }
  elseif epoOk then
    M.epo_formatting = function(kind)
      local o, s = get_symbol(kind)
      if o then
        return (s .. "  " .. kind)
      else
        return ""
      end
    end
  end
end

local ok, lspsaga = pcall(require, "lspsaga")
if ok then
  lspsaga.setup {
    ui = {
      border = "single",
    },
    symbol_in_winbar = { enable = false },
    diagnostic = { border_follow = false },
    finder = {
      keys = {
        -- expand_or_jump = "<CR>",
      },
    },
  }
else
  vim.notify "Failed to load lspsaga."
end

return M
