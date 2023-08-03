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
    "zbirenbaum/copilot.lua", -- AI-assisted code completion
    event = "InsertEnter",
    cmd = "Copilot",
    config = function()
      require "custom.configs.copilot"
    end,
  },

  {
    "zbirenbaum/copilot-cmp", -- Copilot suggestions for nvim-cmp
    event = "InsertEnter",
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim", -- Run linters and fixers against your code
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
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
    "williamboman/mason.nvim", -- Plugin manager
    opts = overrides.mason,
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
    enabled = false,
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
    "shellRaining/hlchunk.nvim", -- Highlight chunks of code based on indentation
    enabled = false,
    event = { "UIEnter" },
    config = function()
      require "custom.configs.hlchunk"
    end,
  },

  -- {
  --   "mg979/vim-visual-multi", -- Multiple cursors in visual mode
  --   lazy = false,
  -- },

  {
    "folke/todo-comments.nvim", -- Highlight TODO comments
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    opts = overrides.todo_comments,
    config = function()
      require "custom.configs.todo-comments"
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
    "kevinhwang91/nvim-bqf", -- Better quickfix window
    event = "BufRead",
  },

  {
    "dstein64/nvim-scrollview", -- Scrollbar in the sign column
    event = "BufRead",
    config = function()
      require "custom.configs.scrollview"
    end,
  },

  {
    "ggandor/lightspeed.nvim", -- Jump to any word in the buffer with few keystrokes
    event = "BufRead",
    config = function()
      require "custom.configs.lightspeed"
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
    "weilbith/nvim-code-action-menu", -- Code actions in a floating window
    cmd = "CodeActionMenu",
    event = "BufRead",
  },

  {
    "karb94/neoscroll.nvim", -- Smooth scrolling in Neovim
    event = "BufRead",
    config = function()
      require "custom.configs.neoscroll"
    end,
  },

  {
    "chentoast/marks.nvim", -- Marks in the sign column and jump to them
    event = "BufRead",
    config = function()
      require "custom.configs.marks"
    end,
  },

  {
    "max397574/better-escape.nvim", -- Better escape
    event = "InsertEnter",
    config = function()
      require "custom.configs.better-escape"
    end,
  },

  {
    "nvim-pack/nvim-spectre", -- Search and replace
    event = "BufRead",
    config = function()
      require "custom.configs.spectre"
    end,
  },

  {
    "Vonr/align.nvim",
    event = "BufRead",
  }
}

return plugins
