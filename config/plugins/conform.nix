{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      notify_on_error = false;
      format_on_save = {
        timeout_ms = 500;
        lsp_fallback = true;
      };
    };
  };
}
