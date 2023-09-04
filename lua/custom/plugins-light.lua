local overrides = require "custom.configs.overrides"

local plugins = {

  {
    "rmagatti/auto-session", -- Auto save and restore sessions
    lazy = false,
    config = function()
      require "custom.configs.auto-session"
    end,
  },

  {
    "neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client
    config = function()
      require "plugins.configs.lspconfig"
      vim.diagnostic.config {
        virtual_text = false,
        virtual_lines = false, -- instead use ctrl+x in line to get diagnostic
      }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter", -- Treesitter configurations and abstraction layer for Neovim
    opts = overrides.treesitter,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring", -- Treesitter context aware commentstring
      config = function()
        require("Comment").setup {
          pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        }
      end,
    },
  },

  {
    "nvim-tree/nvim-tree.lua", -- File explorer
    opts = overrides.nvimtree,
  },

  {
    "dstein64/vim-startuptime", -- Measure startup time
    cmd = "StartupTime",
  },

  {
    "nvim-treesitter/nvim-treesitter-context", -- Treesitter context
    init = require("core.utils").lazy_load "nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require "custom.configs.treesitter-context"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects", -- Treesitter textobjects
    init = require("core.utils").lazy_load "nvim-treesitter-textobjects",
    -- after = "nvim-treesitter/nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require "custom.configs.treesitter-textobjects"
    end,
  },

  {
    "lewis6991/gitsigns.nvim", -- Git signs in the signs column
    opts = require("custom.configs.gitsigns").gitsigns,
  },

  {
    "NvChad/nvim-colorizer.lua", -- Colorizer for hex codes
    enabled = true,
  },

  {
    "folke/which-key.nvim", -- Keybindings helper which shows popup with possible keybindings
    enabled = true,
  },

  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- Show diagnostics in the sign columns
    init = require("core.utils").lazy_load "lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  },

  {
    "sindrets/diffview.nvim", -- Diffview for git diffs
    event = "BufRead",
    config = function()
      require "custom.configs.diffview"
    end,
  },

  {
    "dstein64/nvim-scrollview", -- Scrollbar in the sign column
    event = "BufRead",
    config = function()
      require "custom.configs.scrollview"
    end,
  },

  {
    "booperlv/nvim-gomove", -- Move/Duplicate lines and blocks of code around
    event = "BufRead",
    config = function()
      require "custom.configs.gomove"
    end,
  },

  {
    "karb94/neoscroll.nvim", -- Smooth scrolling in Neovim
    event = "BufRead",
    config = function()
      require "custom.configs.neoscroll"
    end,
  },

  {
    "max397574/better-escape.nvim", -- Better escape
    event = "InsertCharPre",
    config = function()
      require "custom.configs.better-escape"
    end,
  },

  {
    "AckslD/nvim-neoclip.lua", -- Clipboard manager
    after = "telescope.nvim",
    event = "BufRead",
    requires = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require "custom.configs.neoclip"
    end,
  },
}

return plugins
