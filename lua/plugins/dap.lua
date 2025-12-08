return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'nvim-neotest/nvim-nio',
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        'leoluz/nvim-dap-go',
    },
    config = function()
        

local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
require('dap-go').setup{
            delve = {
                path = "dlv",
                initialize_timeout_sec = 20,
                port = "2345",
                args = {},
                build_flags = {},
                detached = vim.fn.has("win32") == 0,
                cwd = nil,
            },
            tests = {
                verbose = false,
            },
        }

        -- Конфигурации для Go
        local dap = require('dap')
        dap.configurations.go = {
            {
                type = "go",
                name = "Attach remote",
                mode = "remote",
                request = "attach",
            },
        }
-- горячие клавиши
    vim.keymap.set("n", "<F5>", function() dap.continue() end)
    vim.keymap.set("n", "<F10>", function() dap.step_over() end)
    vim.keymap.set("n", "<F11>", function() dap.step_into() end)
    vim.keymap.set("n", "<F12>", function() dap.step_out() end)
    vim.keymap.set("n", "<Leader>b", function() dap.toggle_breakpoint() end)
    end,
}

