vim.opt.termguicolors = true

local parser = require "utils.parser"

vim.schedule(function()
  local _, json =
    parser:parse(vim.api.nvim_list_runtime_paths()[1] .. "/config.json")
  local color = json.colorscheme
  vim.g.colors_name = color
  -- vim.cmd("set background=" .. json.background)
  vim.o.background = json.background or "dark"
  vim.opt.guifont = {
    -- vim.cmd [[
    -- set guifont=iMWritingMonoS\ Nerd\ Font:h16
    -- ]]
    json.font or "Menlo Nerd Font Mono",
    ":h" .. tostring(json.font_size or 16),
  }
  vim.g.python3_host_prog = json.python3_host_prog or "/opt/local/bin/python3"
end)
