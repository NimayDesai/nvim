return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		spec = {
			mode = { "n", "v" },
			{ "<leader>a", group = "ai" },
			{ "<leader>b", group = "buffer" },
			{ "<leader>c", group = "code" },
			{ "<leader>e", group = "explorer" },
			{ "<leader>f", group = "file/find" },
			{ "<leader>g", group = "git" },
			{ "<leader>h", group = "harpoon" },
			{ "<leader>x", group = "diagnostics" },
			{ "z", group = "fold" },
			{ "s", group = "splitjoin" },
		},
	},
}
