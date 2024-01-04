require("nvim-autopairs").setup()

local ok, cmp_auto_pairs = pcall(require, "nvim-autopairs.completion.cmp")
local cmpOk, cmp = pcall(require, "cmp")
if ok and cmpOk then
  cmp.event:on("confirm_done", cmp_auto_pairs.on_confirm_done())
end
