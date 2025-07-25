return {
	"echasnovski/mini.trailspace",
	version = false,
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		only_in_normal_buffers = true,
	},
	keys = {
		{
			"<leader>cw",
			function()
				require("mini.trailspace").trim()
			end,
			desc = "Erase Whitespace",
		},
	},
}
