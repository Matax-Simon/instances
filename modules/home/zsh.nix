{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
    shellInit = ''
      eval "$(starship init zsh)"
    '';
  };
}
