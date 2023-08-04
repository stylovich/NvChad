require("copilot").setup {
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
    ini = true,
    dot = true,
  },
  copilot_node_command = "node", -- Node.js version must be > 16.x
  server_opts_overrides = {},
}
