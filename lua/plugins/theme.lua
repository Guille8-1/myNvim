config = function()
  vim.cmd.colorscheme("tokyonight-moon")
  require("config.transparency")
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        integrations = {
          lualine = true,
          treesitter = true,
          mason = true,
          telescope = true,
        },
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
  },

  {
    "LazyVim/LazyVim",
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
