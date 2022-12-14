local wk = require "which-key"
local mapping = {
  a = {
    name = "Search",
    b = { "<cmd>Telescope buffers<CR>", "Search Buffer" },
    g = { "<cmd>Telescope live_grep<CR>", "Search Keyword" },
  },
  b = {
    name = "Buffer",
    d = { ":bd<CR>", "Delete Buffer" },
    k = { ":bw<CR>", "Kill Buffer" },
  },
  d = {
    name = "Debugger",
    s = { "Start" },
    q = { "Quit" },
    c = { "Continue" },
    p = { "Set BreakPoint" },
    P = { "Clear All BreakPoints" },
    j = { "Step Over" },
    o = { "Step Out" },
    i = { "Step Into" },
    h = { "Help" },
  },
  f = {
    name = "File",
    s = { ":update<CR>", "Save" },
    t = { ":NvimTreeToggle<CR>", "Toggle Tree" },
    r = { ":NvimTreeRefresh<CR>", "Tree Refresh" },
    d = { ":NvimTreeFindFile<CR>", "Find Current File" },
  },
  l = {
    name = "LSP",
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    -- c = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action' },
    c = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
    -- f = { '<cmd>lua vim.lsp.buf.formatting()<CR>', 'Formatting' },
  },
  p = {
    name = "Projects",
    t = {
      "<cmd>Telescope projects<CR>",
      "Show Recent Projects",
    },
  },
  s = {
    name = "Search",
    c = { ":nohlsearch<CR>", "Clear Highlight Result" },
  },
  t = {
    name = "Terminal",
    t = { ":ToggleTerm<CR>", "Open Terminal" },
    g = { "<cmd>lua _lazygit_toggle()<CR>", "Open lazygit" },
  },
  w = {
    name = "Window",
    h = { ":vsp<CR>", "Split Horizontal Window" },
    v = { ":sp<CR>", "Split Vertical Window" },
    c = { "<C-w>c", "Close Current Window" },
    o = { "<C-w>o", "Close Other Windows" },
    ["="] = { "<C-w>=", "Same Width Split Window" },
  },
}

local format = { "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", "Formatting" }

local localMapping = {
  p = { ":BufferLineCyclePrev<CR>", "Previous Buffer" },
  n = { ":BufferLineCycleNext<CR>", "Next Buffer" },
  o = { "<cmd>Telescope find_files<CR>", "Open File" },
  d = { "Show Cursor Diagnostic" },
  l = {
    name = "Diagnostic",
    d = { "Show Line Diagnostic" },
  },
  e = { "<cmd>Telescope buffers<CR>", "Show Buffers" },
  ["="] = format,
}

wk.register(mapping, { prefix = "<leader>" })
wk.register(localMapping, { prefix = "<localleader>" })

wk.setup {
  icons = {
    breadcrumb = "??", -- symbol used in the command line area that shows your active key combo
    separator = "???", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  triggers = { "<leader>", "<localleader>" }, -- automatically setup triggers
}
