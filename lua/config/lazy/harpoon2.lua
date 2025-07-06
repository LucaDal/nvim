return{
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function ()

        local harpoon = require('harpoon')
        harpoon:setup({})

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end
        local wk = require("which-key")
        wk.add({
            { "<leader>h", group = "Harpoon" }, -- group
        })
        vim.keymap.set("n", "<leader>ht", function() toggle_telescope(harpoon:list()) end,
            { desc = "Harpoon: Open harpoon added window" })
        vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, {desc = 'Harpoon: Add current file to harpoon List'})
        vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,{desc = 'Harpoon: Edit menu'})
        vim.keymap.set("n", "<leader>hh", function() harpoon:list():select(1) end, {desc = 'Harpoon: Go to 1'})
        vim.keymap.set("n", "<leader>hj", function() harpoon:list():select(2) end, {desc = 'Harpoon: Go to 2'})
        vim.keymap.set("n", "<leader>hk", function() harpoon:list():select(3) end, {desc = 'Harpoon: Go to 3'})
        vim.keymap.set("n", "<leader>hl", function() harpoon:list():select(4) end, {desc = 'Harpoon: Go to 4'})

        -- Toggle previous & next :buffers stored within Harpoon list
        vim.keymap.set("n", "<C-A-p>", function() harpoon:list():prev() end, {desc = 'Harpoon: Prev file'})
        vim.keymap.set("n", "<C-A-n>", function() harpoon:list():next() end, {desc = 'Harpoon: Next file'})
    end
}
