local overrides = require "custom.configs.overrides"

local plugins = {
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        cwd_change_handling = {
          restore_upcoming_session = true,
        },
      }
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup(overrides.copilot)
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    lazy = false,
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        side = "left",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
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
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    init = require("core.utils").lazy_load "nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require "custom.configs.treesitter-context"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    init = require("core.utils").lazy_load "nvim-treesitter-textobjects",
    -- after = "nvim-treesitter/nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require "custom.configs.treesitter-textobjects"
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = require("custom.configs.gitsigns").gitsigns,
  },

  {
    "NvChad/nvim-colorizer.lua",
    enabled = false,
  },

  {
    "folke/which-key.nvim",
    enabled = true,
  },

  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    init = require("core.utils").lazy_load "lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  },

  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup {}
    end,
  },

  {
    "mg979/vim-visual-multi",
    lazy = false,
  },

  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    opts = overrides.todo_comments,
    config = function(_, opts)
      require("todo-comments").setup(opts)
    end,
  },

  {
    "sindrets/diffview.nvim",
    lazy = false,
    config = function()
      require("diffview").setup {
        diff_binaries = false, -- Show diffs for binaries
        wrapper = "vertical", -- wrapper mode: 'horizontal' | 'vertical' | 'tab' | 'none'
        use_icons = true, -- Requires nvim-web-devicons
        colored = true, -- Highlight the changed parts of the lines.
        color_signs = true, -- Use the signs defined in your colorscheme
      }
    end,
  },

  {
    "kevinhwang91/nvim-bqf",
    lazy = false,
  },
}

return plugins
