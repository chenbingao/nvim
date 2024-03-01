local extension_path = "~/.local/share/nvim/mason/packages/codelldb/extension"
local codelldb_path = extension_path .. "/adapter/codelldb"
local liblldb_path = extension_path .. "/lldb/lib/liblldb.dylib"

return {
  adapter = require("rust-tools.dap").get_codelldb_adapter(
    codelldb_path,
    liblldb_path
  ),
}
