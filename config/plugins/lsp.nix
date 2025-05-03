{pkgs, ...}: {
  plugins = {
    cmp-nvim-lsp = {
      enable = true;
    };
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
