{
  plugins.treesitter = {
    enable = true;
    ensureInstalled = [
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
