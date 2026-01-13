return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" }, -- format before save
    config = function()
      require("conform").setup({
        -- Map filetypes to formatters
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
        },

        -- Auto format on save
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true, -- fallback to LSP if no formatter
        },
      })
    end,
  },
}
