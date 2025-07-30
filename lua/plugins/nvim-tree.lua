return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
	"nvim-tree/nvim-web-devicons",
    },
    opts = {
        hijack_cursor = true,
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
            highlight_diagnostics = 'all',
        },
        filters = {
            dotfiles = true,
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            severity = {
                min = vim.diagnostic.severity.ERROR,
                max = vim.diagnostic.severity.ERROR,
            },
        }
    },
}
