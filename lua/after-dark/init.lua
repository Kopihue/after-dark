local palette = require("after-dark.palette")

local highlights = function(opts)
    local background = opts.transparency and "none" or palette.background
    local cursor_line = opts.transparency and "none" or palette.cursor_line
    local bold = opts.bold or false
    local italic = opts.italic or false
    local cursor_line_number = opts.colored_line_number and palette.func or palette.foreground

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
	["CursorLineNr"] = { fg = cursor_line_number },
	["CurSearch"] = { bg = palette.cursor_line },

	-- treesitter
	["@module.rust"] = { fg = palette.crate },
	["@property.toml"] = { fg = palette.func },
	["@markup.heading.1.markdown"] = { fg = palette.func },
	["@markup.heading.2.markdown"] = { fg = palette.crate },
	["@markup.heading.3.markdown"] = { fg = palette.type },
	["@markup.heading.4.markdown"] = { fg = palette.keyword },
	["@markup.list.markdown"] = { fg = palette.keyword },

	-- blink
	["Pmenu"] = { bg = background },
	["BlinkCmpMenuSelection"] = { bg = palette.cursor_line},
	["BlinkCmpKind"] = { fg = palette.func },
	["BlinkCmpKindFunction"] = { fg = palette.keyword },
	["BlinkCmpKindSnippet"] = { fg = palette.number },

	-- Telescope
	["TelescopeSelection"] = { bg = palette.cursor_line },
	["TelescopeResultsBorder"] = { fg = palette.cursor_line },
	["TelescopeResultsTitle"] = { fg = palette.func },
	["TelescopePromptBorder"] = { fg = palette.cursor_line },
	["TelescopePromptTitle"] = { fg = palette.func },
	["TelescopeSelectionCaret"] = { fg = palette.func },
	["TelescopePromptPrefix"] = { fg = palette.cursor_line },
	["TelescopeResultsCount"] = { bg = palette.crate },

	-- HTML, CSS, JS
	["@tag.delimiter.html"] = { fg = palette.line_number },
	["@tag.attribute.html"] = { fg = palette.type },
	["Title"] = { fg = palette.crate },

	-- lsp
	["DiagnosticSignError"] = { fg = palette.crate },
	["DiagnosticSignWarn"] = { fg = palette.keyword },
	["DiagnosticSignHint"] = { fg = palette.func },
	["DiagnosticSignInfo"] = { fg = palette.number },
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
