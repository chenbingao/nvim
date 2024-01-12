require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt" },
    ocaml = { "ocamlformat" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    dart = { "dart_format" },
    proto = { "buf" },
    javascript = { { "prettierd", "prettier" } },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}