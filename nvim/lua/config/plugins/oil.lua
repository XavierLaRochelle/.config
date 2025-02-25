return {
  {
    'stevearc/oil.nvim',
    enabled = false,
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      require("oil").setup {}

      vim.keymap.set("n", "-", "<cmd>Oil<CR>")
      vim.keymap.set('n', '<leader>of', require 'oil'.toggle_float, { desc = "Oil Float" })
    end,
  }
}
