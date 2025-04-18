return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'

      -- Pfad zu den Tools
      local tools_path = os.getenv 'TOOLS'

      -- Konfiguration für .NET (netcoredbg)
      dap.adapters.coreclr = {
        type = 'executable',
        command = tools_path .. '/netcoredbg/netcoredbg',
        args = { '--interpreter=vscode' },
      }
      dap.configurations.cs = {
        {
          type = 'coreclr',
          name = 'launch - netcoredbg',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/net6.0/', 'file')
          end,
        },
      }
      -- Konfiguration für PowerShell (PSES - PowerShell Editor Services)
      dap.adapters.powershell = {
        type = 'executable',
        command = 'pwsh', -- or 'powershell'
        args = {
          '-NoProfile',
          '-Command',
          [[& {
          Import-Module PowerShellEditorServices;
          Start-EditorServices -HostName 'nvim' -HostProfileId 0 -HostVersion '0.1.0' -LogPath "$HOME/.local/share/nvim/lsp_log" -SessionDetailsPath "$HOME/.local/share/nvim/sessions/powershell.session.json" -FeatureFlags @() -BundledModulesPath ']]
          .. tools_path
          .. [[/PowerShellEditorServices/PowerShellEditorServices' -EnableConsoleRepl;
        }]],
        },
      }

      dap.configurations.powershell = {
        {
          type = 'powershell',
          request = 'launch',
          name = 'PowerShell Launch Script',
          script = function()
            return vim.fn.input('Path to script: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          args = {},
          stopOnEntry = false,
        },
      }

      dap.configurations.ps1 = dap.configurations.powershell

      -- Keybindings für nvim-dap
      vim.api.nvim_set_keymap('n', '<F5>', "<Cmd>lua require'dap'.continue()<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<F10>', "<Cmd>lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<F11>', "<Cmd>lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<F12>', "<Cmd>lua require'dap'.step_out()<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>b', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>",
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap(
        'n',
        '<Leader>B',
        "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        'n',
        '<Leader>lp',
        "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap('n', '<Leader>dr', "<Cmd>lua require'dap'.repl.open()<CR>",
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>dl', "<Cmd>lua require'dap'.run_last()<CR>",
        { noremap = true, silent = true })
    end,
  },
{
  'rcarriga/nvim-dap-ui',
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
  config = function()
    require('dapui').setup {
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.25 },
          },
          size = 40,
          position = "left",
        },
        {
          elements = {
            { id = "repl", size = 0.5 },
            { id = "console", size = 0.5 },
          },
          size = 10,
          position = "bottom",
        },
      },
    }
  end,
},
  {
    "nvim-neotest/nvim-nio"
  },
  {
    'theHamsta/nvim-dap-virtual-text',          -- Ergänzung für Debugging-Informationen im Quellcode
    dependencies = { 'mfussenegger/nvim-dap' }, -- Abhängigkeit zu nvim-dap
    config = function()
      require('nvim-dap-virtual-text').setup {
        enabled = true,                     -- Aktiviert die virtuelle Textanzeige
        enabled_commands = true,            -- Aktiviert :DapVirtualTextEnable/Disable-Befehle
        highlight_changed_variables = true, -- Hebt geänderte Variablen hervor
        highlight_new_as_changed = true,    -- Hebt neue Variablen als geändert hervor
        show_stop_reason = true,            -- Zeigt den Grund für das Stoppen an
        commented = false,                  -- Fügt keine Kommentare zu den Variablen hinzu
      }
    end,
  },
}
