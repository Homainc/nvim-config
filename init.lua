-- disable netrw in prior to nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

vim.g.python3_host_prog = "/Users/pilkha/.pyenv/versions/nvim-env/bin/python"

-- Mappings
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { noremap = true })
vim.keymap.set("n", "<leader>D", vim.lsp.buf.declaration, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>i", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fu", vim.lsp.buf.references, { noremap = true, silent = true })

-- Options
vim.opt.number = true
vim.wo.relativenumber = true
vim.opt.expandtab = true
vim.opt.signcolumn = "yes:1"
vim.opt.shiftwidth = 4
vim.opt.colorcolumn = "79"
vim.cmd.colorscheme("catppuccin-mocha") --"catppuccin-macchiato"
vim.diagnostic.config({
	update_in_insert = true,
})
vim.opt.diffopt:append("vertical")
vim.opt.diffopt:append("context:9999")

-- Folding
-- Cheatsheet: https://gist.github.com/lestoni/8c74da455cce3d36eb68
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" --  treesitter as source of truth for folding
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99 -- sets the minimum level of a fold that will be closed by default
-- vim.opt.foldlevelstart = 1 -- dicate upon editing a buffer what level of folds should be open by default vs closed
vim.opt.foldnestmax = 4 -- This limits how deeply code gets folded
