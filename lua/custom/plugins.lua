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
    "github/copilot.vim",
    lazy = false,
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
    opts = {
      signs = true,
      sign_priority = 8,
      keywords = {
        FIX = { icon = " ", color = "#C34043", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { icon = " ", color = "info" },
        DONE = { icon = " ", color = "done", alt = { "COMPLETE" } },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "error", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      },
      merge_keywords = true, -- when true, custom keywords will be merged with the defaults
      highlight = {
        before = "", -- "fg" or "bg" or empty
        keyword = "wide", -- "fg", "bg", "wide" or empty.
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400, -- ignore lines longer than this
        exclude = {}, -- list of file types to exclude highlighting
      },
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#7FB4CA" },
        done = { "DiagnosticDone", "#00A600" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#C34043" },
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
      },
    },
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
