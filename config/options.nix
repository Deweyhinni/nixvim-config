{ self, ... }: {
  globalOpts = {
  };

  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 2;
  };

  colorschemes.catppuccin.enable = true;
}
