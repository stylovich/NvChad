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
    "tsx",
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
  view = {
    side = "left",
     width = 37,
  },
  git = {
    enable = true,
    ignore = false,
  },
  renderer = {
    highlight_git = true,
    highlight_opened_files = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  filters = {
    dotfiles = false,
  },
}

return M
