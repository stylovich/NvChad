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
    event = "InsertEnter",
    cmd = "Copilot",
    config = function()
      require("copilot").setup(overrides.copilot)
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
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
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      config = function()
        require("Comment").setup {
          pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        }
      end,
    },
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
      require("hlchunk").setup {
        blank = {
          enable = false,
        },
      }
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

  {
    "dstein64/nvim-scrollview",
    lazy = false,
    config = function()
      require("scrollview").setup {
        excluded_filetypes = { "nerdtree" },
        current_only = true,
        winblend = 1,
        base = "buffer",
        column = 240,
        signs_on_startup = { "all" },
        diagnostics_severities = { vim.diagnostic.severity.ERROR },
      }
    end,
  },

  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
    config = function()
      require("lightspeed").setup {
        ignore_case = false,
        exit_after_idle_msecs = { unlabeled = nil, labeled = nil },
        --- s/x ---
        jump_to_unique_chars = { safety_timeout = 400 },
        match_only_the_start_of_same_char_seqs = true,
        force_beacons_into_match_width = false,
        -- Display characters in a custom way in the highlighted matches.
        substitute_chars = { ["\r"] = "¬" },

        -- These keys are captured directly by the plugin at runtime.
        special_keys = {
          next_match_group = "<space>",
          prev_match_group = "<tab>",
        },
        --- f/t ---
        limit_ft_matches = 4,
        repeat_ft_with_target_char = false,
      }
    end,
  },
}

return plugins
