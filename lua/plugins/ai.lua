return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = function()
			local user = vim.env.USER or "User"
			user = user:sub(1, 1):upper() .. user:sub(2)
			return {
				window = {
					width = 0.2,
				},
				auto_insert_mode = true,
				question_header = "  " .. user .. " ",
				answer_header = "  Copilot ",
			}
		end,
		config = function(_, opts)
			require("CopilotChat").setup(opts)

			-- CopilotChat.nvim keymaps using <leader>a as base
			local keymap = vim.keymap.set

			-- Quick chat commands
			keymap("n", "<leader>aa", "<CMD>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })

			-- Code assistance (requires visual selection)
			keymap("v", "<leader>ae", "<CMD>CopilotChatExplain<CR>", { desc = "Explain selected code" })
			keymap("v", "<leader>ar", "<CMD>CopilotChatReview<CR>", { desc = "Review selected code" })
			keymap("v", "<leader>af", "<CMD>CopilotChatFix<CR>", { desc = "Fix selected code" })
			keymap("v", "<leader>ao", "<CMD>CopilotChatOptimize<CR>", { desc = "Optimize selected code" })
			keymap("v", "<leader>ad", "<CMD>CopilotChatDocs<CR>", { desc = "Add documentation to code" })
			keymap("v", "<leader>aq", "<CMD>CopilotChatTests<CR>", { desc = "Generate tests for code" })

			-- Debugging and utilities
			keymap("n", "<leader>ai", "<CMD>CopilotChatFixDiagnostic<CR>", { desc = "Fix diagnostic issue" })
			keymap("n", "<leader>ab", "<CMD>CopilotChatCommit<CR>", { desc = "Write commit message" })
			keymap("n", "<leader>ag", "<CMD>CopilotChatCommitStaged<CR>", { desc = "Write commit for staged changes" })

			-- File operations
			keymap("n", "<leader>al", "<CMD>CopilotChatLoad<CR>", { desc = "Load chat from file" })
			keymap("n", "<leader>as", "<CMD>CopilotChatSave<CR>", { desc = "Save chat to file" })

			-- Custom prompt with buffer context
			keymap("n", "<leader>ap", function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
				end
			end, { desc = "Quick chat prompt with buffer context" })

			-- Custom prompt with visual selection
			keymap("v", "<leader>ap", function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
				end
			end, { desc = "Quick chat prompt with selection" })

			-- Model selection
			keymap("n", "<leader>am", "<CMD>CopilotChatModels<CR>", { desc = "Select Copilot model" })

			-- Agents
			keymap("n", "<leader>an", "<CMD>CopilotChatAgents<CR>", { desc = "Select Copilot agent" })
		end,
	},
}
