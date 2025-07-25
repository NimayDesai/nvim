return {
  "echasnovski/mini.splitjoin",
  event = { "BufReadPre", "BufNewFile" },
  version = false,
  config = function()
    require("mini.splitjoin").setup({
      mappings = { toggle = "" },
    })

    vim.keymap.set({ "n", "x" }, "sj", function() require("mini.splitjoin").join()end, { desc = "Join lines" })

    vim.keymap.set({"n", "x"}, "sk", function() require("mini.splitjoin").split()end, { desc = "Split lines" })
  end
}
