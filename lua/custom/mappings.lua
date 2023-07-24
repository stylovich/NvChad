local M = {}

vim.g.VM_maps = {
  ["Find Under"] = "<C-d>", -- like ctrl+d in vscode
  ["Find Subword Under"] = "<C-d>", -- like ctrl+d in vscode
  ["Select All"] = "<leader>da", -- select all similar words
}

M.general = {
  n = {
    ["<C-b><C-b>"] = {
      "<Esc> :y1 <CR>p",
      "Duplicate current line",
      opts = { noremap = true, nowait = true, silent = true },
    },
    ["<A-Up>"] = {
      "<Esc>:m .-2<CR>",
      opts = { noremap = true, nowait = true, silent = true },
      "Move current line up",
    },
    ["<A-Down>"] = {
      "<Esc>:m .+1<CR>",
      "Move current line down",
      opts = { noremap = true, nowait = true, silent = true },
    },
    ["<leader>gl"] = {
      "<cmd> Gitsigns toggle_current_line_blame <CR>",
      "Show current line Git commit information",
      opts = { noremap = true, nowait = true, silent = true },
    },
  },

  i = {
    ["jj"] = { "<ESC>", "escape", opts = { nowait = true } },
    ["jk"] = { "<ESC>", "escape", opts = { nowait = true } },
    ["<C-b><C-b>"] = {
      "<Esc> :y1 <CR>p",
      "Duplicate current line",
      opts = { noremap = true, nowait = true, silent = true },
    },
    -- delete right word using ctrl + delete (ctrl+supr)
    ["<C-Del>"] = { "<C-o>dw", "Delete right word", opts = { noremap = true, nowait = true } },
    -- delete left word using ctrl + backspace
    ["<C-H>"] = { "<C-w>", "Delete left word", opts = { noremap = true, nowait = true } },
    ["<C-BS>"] = { "<C-w>", "Delete left word", opts = { noremap = true, nowait = true } },
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
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format()
      end,
      "   lsp formatting",
    },
    ["<leader>of"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },
  },
}
M.tabufline = {
  plugin = true,
  n = {
    ["<leader><tab>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
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
      "<cmd> Copilot<CR>",
      "Copilot",
      opts = { noremap = true, nowait = true, silent = true },
    },
    ["<leader>cd"] = {
      "<cmd> Copilot disable<CR>",
      "Copilot disable", --
      opts = { noremap = true, nowait = true, silent = true },
    },
    ["<leader>ce"] = {
      "<cmd> Copilot enable<CR>",
      "Copilot enable",
      opts = { noremap = true, nowait = true, silent = true },
    },
  },
}

return M
