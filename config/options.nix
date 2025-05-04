{ self, ... }: {
  globalOpts = {
    number = true;
    relativenumber = true;
  };

  globals = {
    mapleader = " ";
  };

  opts = {
    shiftwidth = 2;
  };

  colorschemes.catppuccin.enable = true;
}
