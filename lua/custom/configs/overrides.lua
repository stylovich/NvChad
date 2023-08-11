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
    "ini",
    "dot",
    "rust",
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
    -- lua
    "lua-language-server",
    "stylua",

    -- python
    "black",

    -- shell dev
    "shfmt",
    "shellcheck",
    "bash-language-server",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",

    -- rust
    "rust-analyzer",

    -- sql
    "sqlfluff",

    -- formatting
    "prettierd",
    "eslint-lsp",
    "eslint_d",
    "fixjson",
    "write-good",
    "xmlformatter",
    "stylelint",
    "markdownlint"
  },
}

-- git support in nvimtree
M.nvimtree = {
  view = {
    side = "left",
    width = 35,
  },
  git = {
    enable = true,
    ignore = false,
  },
  renderer = {
    highlight_git = true,
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
