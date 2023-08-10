local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

local servers = { "eslint", "tsserver", "vimls", "html", "jsonls", "pyright", "sqlls", "stylelint_lsp" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
--   root_dir = function() return vim.loop.cwd() end,
--   settings = { documentFormatting = false }
-- }

lspconfig.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    eslint = {
      workingDirectories = { { mode = "auto" } },
    },
  },
}

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config {
  virtual_text = false,
  virtual_lines = false, -- instead use ctrl+x in line to get diagnostic
}
