local M = {}

vim.g.VM_maps = {
  ["Find Under"] = "<C-d>", -- like ctrl+d in vscode
  ["Find Subword Under"] = "<C-d>", -- like ctrl+d in vscode
  ["Select All"] = "<leader>da", -- select all similar words
}

local map = vim.api.nvim_set_keymap

-- Move (Normal/Visual)
map( "n", "<A-Left>", "<Plug>GoNSMLeft", {} )
map( "n", "<A-Down>", "<Plug>GoNSMDown", {} )
map( "n", "<A-Up>", "<Plug>GoNSMUp", {} )
map( "n", "<A-Right>", "<Plug>GoNSMRight", {} )

map( "x", "<A-Left>", "<Plug>GoVSMLeft", {} )
map( "x", "<A-Down>", "<Plug>GoVSMDown", {} )
map( "x", "<A-Up>", "<Plug>GoVSMUp", {} )
map( "x", "<A-Right>", "<Plug>GoVSMRight", {} )

-- Duplicate (Normal/Visual)
map( "n", "<C-Left>", "<Plug>GoNSDLeft", {} )
map( "n", "<C-Down>", "<Plug>GoNSDDown", {} )
map( "n", "<C-Up>", "<Plug>GoNSDUp", {} )
map( "n", "<C-Right>", "<Plug>GoNSDRight", {} )

map( "x", "<C-Left>", "<Plug>GoVSDLeft", {} )
map( "x", "<C-Down>", "<Plug>GoVSDDown", {} )
map( "x", "<C-Up>", "<Plug>GoVSDUp", {} )
map( "x", "<C-Right>", "<Plug>GoVSDRight", {} )

M.general = {
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

    ["<C-PageUp>"] = {
      "<cmd> bnext <CR>",
      "Next buffer",
      opts = { noremap = true, nowait = true, silent = true },
    },
    ["<C-PageDown>"] = {
      "<cmd> bprevious <CR>",
      "Next buffer",
      opts = { noremap = true, nowait = true, silent = true },
    },

    ["<leader>qw"] = {
      "<cmd> JABSOpen <CR>",
      "Open JABS Buffer Switcher",
      opts = { noremap = true, nowait = true, silent = true },
    },

    ["<C-a>"] = {
      "<cmd> CodeActionMenu <CR>",
      "Open Code Action Menu",
      opts = { noremap = true, nowait = true, silent = true },
    }

  },

  i = {
    ["jj"] = { "<ESC>", "escape", opts = { nowait = true } },
    ["jk"] = { "<ESC>", "escape", opts = { nowait = true } },

    -- delete right word using ctrl + delete (ctrl+supr)
    ["<C-Del>"] = { "<C-o>dw", "Delete right word", opts = { noremap = true, nowait = true } },
    -- delete left word using ctrl + backspace
    ["<C-H>"] = { "<C-w>", "Delete left word", opts = { noremap = true, nowait = true } },
    ["<C-BS>"] = { "<C-w>", "Delete left word", opts = { noremap = true, nowait = true } },

    ["<C-a>"] = {
      "<cmd> CodeActionMenu <CR>",
      "Open Code Action Menu",
      opts = { noremap = true, nowait = true, silent = true },
    }
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

return M
