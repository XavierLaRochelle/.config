local ts = vim.treesitter
local parsers = require 'nvim-treesitter.parsers'

local parser = parsers.get_parser()
local tree = parser:parse()[1]
