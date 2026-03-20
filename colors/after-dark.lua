vim.cmd("highlight clear")
vim.cmd("syntax reset")

local M = require("after-dark")
M.setup({
    transparency = true,
    bold = false,
    italic = false,
})
