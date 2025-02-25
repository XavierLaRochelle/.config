-- Plugins
require("config.lazy")

-- Options
local set = vim.opt
set.scrolloff = 10
set.sidescrolloff = 20
set.wrap = false
set.shiftwidth = 4
set.number = true
set.relativenumber = true
set.clipboard = "unnamedplus"
set.hls = false
set.aw = false
set.ignorecase = true
set.smartcase = true
set.splitright = true
set.splitbelow = true
set.inccommand = 'split'

-- Keymaps
vim.keymap.set("n", "<tab>", "<C-W><C-W>")       -- Switch window
vim.keymap.set("n", "<C-=>", "<C-W>+5")          -- increase window height
vim.keymap.set("n", "<C-->", "<C-W>-5")          -- decrease window height
vim.keymap.set("n", "<C-,>", "<C-W><lt>5")       -- increase window width
vim.keymap.set("n", "<C-.>", "<C-W>>5")          -- decrease window width
vim.keymap.set('t', '<esc><esc>', '<C-\\><C-n>') -- Exit terminal mode
vim.keymap.set('n', 'yF', '<cmd>:%y<CR>', { desc = '[Y]ank the whole [F]ile' })
vim.keymap.set('n', 'vF', 'ggVG', { desc = '[V]isually select the [F]ile' })

-- Highlight when yanking (copying) test
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
