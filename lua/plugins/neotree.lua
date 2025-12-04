return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        local neotree = require("neo-tree")
        vim.keymap.set('n', 'e', ':Neotree left')
        vim.keymap.set('n', 'o', ':Neotree float git_status')
        neotree.setup({
            filesystem = {
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = false,
                },
                hijack_netrw_behavior = "open_default",
                use_libuv_file_watcher = true,
                filtered_items = {
                    visible = true,
                    show_hidden_count = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                window = {
                    mappings = {
                        ["<cr>"] = "open_tabnew",
                    }
                }
            }
        })
    end
}
