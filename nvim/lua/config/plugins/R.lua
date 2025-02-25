return {
  "R-nvim/R.nvim",
  ft = "r",
  config = function()
    require 'r'.setup {
      auto_start = 'on startup'
    }
    vim.keymap.set(
      'n',
      '<LocalLeader>tc',
      function()
        require('r.term').close_term()
      end,
      { desc = 'Close terminal' }
    )
    vim.keymap.set(
      'n',
      '<LocalLeader>gd',
      function()
        require 'r.send'.cmd('tryCatch(httpgd::hgd_browse(),error=function(e) {httpgd::hgd();httpgd::hgd_browse()})')
      end,
      { desc = 'Open httpgd' }
    )
  end,
}
