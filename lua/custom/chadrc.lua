---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"
M.ui = {
  theme = "onenord",
  theme_toggle = { "onenord", "github_light" },
  transparency = false,
  lsp_semantic_tokens = true,
  hl_override = highlights.override,
  hl_add = highlights.add,
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    lsprogress_len = 15,
  },
}

-- M.plugins = "custom.plugins"
M.plugins = "custom.plugins-light"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
