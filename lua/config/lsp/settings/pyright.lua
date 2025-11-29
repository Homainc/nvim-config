local config = {
	settings = {
		pyright = {
			analysis = {
				ignore = { "*" },
				typeCheckingMode = "off",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
			disableLanguageServices = false,
		},
	},
}
return config
