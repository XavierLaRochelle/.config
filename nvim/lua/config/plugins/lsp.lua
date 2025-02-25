return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },

    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup {}
      lspconfig.r_language_server.setup {}
      lspconfig.bashls.setup {}
      lspconfig.ltex.setup {
        filetypes = { "tex" },
      }
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end
          ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })

      vim.keymap.set(
        'n', 'gd', function() vim.lsp.buf.definition() end,
        { desc = 'Go to definition' }
      )
    end,
  },
}
