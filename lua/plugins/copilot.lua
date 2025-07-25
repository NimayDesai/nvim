return {
  "zbirenbaum/copilot.lua",
  event = "BufReadPost",
  build = ":Copilot auth",
  cmd = "Copilot",
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false }
  }
}
