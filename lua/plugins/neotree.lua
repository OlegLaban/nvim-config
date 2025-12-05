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
--        vim.keymap.set('n', 'o', ':Neotree float git_status')
       
local default_name = require("neo-tree.sources.filesystem.components").name

local function custom_name_component(config, node, state)
  -- сначала даём стандартному компоненту посчитать text и highlight
  local out = default_name(config, node, state)

  -- если это директория, проверяем несохранённые файлы внутри
  if node.type == "directory" then 
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_get_option(buf, "modified") then
        local path = vim.api.nvim_buf_get_name(buf)
        if path ~= "" and path:find(node.path, 1, true) == 1 then
          out.text = out.text .. " [+]" -- добавляем метку, highlight НЕ трогаем
          break
        end
      end
    end
  end

  return out -- возвращаем стандартный highlight + изменённый text
end
        neotree.setup({
            filesystem = {
                components = {
                    name = custom_name_component,
                },
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
            }
        })
    end
}
