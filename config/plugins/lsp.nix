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
    # cmp-nvim-lsp = {
    #   enable = true;
    # };
    fidget = {
      enable = true;
    };

    lsp  = {
      enable = true;
      servers = {
        rust_analyzer = {
          enable = true;
        };
        nixd = {
          enable = true;
        };
      };
    };
  };
}
