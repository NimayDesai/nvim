return {
	"echasnovski/mini.comment",
	version = false,
	event = "VeryLazy",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- disable the autocommand from ts-context-commentstring
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})

		require("mini.comment").setup({
			-- tsx, jsx, html , svelte comment support
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring({
						key = "commentstring",
					}) or vim.bo.commentstring
				end,
			},
		})
	end,
}
