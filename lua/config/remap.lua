vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = 'back to [P]roject [V]iew'})
--moving lines
vim.keymap.set('v',"<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set('v',"<A-j>", ":m '>+1<CR>gv=gv")

--vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
--vim.keymap.set("n", "<leader>Y", [["+Y]])
--permette di sostituire la stringa selezionata
vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc =  "[S]ubstitute [s]"})
