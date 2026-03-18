vim.cmd("highlight clear")
vim.cmd("syntax reset")

local M = require("after-dark")
M.setup({
    transparency = false,
    bold = true,
    italic = true,
})
