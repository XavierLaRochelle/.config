local set = vim.opt_local
set.conceallevel = 2
set.wrap = false
set.linebreak = false
set.breakindent = true

function ToggleWrap()
  if vim.opt_local.wrap:get() == true then
    vim.opt_local.wrap = false
    vim.opt_local.linebreak = false
    vim.opt_local.sidescrolloff = 20
    vim.keymap.set({ 'n', 'v' }, 'j', 'j')
    vim.keymap.set({ 'n', 'v' }, 'k', 'k')
    vim.keymap.set({ 'n', 'v' }, '0', '0')
    vim.keymap.set({ 'n', 'v' }, '$', '$')
    vim.keymap.set({ 'n', 'v' }, '^', '^')
  else
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.sidescrolloff = 0
    vim.keymap.set({ 'n', 'v' }, 'j', 'gj')
    vim.keymap.set({ 'n', 'v' }, 'k', 'gk')
    vim.keymap.set({ 'n', 'v' }, '0', 'g0')
    vim.keymap.set({ 'n', 'v' }, '$', 'g$')
    vim.keymap.set({ 'n', 'v' }, '^', 'g^')
  end
  print("wrap =", vim.opt.wrap:get())
end

vim.keymap.set('n', '<leader>w', ToggleWrap, { desc = "Toggle wrap setting and bindings" })
set.wrap = true
set.linebreak = true
set.sidescroll = 0
set.shiftwidth = 2
