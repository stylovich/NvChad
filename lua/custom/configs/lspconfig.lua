local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local flags = require("plugins.configs.lspconfig").flags
local handlers = require("plugins.configs.lspconfig").handlers

local lspconfig = require "lspconfig"
local servers =
  { "eslint", "tsserver", "vimls", "html", "jsonls", "pyright", "rust_analyzer", "sqlls", "stylelint_lsp" }

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

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = flags,
  handlers = handlers,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
      },
      inlayHints = {
        closureReturnTypeHints = true,
        lifetimeElisionHints = {
          useParameterNames = true,
        },
        reborrowHints = true,
      },
    },
  },
}

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config {
  virtual_text = false,
  virtual_lines = false, -- instead use <leader>of in line to get diagnostic
}
