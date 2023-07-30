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
    "yaml",
    "json",
    "bash",
    "dockerfile",
    "toml",
    "tsx"
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
   context_commentstring = {
    enable = true,
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
    NOTE = { icon = "", color = "hint", alt = { "INFO" } },
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

M.copilot = {
  panel = {
    enabled = false,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>",
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4,
    },
  },
  suggestion = {
    enabled = false,
    auto_trigger = true,
    debounce = 75,
    always_show = false,
    keymap = {
      accept = "<A-CR>",
      accept_word = false,
      accept_line = false,
      next = "<A-l>",
      prev = "<A-h>",
      dismiss = "<A-k>",
    },
  },
  filetypes = {
    ["."] = false,
    markdown = true,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    typescript = true,
    typescriptreact = true,
    javascript = true,
    javascriptreact = true,
    rust = true,
    go = true,
    python = true,
    php = true,
    java = true,
    cpp = true,
    c = true,
    html = true,
    css = true,
    graphql = true,
    sh = true,
    fish = true,
    zsh = true,
    bash = true,
    dockerfile = true,
    ruby = true,
    vim = true,
    lua = true,
    vue = true,
    scss = true,
    less = true,
    stylus = true,
    json = true,
    jsonc = true,
    yaml = true,
    toml = true,
  },
  copilot_node_command = "node", -- Node.js version must be > 16.x
  server_opts_overrides = {},
}

M.scrollbar = {}

return M
