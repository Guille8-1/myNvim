return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- builds parser after install
    config = function()
      local status_ok, configs = pcall(require, "nvim-treesitter.configs")
      if not status_ok then
        return
      end

      configs.setup({
        ensure_installed = { "lua", "typescript", "javascript", "html", "css", "json" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}

