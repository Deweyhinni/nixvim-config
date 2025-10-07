{ pkgs, ... }:
{
  plugins.dap = {
    enable = true;

    signs = {
      dapBreakpoint = {
        text = "●";
        texthl = "DapBreakpoint";
      };
      dapBreakpointCondition = {
        text = "◆";
        texthl = "DapBreakpoint";
      };
      dapBreakpointRejected = {
        text = "○";
        texthl = "DapBreakpoint";
      };
      dapLogPoint = {
        text = "◆";
        texthl = "DapLogPoint";
      };
      dapStopped = {
        text = "→";
        texthl = "DapStopped";
      };
    };

    adapters.servers.codelldb = {
      port = "\${port}";
      executable = {
        command = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
        args = ["--port" "\${port}"];
      };
    };

    configurations.rust = [
      {
        name = "Launch";
        type = "codelldb";
        request = "launch";
        program = {
          __raw = ''
            function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
            end
          '';
          cwd = "\${workspaceFolder}";
          stopOnEntry = false;
        };
      }
    ];
  };

  plugins.dap-ui = {
    enable = true;
  };

  keymaps = [
    {
        mode = "n";
        key = "<leader>db";
        action = "<cmd>DapToggleBreakpoint<cr>";
        options.desc = "Toggle breakpoint";
      }
      {
        mode = "n";
        key = "<leader>dc";
        action = "<cmd>DapContinue<cr>";
        options.desc = "Continue/Start debugging";
      }
      {
        mode = "n";
        key = "<leader>di";
        action = "<cmd>DapStepInto<cr>";
        options.desc = "Step into";
      }
      {
        mode = "n";
        key = "<leader>do";
        action = "<cmd>DapStepOver<cr>";
        options.desc = "Step over";
      }
      {
        mode = "n";
        key = "<leader>dO";
        action = "<cmd>DapStepOut<cr>";
        options.desc = "Step out";
      }
      {
        mode = "n";
        key = "<leader>dt";
        action = "<cmd>DapTerminate<cr>";
        options.desc = "Terminate debugging";
      }
      {
        mode = "n";
        key = "<leader>du";
        action.__raw = "require('dapui').toggle";
        options.desc = "Toggle DAP UI";
      }
  ];
}
