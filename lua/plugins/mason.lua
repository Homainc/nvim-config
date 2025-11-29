return {
	{
		"Hoffs/omnisharp-extended-lsp.nvim",
	},
	{
		"mason-org/mason.nvim",
		version = "^1.0.0",
		lazy = false,
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		version = "^1.0.0",
		lazy = false,
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
			"Hoffs/omnisharp-extended-lsp.nvim",
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"ruff",
				"pyright",
				"angularls",
				"typescript-language-server",
				"prettier",
				"clangd",
				"stylua",
				"omnisharp",
				"csharpier",
			},
		},
		config = function(_, opts)
			require("mason").setup()
			require("mason-lspconfig").setup(opts)

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities =
				vim.tbl_deep_extend("force", capabilities, require("lsp-file-operations").default_capabilities())

			local servers = require("config.lsp.servers").to_setup
			for _, server in pairs(servers) do
				local server_opts = {
					capabilities = capabilities,
				}

				local has_opts, custom_server_opts = pcall(require, "config.lsp.settings." .. server)
				if has_opts then
					server_opts = vim.tbl_deep_extend("force", server_opts, custom_server_opts)
				end

				vim.lsp.config(server, server_opts)
				vim.lsp.enable(server)
			end
		end,
	},
}
