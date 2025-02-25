return {
  "TobinPalmer/Tip.nvim",
  event = "VimEnter",
  dependencies = {
    "rcarriga/nvim-notify",
    "nvim-lua/plenary.nvim"
  },
  init = function()
    -- Default config
    --- @type Tip.config
    require("tip").setup({
      seconds = 2,
      title = "Tip!",
      url = "https://vtip.43z.one", -- Or https://vimiscool.tech/neotip
    })
  end,
}
