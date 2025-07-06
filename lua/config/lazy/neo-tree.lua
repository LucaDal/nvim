-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
    },
    lazy = false,
    keys = {
        {"<leader>t", group = "Neotree", desc = "Neo[T]ree"},
        {'<leader>tt', ':Neotree toggle<CR>', desc = 'Neo[T]ree [T]oggle', silent = true },
        {'<leader>t\\', ':Neotree focus<CR>', desc = 'Neo[T]ree focus'},
        {'<leader>tb', ':Neotree focus buffers left<CR>', desc = 'Neo[T]ree [b]uffer'},
        {'<leader>tg', ':Neotree focus git_status left<CR>', desc = 'Neo[T]ree [g]it status'},
    },
    opts = {
        filesystem = {
            window = {
                mappings = {
                    ['\\'] = 'close_window',
                },
            },
            components = {
                harpoon_index = function(config, node, _)
                    local harpoon_list = require("harpoon"):list()
                    local path = node:get_id()
                    local harpoon_key = vim.uv.cwd()

                    for i, item in ipairs(harpoon_list.items) do
                        local value = item.value
                        if string.sub(item.value, 1, 1) ~= "/" then
                            value = harpoon_key .. "/" .. item.value
                        end

                        if value == path then
                            vim.print(path)
                            return {
                                text = string.format(" ⥤ %d", i), -- <-- Add your favorite harpoon like arrow here
                                highlight = config.highlight or "NeoTreeDirectoryIcon",
                            }
                        end
                    end
                    return {}
                end,
            },
            renderers = {
                file = {
                    { "icon" },
                    { "name", use_git_status_colors = true },
                    { "harpoon_index" }, --> This is what actually adds the component in where you want it
                    { "diagnostics" },
                    { "git_status", highlight = "NeoTreeDimText" },
                },
            },
        },
    },
}
