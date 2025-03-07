local M = {}

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local flags = require("plugins.configs.lspconfig").flags
local handlers = require("plugins.configs.lspconfig").handlers
local extension_path = vim.fn.stdpath "data" .. "/dapinstall/codelldb/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

function M.setup()
  local opts = {
    server = {
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
    },

    -- tools = {
    --   autoSetHints = true,
    --   executor = require("rust-tools/executors").termopen,
    --   runnables = {
    --     use_telescope = true,
    --   },
    --   inlay_hints = {
    --     show_parameter_hints = true,
    --     parameter_hints_prefix = "<- ",
    --     other_hints_prefix = "=> ",
    --     max_len_align = false,
    --     max_len_align_padding = 1,
    --     right_align = false,
    --     right_align_padding = 7,
    --   },
    --   hover_actions = {
    --     border = "single",
    --     auto_focus = false,
    --   },
    -- },
    -- dap = {
    --   -- adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    --   adapter = require("rust-tools.dap").get_codelldb_adapter("/usr/bin/lldb-vscode")
    -- },
  }
  require("rust-tools").setup(opts)
end

return M
