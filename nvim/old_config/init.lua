require("xlr.core")
require("xlr.lazy")

--- @class parser_config
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.stan = {
	install_info = {
		url = "https://github.com/WardBrian/tree-sitter-stan",
		files = { "src/parser.c" },
		branch = "main",
	},
}

vim.filetype.add({
	extension = { stan = "stan" },
})
