return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/neotest-python",
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        opts = {
            adapters = {
                ["neotest-python"] = {
                    dap = { justMyCode = true },
                },
            },
        },
    },
}
