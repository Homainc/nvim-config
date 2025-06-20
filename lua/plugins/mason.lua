return {
   {
        "williamboman/mason.nvim",
        version = "^1.0.0",
        lazy = false,
        opts = {}
    },
    {
        "williamboman/mason-lspconfig.nvim",
        version = "^1.0.0",
        lazy = false,
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "lua_ls",
                "ruff",
                "pyright",
                "angularls",
                "typescript-language-server",
                "prettier",
                "clangd"
            },
        },
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig.lua_ls.setup{
                capabilities = capabilities,
            }
            lspconfig.ruff.setup{
                capabilities = capabilities,
            }
            lspconfig.pyright.setup{
                capabilities = capabilities,
                settings = {
                    pyright = {
                        analysis = {
                            ignore = {"*"},
                            typeCheckingMode = "off",
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                        },
                        disableLanguageServices = false,
                    },
                },
            }


            local ok, mason_registry = pcall(require, 'mason-registry')
            if not ok then
                vim.notify 'mason-registry could not be loaded'
                return
            end

            local angularls_path = mason_registry.get_package('angular-language-server'):get_install_path()
            local angularls_cmd = {
                'ngserver',
                '--stdio',
                '--tsProbeLocations',
                table.concat({
                    angularls_path,
                    vim.uv.cwd(),
                }, ','),
                '--ngProbeLocations',
                table.concat({
                    angularls_path .. '/node_modules/@angular/language-server',
                    vim.uv.cwd(),
                }, ','),
            }

            lspconfig.angularls.setup{
                capabilities = capabilities,
                cmd = angularls_cmd,
                on_new_config = function(new_config, _)
                    new_config.cmd = angularls_cmd
                end,
            }

            lspconfig.clangd.setup {
                capabilities = capabilities,
                filetypes = {
                    'c',
                    'cpp',
                    'objc',
                    'objcpp',
                    'cuda',
                },
            }

            local ok, util = pcall(require, 'lspconfig.util')
            if not ok then
                vim.notify 'lspconfig.util could not be loaded'
                return
            end
            lspconfig.ts_ls.setup {
                root_dir = util.root_pattern 'package.json',
                single_file_support = false,
                settings = {
                    diagnostics = {
                        ignoredCodes = { 80001 },
                    },
                    -- javascript = {
                    --     inlayHints = {
                    --         includeInlayEnumMemberValueHints = true,
                    --         includeInlayFunctionLikeReturnTypeHints = true,
                    --         includeInlayFunctionParameterTypeHints = true,
                    --         --- @type 'none' | 'literals' | 'all'
                    --         includeInlayParameterNameHints = 'all',
                    --         includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    --         includeInlayPropertyDeclarationTypeHints = true,
                    --         includeInlayVariableTypeHints = true,
                    --         includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                    --     },
                    -- },
                    -- typescript = {
                    --     inlayHints = {
                    --         includeInlayEnumMemberValueHints = true,
                    --         includeInlayFunctionLikeReturnTypeHints = true,
                    --         includeInlayFunctionParameterTypeHints = true,
                    --         --- @type 'none' | 'literals' | 'all'
                    --         includeInlayParameterNameHints = 'all',
                    --         includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    --         includeInlayPropertyDeclarationTypeHints = true,
                    --         includeInlayVariableTypeHints = true,
                    --         includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                    --     },
                    -- },
                },
                handlers = {
                    --- @param err? lsp.ResponseError
                    --- @param result? lsp.Location[]|lsp.LocationLink[]
                    --- @param context lsp.HandlerContext
                    --- @param config? table
                    ['workspace/executeCommand'] = function(err, result, context, config)
                        if context.params.command == '_typescript.goToSourceDefinition' then
                            require('gmr.configs.lsp.handlers').go_to_definition(
                                err,
                                result,
                                context,
                                config
                            )
                        end
                    end,
                },
            }
       end,
    },
}
