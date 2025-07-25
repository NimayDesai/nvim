return {
	"tpope/vim-fugitive", -- Plugin for Git integration in Vim
	config = function()
		-- Map <leader>gg to open the Git command interface in Vim
		vim.keymap.set("n", "<leader>gg", vim.cmd.Git, { desc = "Open Fugitive Git interface" })

		-- Create a new augroup for fugitive-specific auto commands
		local myFugitive = vim.api.nvim_create_augroup("myFugitive", {})

		-- Create a new auto command
		local autocmd = vim.api.nvim_create_autocmd
		autocmd("BufWinEnter", {
			group = myFugitive, -- Apply this auto command to the "myFugitive" group
			pattern = "*", -- Trigger this for any buffer
			callback = function()
				-- Ensure that the filetype is "fugitive" before setting keymaps
				if vim.bo.ft ~= "fugitive" then
					return
				end

				-- Get the current buffer number
				local bufnr = vim.api.nvim_get_current_buf()
				-- Set options to avoid remapping keys for the current buffer
				local opts = { buffer = bufnr, remap = false }

				-- Map <leader>gP to 'Git push' command for the current buffer
				vim.keymap.set("n", "<leader>gP", function()
					vim.cmd.Git("push")
				end, { buffer = bufnr, remap = false, desc = "Push changes to remote repository" })

				-- Map <leader>gp to 'Git pull --rebase' command to always rebase on pull
				vim.keymap.set("n", "<leader>gp", function()
					vim.cmd.Git({ "pull", "--rebase" })
				end, { buffer = bufnr, remap = false, desc = "Pull changes with rebase" })

				-- Map <leader>gt to a command that allows you to set up an upstream branch for a Git repository
				vim.keymap.set(
					"n",
					"<leader>gt",
					":Git push -u origin ",
					{ buffer = bufnr, remap = false, desc = "Set upstream branch and push" }
				)
			end,
		})
	end,
}
