return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		default_file_explorer = true,
		delete_to_trash = true,
		view_options = {
			show_hidden = true,
		},
		skip_confirm_for_simple_edits = true,
	},
	keys = { { "<leader>o", "<CMD>Oil<CR>", desc = "Open Oil" } },

	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
}
