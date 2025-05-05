{ self, ... }: {
  globalOpts = {
  };

  globals = {
    mapleader = " ";
    maplocalleader = " ";
    have_nerd_fonts = true;
  };

  opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 2;
    showmode = false;
    undofile = true;
    ignorecase = true;
    smartcase = true;
    hlsearch = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
    }
    {
      mode = "";
      key = "<leader>y";
      action = ''"+y'';
    }
  ];

  colorschemes.catppuccin.enable = true;
}
