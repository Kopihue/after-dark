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
	["Function"] = { fg = palette.func, bold = bold },
	["Special"] = { fg = palette.func },
	["String"] = { fg = palette.string, italic = italic },
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
	["Search"] = { bg = palette.cursor_line },
	["Identifier"] = { fg = palette.keyword },

	-- treesitter
	["@module.rust"] = { fg = palette.crate },
	["@property.toml"] = { fg = palette.func },
	["@markup.heading.1.markdown"] = { fg = palette.func },
	["@markup.heading.2.markdown"] = { fg = palette.crate },
	["@markup.heading.3.markdown"] = { fg = palette.type },
	["@markup.heading.4.markdown"] = { fg = palette.keyword },
	["@markup.list.markdown"] = { fg = palette.keyword },
	["@type.builtin.c"] = { fg = palette.crate },

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
	["TelescopePromptNormal"] = { fg = palette.crate },
	["TelescopeSelectionCaret"] = { fg = palette.func },
	["TelescopeResultsCount"] = { bg = palette.crate },
	["TelescopePreviewTitle"] = { fg = palette.func },
	["TelescopePreviewBorder"] = { fg = palette.cursor_line },

	-- HTML, CSS, JS
	["@tag.delimiter.html"] = { fg = palette.line_number },
	["@tag.attribute.html"] = { fg = palette.type },
	["Title"] = { fg = palette.crate },

	-- lsp
	["DiagnosticSignError"] = { fg = palette.crate },
	["DiagnosticSignWarn"] = { fg = palette.keyword },
	["DiagnosticSignHint"] = { fg = palette.func },
	["DiagnosticSignInfo"] = { fg = palette.number },

	-- C
	["@type.builtin.c"] = { fg = palette.crate, italic = italic },
	["@keyword.import.c"] = { fg = palette.keyword, italic = italic, },

	-- python
	["@variable.builtin.python"] = { fg = palette.crate, italic = italic },

	-- netrw
	["netrwPlain"] = { fg = palette.crate },
	["netrwDir"] = { fg = palette.keyword },
	["netrwExe"] = { fg = palette.func },
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
