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
        },
    },
}
