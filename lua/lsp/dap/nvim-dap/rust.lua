local extension_path = os.getenv "HOME"
  .. "/.local/share/nvim/mason/packages/codelldb/extension"
local codelldb_path = extension_path .. "/adapter/codelldb"
local liblldb_path = extension_path .. "/lldb/lib/liblldb.dylib"

return {
  adapter = require("rustaceanvim.config").get_codelldb_adapter(
    codelldb_path,
    liblldb_path
  ),
}
