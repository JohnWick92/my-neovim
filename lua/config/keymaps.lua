vim.opt.number = true
vim.opt.relativenumber = true
local builtin = require("telescope.builtin")
local conform = require("conform")
vim.keymap.set("n", "<leader><Space>", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>cf", function()
	conform.format()
end)
