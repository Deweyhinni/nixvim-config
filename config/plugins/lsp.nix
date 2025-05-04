{pkgs, ...}: {
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
    };
    fidget = {
      enable = true;
    };

    lsp  = {
      enable = true;
      servers = {
        rust_analyzer = {
          enable = true;
          settings = {
            procMacro = {
              ignored = {
                leptos_macro = [ "server" ];
              };
            };
          };
        };
        nixd = {
          enable = true;
        };
        clangd = {
          enable = true;
        };
        basedpyright = {
          enable = true;
        };
        asm_lsp = {
          enable = true;
        };
        emmet_language_server = {
          enable = true;
        };
        eslint = {
          enable = true;
        };
        gleam = {
          enable = true;
        };
        glsl_analyzer = {
          enable = true;
        };
        wgsl_analyzer = {
          enable = true;
        };
        tailwindcss = {
          enable = true;
          filetypes = [
            "html"
            "css"
            "htmldjango"
            "templ"
            "rust"
          ];
          settings = {
            tailwindCSS = {
              includeLanguages = {
                rust = "html";
              };
              lint = {
                cssConflict = "warning";
                invalidApply = "error";
                invalidConfigPath = "error";
                invalidScreen = "error";
                invalidTailwindDirective = "error";
                invalidVariant = "error";
                recommendedVariantOrder = "warning";
              };
              validate = true;
              experimental = {
                classRegex = [
                  ''class\s*=\s*"(.*?)"''
                  ''class:\s*"([^"]*)''
                  ''class:\s*(\w+)''
                ];
              };
            };
          };
          onAttach = ''
            function(client, bufnr)
              if vim.bo.filetype = 'rust' then
                client.config.settings = client.config.settings or {}
                client.config.settings.includeLanguages = client.config.settings.includeLanguages or {}
                client.config.settings.includeLanguages.rust = 'html'
                client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
              end
            end
          '';
        };
      };
    };
  };
}
