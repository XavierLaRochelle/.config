return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
  },
  config = function()
    require 'tokyonight'.setup({
      style = 'night',
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      plugins = {
        telescope = true,
      },
    })
    vim.cmd.colorscheme "tokyonight-night"
  end,
}
