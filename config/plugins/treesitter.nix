{ pkgs, ... }:
let
  treesitter-nyaaml-grammar = pkgs.tree-sitter.buildGrammar {
    language = "nyaaml";
    version = "rev=03b6782";
    src = pkgs.fetchFromGitHub {
      owner = "deweyhinni";
      repo = "tree-sitter-nyaaml";
      rev = "03b678222bf61e2cb358ca3d6b7167f9575ffb43";
      hash = "sha256-ec2g67nQHpLlBYoD+u4QLlsX8TojVy0QbBdpPb1lYfs=";
    };
    meta.homepage = "https://github.com/deweyhinni/tree-sitter-nyaaml";
  };
in
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
      "gleam"
    ];

    settings = {
      indent.enable = true;
      highlight.enable = true;
    };

    grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars ++ [
      treesitter-nyaaml-grammar
    ];
    luaConfig.post=''
      do
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.nyaaml = {
          install_info = {
            url = "${treesitter-nyaaml-grammar}",
            files = {"src/parser.c"},
          },
          filetype = "nyaaml",
        }
      end
    '';
  };

  extraPlugins = [
    treesitter-nyaaml-grammar
  ];
}
