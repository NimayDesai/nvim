-- Nord colorscheme plugin configuration
-- Provides the Nord color scheme for a consistent, Arctic-inspired theme
return {
  "gbprod/nord.nvim",
  -- Load immediately on startup (don't lazy load)
  lazy = false,
  -- High priority ensures this loads before other plugins that might depend on colors
  priority = 1000,
  config = function()
    -- Initialize nord theme with default settings
    require("nord").setup({})
    -- Apply the nord colorscheme
    vim.cmd.colorscheme("nord")
  end,
}
