return {
	"ThePrimeagen/git-worktree.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},

	keys = {
		{
			"<leader>gw",
			function()
				require("telescope").extensions.git_worktree.git_worktrees()
			end,
			desc = "List Git Worktrees",
		},
		{
			"<leader>gb",
			function()
				require("telescope").extensions.git_worktree.create_git_worktree()
			end,
			desc = "Create Git Worktree Branches",
		},
	},

	config = function()
		local gitworktree = require("git-worktree")

		gitworktree.setup()

		require("telescope").load_extension("git_worktree")
	end,
}
