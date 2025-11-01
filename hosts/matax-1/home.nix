{inputs, ...}: {
  imports = with inputs.self; [
    homeModules.direnv
    homeModules.nixpkgs
    # homeModules.home.git
    homeModules.home.zsh
    # homeModules.home.ssh
    homeModules.home.fish
    homeModules.home.starship
    homeModules.home.packages
    homeModules.home.fastfetch
  ];

  programs.home-manager.enable = true;
}
