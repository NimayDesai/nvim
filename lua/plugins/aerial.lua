-- Aerial.nvim plugin configuration
-- Provides a code outline window that displays symbols/structure of the current file
return {
  'stevearc/aerial.nvim',
  lazy = true,
  opts = {
    -- Automatically close the aerial window when these events occur
    close_automatic_events = {
      "unfocus",            -- Close when aerial window loses focus
      "switch_buffer"       -- Close when switching to a different buffer
    }
  },
  -- Required dependencies for aerial.nvim to function properly
  dependencies = {
    "nvim-treesitter/nvim-treesitter",     -- Provides syntax tree parsing for symbol detection
    "nvim-tree/nvim-web-devicons"          -- Provides file type icons in the outline
  },
}
