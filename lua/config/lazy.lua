-- Bootstrap lazy.nvim plugin manager
-- This section ensures lazy.nvim is installed and available
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Check if lazy.nvim is already installed, if not, clone it from GitHub
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    -- Clone lazy.nvim with minimal history (--filter=blob:none) from stable branch
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    -- Handle clone failure with error message and exit
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
-- Add lazy.nvim to the runtime path so it can be required
vim.opt.rtp:prepend(lazypath)

-- Load Neovim options and settings BEFORE setting up lazy.nvim
-- This ensures leader keys and other settings are configured properly
-- before any plugins that might depend on them are loaded
require("config.options")
require("config.keymaps")

-- Initialize lazy.nvim with plugin specifications and configuration
require("lazy").setup({
    spec = {
        -- Import all plugin configurations from the plugins/ directory
        -- Each .lua file in plugins/ will be loaded as a plugin specification
        { import = "plugins" },
    },
    -- Configuration options for lazy.nvim behavior
    -- Set the default colorscheme to use during plugin installation
    install = { colorscheme = { "nord" } },
    -- Enable automatic checking for plugin updates
    checker = { enabled = true },
})
