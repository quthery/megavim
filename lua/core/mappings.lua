vim.keymap.set("n", "<C-n>", ":BufferLineMoveNext<CR>") -- Переместить вкладку вперед
vim.keymap.set("n", "<C-p>", ":BufferLineMovePrev<CR>") -- Переместить вкладку назад
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>") -- Следующий буфер
vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>")
vim.keymap.set('n', '<leader>X', ':BufferLinePickClose<CR>')
vim.keymap.set("n", "<leader>q", ":bw<CR>")
