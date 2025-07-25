return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    view_options = {
      show_hidden = true,
    },
    skip_confirm_for_simple_edits = true
  },

  config = function(_, opts)
    require('oil').setup(opts)
    vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open Oil" })
  end,
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
}
