-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable the Perl Provider
vim.g.loaded_perl_provider = 0

-- Set buffer window bar title to the file name
vim.opt.winbar = "%=%m %f"
