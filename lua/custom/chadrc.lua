---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "github_light",
  theme_toggle = { "bearded-arc", "github_light" },
  transparency = false,
  lsp_semantic_tokens = true,
  nvdash = { load_on_startup = false },
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    lsprogress_len = 15,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
