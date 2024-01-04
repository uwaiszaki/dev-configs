-- -- Keymaps are automatically loaded on the VeryLazy event
-- -- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- -- Add any additional keymaps here
-- local Util = require("lazyvim.util")
--
-- -- DO NOT USE THIS IN YOU OWN CONFIG!!
-- -- use `vim.keymap.set` instead
-- local map = Util.safe_keymap_set
--
-- map('n', 'gd', '<cmd>lua safe_goto.SafeGotoDefinition()<CR>', { noremap = true, silent = true })
--
--
-- local safe_goto = require('config.safe_goto_definition')
--
-- vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua safe_goto.SafeGotoDefinition()<CR>', { noremap = true, silent = true })

-- Controls cursor key usage

local keymap = vim.keymap

-- Select All
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da")
keymap.set("n", "<Leader>O", "O<Esc>^Da")

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>")
keymap.set("n", "<s-tab>", ":tabprev<Return>")
-- Split window
keymap.set("n", "ss", ":split<Return>")
keymap.set("n", "sv", ":vsplit<Return>")
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Ufo Code Folder
keymap.set("n", "zR", require("ufo").openAllFolds)
keymap.set("n", "zM", require("ufo").closeAllFolds)

-- Telescope Project
keymap.set("n", "<leader>fp", ":Telescope project<CR>")

-- Add the terminal mappings here following the same pattern
-- vim-powered terminal in split window
keymap.set("n", "<Leader>t", ":split | term <CR>")
keymap.set("t", "<Leader>t", "<C-\\><C-N>:split | term<CR>")

-- vim-powered terminal in new tab
keymap.set("n", "<Leader>T", ":tabnew | term <CR>")
keymap.set("t", "<Leader>T", "<C-\\><C-N>:tabnew | term <CR>")

keymap.set("n", "<leader>rn", "<cmd>IncRename <C-r><C-w><CR>")

-- ToggleTerm
-- Toggle a horizontal terminal
keymap.set("n", "<Leader>th", ":ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })

-- Toggle a vertical terminal
keymap.set("n", "<Leader>tv", ":ToggleTerm direction=vertical<CR>", { noremap = true, silent = true })

-- Toggle a floating terminal
keymap.set("n", "<Leader>tf", ":ToggleTerm direction=float<CR>", { noremap = true, silent = true })
