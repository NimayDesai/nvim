return {
	"Saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"giuxtaposition/blink-cmp-copilot",
		"saghen/blink.compat",
		"roobert/tailwindcss-colorizer-cmp.nvim",
	},
	version = "1.*",

	event = "InsertEnter",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "default" },

		appearance = {
			nerd_font_variant = "normal",
			-- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
			kind_icons = {
				Copilot = "",
				Text = "󰉿",
				Method = "󰊕",
				Function = "󰊕",
				Constructor = "󰒓",

				Field = "󰜢",
				Variable = "󰆦",
				Property = "󰖷",

				Class = "󱡠",
				Interface = "󱡠",
				Struct = "󱡠",
				Module = "󰅩",

				Unit = "󰪚",
				Value = "󰦨",
				Enum = "󰦨",
				EnumMember = "󰦨",

				Keyword = "󰻾",
				Constant = "󰏿",

				Snippet = "󱄽",
				Color = "󰏘",
				File = "󰈔",
				Reference = "󰬲",
				Folder = "󰉋",
				Event = "󱐋",
				Operator = "󰪚",
				TypeParameter = "󰬛",
			},
		},

		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			documentation = { auto_show = true, auto_show_delay_ms = 200 },

			menu = {
				draw = {
					treesitter = { "lsp" },
				},
			},

			ghost_text = {
				enabled = true,
			},
		},

		sources = {

			default = { "lsp", "path", "snippets", "buffer", "copilot", "tailwindcmp" },
			providers = {

				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
					transform_items = function(_, items)
						local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
						local kind_idx = #CompletionItemKind + 1
						CompletionItemKind[kind_idx] = "Copilot"
						for _, item in ipairs(items) do
							item.kind = kind_idx
						end
						return items
					end,
				},
				tailwindcmp = {
					name = "tailwindcss-colorizer-cmp",
					module = "blink.compat.source",

					score_offset = -3,
				},
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
