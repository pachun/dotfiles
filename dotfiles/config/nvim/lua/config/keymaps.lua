-- change vim's leader key from the default `\` to ` ` (space)
vim.g.mapleader = " "

-- exit insert mode with `jj`
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })

-- clear search highlights with `<leader>nh`
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- `%` means current file, which is why `:source %` would resource the lua configuration for vim in this file, for example
-- <cmd> is like `:` but where `:` moves you into vim's command mode, <cmd> leaves you in whatever mode you're already in
-- <CR> represents pressing Enter key ("Carriage Return")
-- <C-w> represents holding Control and pressing w
-- <C-w>s represents holding Control, pressing w, releasing control, then pressing s

-- split management
vim.keymap.set("n", "<leader>s|", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>s_", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>sj", "<cmd>close<CR>", { desc = "Close current split" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })

-- tab management
vim.keymap.set("n", "<leader>tk", "<cmd>tabnew<CR>", { desc = "Open a new tab" })
vim.keymap.set("n", "<leader>tj", "<cmd>tabclose<CR>", { desc = "Close the current tab" })
vim.keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Go to next tab" })
-- vim maximizer gets this done, better
-- vim.keymap.set("n", "<leader>t+", "<cmd>tabnew %<CR>", { desc = "Open current file in new tab" })

-- file operations
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Close file" })
vim.keymap.set("n", "<leader>x", "<cmd>x<CR>", { desc = "Save and close file" })
