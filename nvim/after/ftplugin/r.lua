-- Options
local set = vim.opt_local
set.shiftwidth = 2

-- Keymaps
local r = require 'r.send'
vim.keymap.set(
  "n",
  "<space><space>x",
  r.source_file,
  { desc = 'Send file to R console' }
)
vim.keymap.set(
  "n",
  "<space>x",
  r.line,
  { desc = 'Send current line to R console' }
)
vim.keymap.set(
  "v",
  "<space>x",
  r.selection,
  { desc = 'Send selection to R console' }
)
