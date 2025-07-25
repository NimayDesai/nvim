return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				yaml = { "prettier" },
				graphql = { "prettier" },
				cpp = { "clang_format" },
				liquid = { "prettier" },
				markdown = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
			},

			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 1000,
				async = false,
			},
		})
	end,
}
