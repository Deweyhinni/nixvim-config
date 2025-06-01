{pkgs, ...}: {
  plugins = {
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
        nushell = {
          enable = true;
        };
        hls = {
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
        };
      };
      onAttach = ''
          if vim.bo.filetype == 'rust' then
            client.config.settings = client.config.settings or {}
            client.config.settings.includeLanguages = client.config.settings.includeLanguages or {}
            client.config.settings.includeLanguages.rust = 'html'
            client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
          end
      '';

      keymaps = {
        diagnostic = {
          "[d" = {
            action = "goto_prev";
            desc = "Go to previous [D]iagnostic Message";
          };
          "]d" = {
            action = "goto_next";
            desc = "Go to next [D]iagnostic Message";
          };
          "<leader>e" = {
            action = "open_float";
            desc = "Show diagnostic [E]rror messages";
          };
          "<leader>q" = {
            action = "setloclist";
            desc = "Set diagnostic [Q]uixfix list";
          };
        };

        extra = [
          # Jump to the definition of the word under your cusor.
          #  This is where a variable was first declared, or where a function is defined, etc.
          #  To jump back, press <C-t>.
          {
            mode = "n";
            key = "gd";
            action.__raw = "require('telescope.builtin').lsp_definitions";
            options = {
              desc = "LSP: [G]oto [D]efinition";
            };
          }
          # Find references for the word under your cursor.
          {
            mode = "n";
            key = "gr";
            action.__raw = "require('telescope.builtin').lsp_references";
            options = {
              desc = "LSP: [G]oto [R]eferences";
            };
          }
          # Jump to the implementation of the word under your cursor.
          #  Useful when your language has ways of declaring types without an actual implementation.
          {
            mode = "n";
            key = "gI";
            action.__raw = "require('telescope.builtin').lsp_implementations";
            options = {
              desc = "LSP: [G]oto [I]mplementation";
            };
          }
          # Jump to the type of the word under your cursor.
          #  Useful when you're not sure what type a variable is and you want to see
          #  the definition of its *type*, not where it was *defined*.
          {
            mode = "n";
            key = "<leader>D";
            action.__raw = "require('telescope.builtin').lsp_type_definitions";
            options = {
              desc = "LSP: Type [D]efinition";
            };
          }
          # Fuzzy find all the symbols in your current document.
          #  Symbols are things like variables, functions, types, etc.
          {
            mode = "n";
            key = "<leader>ds";
            action.__raw = "require('telescope.builtin').lsp_document_symbols";
            options = {
              desc = "LSP: [D]ocument [S]ymbols";
            };
          }
          # Fuzzy find all the symbols in your current workspace.
          #  Similar to document symbols, except searches over your entire project.
          {
            mode = "n";
            key = "<leader>ws";
            action.__raw = "require('telescope.builtin').lsp_dynamic_workspace_symbols";
            options = {
              desc = "LSP: [W]orkspace [S]ymbols";
            };
          }
        ];
      };
    };
  };
}
