-- Set the leader key to space for custom key mappings
vim.g.mapleader = " "
-- Enable emoji support in Neovim
vim.o.emoji = true

-- Display line numbers in the gutter
vim.o.nu = true
-- Show relative line numbers (distance from current line)
vim.o.relativenumber = true

-- Indentation settings: use 2 spaces for all indentation
-- Number of spaces a tab character represents
vim.o.tabstop = 2
-- Number of spaces used for each step of (auto)indent
vim.o.shiftwidth = 2
-- Number of spaces a tab counts for while editing
vim.o.softtabstop = 2

-- Convert tabs to spaces
vim.o.expandtab = true
-- Automatically indent new lines to match the previous line
vim.o.autoindent = true
-- Smart autoindenting for C-like languages
vim.o.smartindent = true
-- Enable line wrapping for long lines
vim.o.wrap = true

-- File handling and backup settings
-- Disable swap files (temporary files created during editing)
vim.o.swapfile = false
-- Disable backup files
vim.o.backup = false
-- Set directory for persistent undo files
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- Enable persistent undo (undo history survives file close/reopen)
vim.o.undofile = true

-- Search settings
-- Show search matches as you type (incremental search)
vim.opt.incsearch = true
-- Show live preview of substitute commands in a split window
vim.opt.inccommand = "split"
-- Color and appearance settings
-- Enable 24-bit RGB colors in the terminal
vim.opt.termguicolors = true
-- Set background to dark for proper color scheme display
vim.opt.background = "dark"

-- Always show the sign column (for git signs, diagnostics, etc.)
vim.opt.signcolumn = "yes"

-- Use system clipboard for yank/paste operations
vim.opt.clipboard:append("unnamedplus")
-- Highlight search results
vim.opt.hlsearch = true

-- Enable mouse support in all modes
vim.opt.mouse = "a"

-- Enable EditorConfig support for consistent coding styles across editors
vim.g.editorconfig = true
