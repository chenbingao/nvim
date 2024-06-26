require("mason").setup {}
require("mason-lspconfig").setup {}

local lsp_config = require "lspconfig"

local servers = {
  lua_ls = require "lsp.languages.lua",
  clangd = require "lsp.languages.clangd",
  jsonls = require "lsp.languages.json",
  ocamllsp = require "lsp.languages.ocaml",
  hls = require "lsp.languages.haskell",
  dartls = require "lsp.languages.dartls",
  tsserver = require "lsp.languages.ts",
  rescriptls = require "lsp.languages.rescript",
}

for key, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    if config.on_setup then
      config.on_setup(lsp_config[key])
    end
  else
    lsp_config[key].setup {}
  end
end
