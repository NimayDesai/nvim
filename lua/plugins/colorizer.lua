return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    user_default_options = {
      tailwind = true
    },
    filetypes = { "html", "css", "javascript", "tyescript", "jsx", "tsx", "vue", "svelte" }
  },
}
