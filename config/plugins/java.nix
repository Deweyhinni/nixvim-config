{config, pkgs, ...}:
{
  # plugins.java = {
  #  enable = true;
  # };
  plugins.jdtls = {
    enable = true;
    settings = {
      cmd = ["${pkgs.jdt-language-server}/bin/jdtls"];
    };
  };
}
