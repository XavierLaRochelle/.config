return {
  "3rd/image.nvim",
  enabled = true,
  build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
  dependencies = {
    "luarocks.nvim",
  },
  config = function()
    require('image').setup({
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = true,
          filetypes = { 'markdown', 'vimwiki' }
        },
      },
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = nil,
      max_height_window_percentage = 50,
      kitty_method = 'normal',
      processor = 'magick_cli'
    })
  end,
}
