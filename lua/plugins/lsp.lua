return {
  -- nvim-lspconfig must load first
  {
    "neovim/nvim-lspconfig",
  },

  -- Mason installer
  {
    "williamboman/mason.nvim",
    config = true,
  },

  -- Mason-LSPConfig bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      local mason_lsp = require("mason-lspconfig")
      local lspconfig = vim.lsp.config  -- <- Modern API, not require("lspconfig")

      local servers = { "lua_ls", "ts_ls", "html", "cssls", "jsonls" }

      mason_lsp.setup({ ensure_installed = servers })

      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if cmp_ok then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      for _, server_name in ipairs(servers) do
        local opts = {
          on_attach = on_attach,
          capabilities = capabilities,
        }

        if server_name == "lua_ls" then
          opts.settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          }
        end

        -- if lspconfig[server_name] then
        --   lspconfig[server_name].setup(opts)
        -- else
        --   vim.notify("[LSP] Server not found: " .. server_name, vim.log.levels.WARN)
        -- end
      end
    end,
  },
}

