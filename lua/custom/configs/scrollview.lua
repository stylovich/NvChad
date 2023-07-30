require("scrollview").setup {
  excluded_filetypes = { "nerdtree" },
  current_only = true,
  winblend = 1,
  base = "buffer",
  column = 240,
  signs_on_startup = { "all" },
  diagnostics_severities = { vim.diagnostic.severity.ERROR },
}
