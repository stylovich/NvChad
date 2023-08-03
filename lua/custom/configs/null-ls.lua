local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local with_diagnostics_code = function(builtin)
  return builtin.with {
    diagnostics_format = "[#{c}] #{m} (#{s})",
  }
end

local b = null_ls.builtins

local sources = {
  -- formatting
  b.formatting.prettierd.with { extra_args = {
    "--stdin-filepath", "$FILENAME",
    "--config", "~/.config/prettier/.prettierrc",
    "--ignore-path", "~/.config/prettier/.prettierignore",
  } },
  b.formatting.shfmt.with { extra_args = { "-i", "4" } },
  b.formatting.fixjson,
  b.formatting.stylua,
  b.formatting.eslint_d,

  -- diagnostics
  with_diagnostics_code(b.diagnostics.write_good),
  with_diagnostics_code(b.diagnostics.eslint_d),
  with_diagnostics_code(b.diagnostics.shellcheck),
  with_diagnostics_code(b.diagnostics.markdownlint),

  -- code actions
  b.code_actions.gitsigns,
  b.code_actions.eslint_d,
  b.code_actions.gitrebase,
  b.code_actions.refactoring,

  -- hover
  b.hover.dictionary,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
  debug = false,
  debounce = 150,
  save_after_format = false,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      -- uncomment below if you want to autoformat on save
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   group = augroup,
      --   buffer = bufnr,
      --   callback = function()
      --     -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
      --     -- if vim.g.vim_version < 8 then
      --     if vim.version().minor < 8 then
      --       vim.lsp.buf.formatting_sync()
      --     else
      --       vim.lsp.buf.format { bufnr = bufnr }
      --     end
      --   end,
      -- })
    end
  end,
}
