{
  programs.nixvim = {
    plugins.luasnip.enable = true;
    plugins.lazydev.enable = true;
    plugins.cmp = {
      enable = true;

      autoEnableSources = true;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "luasnip"; }
      ];
      
      settings = {
        snippet = {
          expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
        };
        completion = {
          completeopts = "menu,menuone,noinsert";
        };

        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-y>" = "cmp.mapping.confirm { select = true }";
          "<CR>" = "cmp.mapping.confirm { select = true }";
        };
      };
    };
  };
}
