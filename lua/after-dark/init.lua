local palette = require("after-dark.palette")

local highlights = function(opts)
    local background = opts.transparency and "none" or palette.background
    local cursor_line = opts.transparency and "none" or palette.cursor_line
    local bold = opts.bold or false
    local italic = opts.italic or false

    local highlights = {
	["Normal"] = { bg = background },
	["Statement"] = { fg = palette.keyword },
	["@variable"] = { fg = palette.type },
	["Function"] = { fg = palette.func, italic = italic },
	["Special"] = { fg = palette.func },
	["String"] = { fg = palette.string },
	["Operator"] = { fg = palette.keyword },
	["Comment"] = { fg = palette.comment, italic = italic },
	["Constant"] = { fg = palette.number },
	["Delimiter"] = { fg = palette.line_number },
	["Statusline"] = { bg = background },
	["StatuslineNC"] = { bg = background },
	["Type"] = { fg = palette.variable, bold = bold },
	["PreProc"] = { fg = palette.cursor },
	["CursorLine"] = { bg = cursor_line },
	["Visual"] = { bg = palette.cursor_line },

	-- treesitter
	["@module.rust"] = { fg = palette.crate },
	["@property.toml"] = { fg = palette.func },
	["@markup.heading.1.markdown"] = { fg = palette.func },
	["@markup.heading.2.markdown"] = { fg = palette.crate },
	["@markup.heading.3.markdown"] = { fg = palette.type },
	["@markup.heading.4.markdown"] = { fg = palette.keyword },
	["@markup.list.markdown"] = { fg = palette.keyword },

	-- blink
	["BlinkCmpMenu"] = { bg = background },
	["BlinkCmpMenuBorder"] = { fg = palette.func },
	["BlinkCmpItemSelected"] = { bg = palette.func },
	["Pmenu"] = { bg = background },
	["NormalFloat"] = { bg = background },
	["PmenuSel"] = { bg = palette.cursor_line },
    }
    return highlights
end

local M = {}

M.setup = function(opts)
    for field, value in pairs(highlights(opts)) do
	vim.api.nvim_set_hl(0, field, value)
    end
end

return M
