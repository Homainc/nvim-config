return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format" },
			html = { "prettier" },
			typescript = { "prettier" },
			javascript = { "prettier" },
			yaml = { "prettier" },
			json = { "prettier" },
			xml = { "prettier" },
			css = { "prettier" },
			markdown = { "prettier" },
			cs = { "csharpier" },
			csproj = { "csharpier" },
		},
		format_on_save = {},
	},
}
