return {
  "mbbill/undotree",
  lazy = true,
  config = function()
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "See undo history"})
  end
}
