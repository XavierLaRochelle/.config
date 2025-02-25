return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	config = function()
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all Folds" })
		vim.keymap.set("n", "zK", function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end, { desc = "Peek Fold" })

		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local folded_lines = vim.v.foldend - vim.v.foldstart + 1
			local total_lines = vim.api.nvim_buf_line_count(0)
			local pnum = math.floor(100 * folded_lines / total_lines) .. "%"
			local suffix = (" ⋅⋅⋅ %d line"):format(endLnum - lnum) .. (endLnum - lnum > 1 and "s " or " ") .. pnum
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end

		require("ufo").setup({
			provider_selector = function()
				return { "lsp", "indent" }
			end,
			fold_virt_text_handler = handler,
			open_fold_hl_timeout = 400,
			close_fold_kinds_for_ft = { default = {} },
			enable_get_fold_virt_text = false,
			preview = {
				border = "rounded",
				winblend = "12",
				winhighlight = "Normal:Normal",
				maxheight = 20,
			},
		})
	end,
}
