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
