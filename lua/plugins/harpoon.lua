return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	keys = {
		{
			"<leader>ha",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Harpoon: Add file",
		},
		{
			"<leader>hl",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Harpoon: Toggle quick menu",
		},
		{
			"<leader>h1",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Harpoon: Navigate to file 1",
		},
		{
			"<leader>h2",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Harpoon: Navigate to file 2",
		},
		{
			"<leader>h3",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Harpoon: Navigate to file 3",
		},
		{
			"<leader>h4",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Harpoon: Navigate to file 4",
		},
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			global_settings = {
				save_on_toggle = true,
				save_on_change = true,
			},
		})
	end,
}
