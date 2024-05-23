require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Mapping for `Comment.nvim` using Ctrl + /
map({ "i", "v" }, "<C-_>", function()
  require('Comment.api').toggle.linewise.current()
end, { desc = "Toggle comment" })

-- Visual mode mapping
map("n", "<C-_>", function()
  require('Comment.api').toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle comment" })

-- Mapping for formatting using Shift + Alt + L
map("i", "<A-S-l>", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format code" })

map("v", "<A-S-l>", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format code" })

local opts = { noremap = true, silent = true }

-- Map Ctrl + x to cut (delete)
map('v', '<C-x>', '"+d', opts)
map('n', '<C-x>', 'v"+d', opts)

-- Map Ctrl + v to paste
map('i', '<C-v>', '<C-r>+', opts)
map('n', '<C-v>', '"+p', opts)
map('v', '<C-v>', '"+p', opts)

-- Map Ctrl + z to undo
map('n', '<C-z>', 'u', opts)
map('i', '<C-z>', '<C-o>u', opts)
map('v', '<C-z>', '<Esc>u', opts)
--
-- Map Ctrl + y to redo
map('n', '<C-y>', '<C-r>', opts)
map('i', '<C-y>', '<C-o><C-r>', opts)
map('v', '<C-y>', '.<Esc><C-r>', opts)

-- Map Ctrl + s to save
map('n', '<C-s>', ':w<CR>', opts)
map('i', '<C-s>', '<Esc>:w<CR>a', opts)
map('v', '<C-s>', '<Esc>:w<CR>', opts)


-- Duplicate line with Ctrl + d
map('n', '<C-d>', ':t.<CR>', opts)
map('i', '<C-d>', ':t.<CR>', opts)

-- Refactoring with Ctrl + r
map('n', '<C-r>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('i', '<C-r>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
