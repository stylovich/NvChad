require("diffview").setup {
  diff_binaries = false, -- Show diffs for binaries
  wrapper = "horizontal", -- wrapper mode: 'horizontal' | 'vertical' | 'tab' | 'none'
  use_icons = true, -- Requires nvim-web-devicons
  colored = true, -- Highlight the changed parts of the lines.
  color_signs = true, -- Use the signs defined in your colorscheme
}
