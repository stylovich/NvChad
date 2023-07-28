---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"
M.ui = {
  theme = "github_light",
  theme_toggle = { "everforest", "github_light" },
  transparency = false,
  lsp_semantic_tokens = true,
  nvdash = { load_on_startup = false },
  hl_override = highlights.override,
  hl_add = highlights.add,
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    lsprogress_len = 15,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
