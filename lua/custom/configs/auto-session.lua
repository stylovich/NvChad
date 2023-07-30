require("auto-session").setup {
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  cwd_change_handling = {
    restore_upcoming_session = true,
  },
}
