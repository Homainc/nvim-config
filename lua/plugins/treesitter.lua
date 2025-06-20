return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        local cfg = require("nvim-treesitter.configs")
        cfg.setup {
            ensure_installed = {"lua", "python", "html", "vim", "markdown", "markdown_inline", "css", "angular", "yaml", "json", "nginx", "typescript", "bash", "comment", "dockerfile", "regex", "sql"},
            highlight = {
                enable = true,
            },
        }
    end,
}
