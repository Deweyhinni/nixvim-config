{
  plugins.treesitter = {
    enable = true;
    settings.ensure_installed = [
      "bash"
      "c"
      "diff"
      "html"
      "lua"
      "luadoc"
      "markdown"
      "vim"
      "vimdoc"
      "nix"
      "rust"
    ];

    settings = {
      indent.enable = true;
    };
  };
}
