return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-omni",
    { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
  },
  config = function()
    local cmp = require('cmp')
    require('cmp').setup({
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'cmp_r' },
        { name = 'path' },
        { name = 'buffer' },
        { name = "render-markdown" },
        { name = "omni" },
      }),
      completion = {
        -- autocomplete = false,
        keyword_length = 3
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      -- `/` cmdline setup.
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      }),
      -- `:` cmdline setup.
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        ---@diagnostic disable-next-line: missing-fields
        matching = { disallow_symbol_nonprefix_matching = false }
      }),
      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-j>'] = function(fallback)
          if cmp.visible_docs() then
            cmp.scroll_docs(-4)
          else
            fallback()
          end
        end,
        ['<C-k>'] = function(fallback)
          if cmp.visible_docs() then
            cmp.scroll_docs(4)
          else
            fallback()
          end
        end,
        ['<CR>'] = function(fallback)
          if cmp.visible() then
            cmp.confirm()
          else
            fallback()
          end
        end,
        ['<Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
        ['<S-Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
        ['<Esc>'] = function(fallback)
          if cmp.visible() then
            cmp.abort()
          else
            fallback()
          end
        end,
      }),
      ---@diagnostic disable-next-line: missing-fields
      formatting = {
        format = require('lspkind').cmp_format({
          mode = 'symbol',
          maxwidth = {
            menu = 50,
            abbr = 50,
          },
          ellipsis_char = "...",
          show_labelDetails = true,
        })
      },
      experimental = {
        ghost_text = { hl_group = "NonText" },
      }
    })
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require('lspconfig')
    lspconfig['lua_ls'].setup {
      capabilities = capabilities
    }
    lspconfig['r_language_server'].setup {
      capabilities = capabilities
    }
    lspconfig['bashls'].setup {
      capabilities = capabilities
    }
  end
}
