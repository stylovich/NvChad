local M = {}
local map = vim.api.nvim_set_keymap

vim.g.VM_maps = {
  ["Find Under"] = "<C-d>", -- like ctrl+d in vscode
  ["Find Subword Under"] = "<C-d>", -- like ctrl+d in vscode
  ["Select All"] = "<leader>da", -- select all similar words
}

-- Move (Normal/Visual)
map("n", "<A-Left>", "<Plug>GoNSMLeft", {})
map("n", "<A-Down>", "<Plug>GoNSMDown", {})
map("n", "<A-Up>", "<Plug>GoNSMUp", {})
map("n", "<A-Right>", "<Plug>GoNSMRight", {})

map("x", "<A-Left>", "<Plug>GoVSMLeft", {})
map("x", "<A-Down>", "<Plug>GoVSMDown", {})
map("x", "<A-Up>", "<Plug>GoVSMUp", {})
map("x", "<A-Right>", "<Plug>GoVSMRight", {})

-- Duplicate (Normal/Visual)
-- map("n", "<C-Left>", "<Plug>GoNSDLeft", {})
map("n", "<C-Down>", "<Plug>GoNSDDown", {})
map("n", "<C-Up>", "<Plug>GoNSDUp", {})
-- map("n", "<C-Right>", "<Plug>GoNSDRight", {})
-- map("x", "<C-Left>", "<Plug>GoVSDLeft", {})
map("x", "<C-Down>", "<Plug>GoVSDDown", {})
map("x", "<C-Up>", "<Plug>GoVSDUp", {})
-- map("x", "<C-Right>", "<Plug>GoVSDRight", {})

M.general = {
  x = {
    ["aa"] = {
      "<cmd> lua require'align'.align_to_string(false, true, true) <CR>",
      "Aligns to a string, looking left and with previews",
      opts = { noremap = true, nowait = true, silent = true },
    },
    ["ar"] = {
      "<cmd> lua require'align'.align_to_string(true, true, true) <CR>",
      "Aligns to a Lua pattern, looking left and with previews",
      opts = { noremap = true, nowait = true, silent = true },
    },
  },

  n = {
    ["<leader>gl"] = {
      "<cmd> Gitsigns toggle_current_line_blame <CR>",
      "Show current line Git commit information",
      opts = { noremap = true, nowait = true, silent = true },
    },

    ["<leader>qq"] = {
      "<cmd> q <CR>",
      "Quit current window",
      opts = { noremap = true, nowait = true, silent = true },
    },
    ["<leader>qa"] = {
      "<cmd> qa! <CR>",
      "Force quit all windows",
      opts = { noremap = true, nowait = true, silent = true },
    },

    ["<leader>u"] = {
      "<cmd> Telescope undo <CR>",
      "Open Telescope undo",
      opts = { noremap = true, nowait = true, silent = true },
    },

    ["<C-a>"] = {
      "<cmd> CodeActionMenu <CR>",
      "Open Code Action Menu",
      opts = { noremap = true, nowait = true, silent = true },
    },

    -- MARKS
    ["<leader>ml"] = {
      "<cmd> MarksListAll <CR>",
      "List all marks",
      opts = { noremap = true, nowait = true, silent = true },
    },
    ["<C-m>"] = {
      "<cmd> MarksListAll <CR>",
      "List all marks",
      opts = { noremap = true, nowait = true, silent = true },
    },
    ["<leader>mb"] = {
      "<cmd> MarksListBuf <CR>",
      "List buffer marks",
      opts = { noremap = true, nowait = true, silent = true },
    },
    ["<leader>mt"] = {
      "<cmd> MarksToggleSigns <CR>",
      "Toggle marks signs",
      opts = { noremap = true, nowait = true, silent = true },
    },

    -- SPECTRE
    ["<leader>rs"] = {
      "<cmd> Spectre <CR>",
      "  Spectre search and replace",
      opts = { noremap = true, nowait = true, silent = true },
    },

    -- NEOCLIP
    ["<leader>cv"] = {
      "<cmd> Telescope neoclip <CR>",
      "  Neoclip paste",
      opts = { noremap = true, nowait = true, silent = true },
    },
  },

  i = {
    -- delete right word using ctrl + delete (ctrl+supr)
    ["<C-Del>"] = { "<C-o>dw", "Delete right word", opts = { noremap = true, nowait = true } },
    -- delete left word using ctrl + backspace
    ["<C-H>"] = { "<C-w>", "Delete left word", opts = { noremap = true, nowait = true } },
    ["<C-BS>"] = { "<C-w>", "Delete left word", opts = { noremap = true, nowait = true } },

    ["<C-a>"] = {
      "<cmd> CodeActionMenu <CR>",
      "Open Code Action Menu",
      opts = { noremap = true, nowait = true, silent = true },
    },
  },
}
M.telescope = {
  n = {
    ["<leader>re"] = { "<cmd> Telescope resume <CR>", "   resume show" },
    ["<leader>fs"] = { "<cmd> Telescope grep_string <CR>", "   grep_string" },
    ["<F2>"] = { "<cmd> Telescope lsp_document_symbols <CR>", "   list document symbols" },
  },
}
M.lspconfig = {
  n = {
    ["<C-f>"] = {
      function()
        vim.lsp.buf.format()
      end,
      "   lsp formatting",
    },
    ["<C-x>"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "  floating diagnostic",
    },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format()
      end,
      "   lsp formatting",
    },
    ["<leader>fd"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "  floating diagnostic",
    },
  },
  v = {
    ["<C-f>"] = {
      function()
        vim.lsp.buf.format()
      end,
      "   lsp formatting",
    },
    ["<C-x>"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "  floating diagnostic",
    },
  },
}
M.diffview = {
  n = {
    ["<leader>dh"] = {
      "<cmd> DiffviewFileHistory <CR>",
      "Show file history",
      opts = { noremap = true, nowait = true, silent = true },
    },
    ["<leader>do"] = {
      "<cmd> DiffviewOpen <CR>",
      "Open diff view",
      opts = { noremap = true, nowait = true, silent = true },
    },
    ["<leader>dc"] = {
      "<cmd> DiffviewClose <CR>",
      "Close diff view",
      opts = { noremap = true, nowait = true, silent = true },
    },
  },
}
M.copilot = {
  n = {
    ["<leader>cp"] = {
      "<cmd> Copilot panel<CR>",
      "Copilot Panel",
      opts = { noremap = true, nowait = true, silent = true },
    },
    ["<leader>cd"] = {
      "<cmd> Copilot disable<CR>",
      "Copilot disable", --
      opts = { noremap = true, nowait = true, silent = false },
    },
    ["<leader>ce"] = {
      "<cmd> Copilot enable<CR>",
      "Copilot enable",
      opts = { noremap = true, nowait = true, silent = false },
    },
  },
}
M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "  Toggle debuger breakpoint",
      opts = { noremap = true, nowait = true, silent = true },
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "  Open debuger scopes",
      opts = { noremap = true, nowait = true, silent = true },
    },
  },
}
M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").update_all_crates()
      end,
      "  Update all Crates",
      opts = { noremap = true, nowait = true, silent = true },
    },
  },
}
M.rust_tools = {
  n = {
    ["<leader>rca"] = {
      function()
        require("rust-tools").hover_actions.hover_actions()
      end,
      "  Show Hover Actions",
      opts = { noremap = true, nowait = true, silent = true },
    },
    ["<leader>rcg"] = {
      function()
        require("rust-tools").code_action_group.code_action_group()
      end,
      "  Show Code Action Group",
      opts = { noremap = true, nowait = true, silent = true },
    },
  },
}
return M
