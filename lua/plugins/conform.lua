return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
        python = {"ruff_format"},
        html = {"prettier"},
        typescript = {"prettier"},
    },
    format_on_save = {
    },
  },
}
