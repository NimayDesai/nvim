return {
	"echasnovski/mini.splitjoin",
	event = { "BufReadPre", "BufNewFile" },
	version = false,
	keys = {
		{
			"sj",
			function()
				require("mini.splitjoin").join()
			end,
			mode = { "n", "x" },
			desc = "Join lines",
		},
		{
			"sk",
			function()
				require("mini.splitjoin").split()
			end,
			mode = { "n", "x" },
			desc = "Split lines",
		},
	},
	opts = {
		mappings = { toggle = "" },
	},
}
