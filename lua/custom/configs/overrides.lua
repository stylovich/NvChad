local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "c",
    "markdown",
    "markdown_inline",
    "go",
    "python",
  },
  indent = {
    enable = true,
    disable = {
      "python",
    },
  },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- shell dev
    "shfmt",
    "shellcheck",
    "bash-language-server",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",

    -- ansiblel
    "ansible-language-server",

    -- formatting
    "prettierd",
    "eslint-lsp",
    "eslint_d",
    "fixjson",
    "write-good",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.todo_comments = {
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
}

return M
