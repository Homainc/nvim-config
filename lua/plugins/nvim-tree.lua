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
		},
		git = {
			enable = true,
			ignore = false,
		},
		renderer = {
			highlight_git = true,
			group_empty = true,
			highlight_diagnostics = "all",
			icons = {
				show = {
					git = false,
				},
				glyphs = {
					git = {
						unstaged = "",
						staged = "",
						unmerged = "",
						renamed = "",
						untracked = "󰐕",
						deleted = "",
						ignored = "",
					},
				},
			},
		},
	},
}
