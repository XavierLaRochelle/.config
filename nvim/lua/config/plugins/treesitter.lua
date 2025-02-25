return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
          "r", "rnoweb", "yaml", "csv", "toml", "bash", "sql", "tmux",
        },
        auto_install = false,
        highlight = {
          enable = true,
          disable = function(lang, buf)
            if lang == 'latex' then
              return true
            end
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          }
        },
      }
      vim.keymap.set(
        'n', '<leader>Ti', '<cmd>:Inspect<CR>',
        { desc = "Inspect treesitter node under cursor " }
      )
      vim.keymap.set(
        'n', '<leader>Tt', '<cmd>:InspectTree<CR>',
        { desc = "Inspect treesitter tree for this file" }
      )
      vim.keymap.set('n', '<leader>Tn',
        function() print(vim.treesitter.get_node({ bufnr = 0 })) end,
        { desc = 'Get node at cursor' }
      )
      vim.keymap.set('n', '<leader>Ts',
        function() print(require 'treesitter'.statusline { type_patterns = { 'function' } }) end,
        { desc = "nvim-treesitter statusline" }
      )
    end,
  }
}
