{
  lib,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    inputs.self.homeModules.nixpkgs
    inputs.self.homeModules.network
    inputs.self.homeModules.boot
    inputs.self.homeModules.ssh
    inputs.self.homeModules.direnv
    inputs.self.homeModules.nixpkgs
    #inputs.self.# homeModules.home.git
    # inputs.self.homeModules.home.fastfetch
    inputs.self.homeModules.home.zsh
    inputs.self.homeModules.home.fish
    inputs.self.homeModules.home.starship
    inputs.self.homeModules.home.packages
    inputs.self.homeModules.home.nginx
    inputs.self.homeModules.users.bahrom04
  ];

  # Kolyma services
  matax = {
    # https://matax.uz
    www = {
      enable = true;
      instance = 1;
      alias = ["matax.uz"];
    };
  };

  # Enable networking
  networking = {
    networkmanager.enable = true;
    hostName = "matax-1";

    firewall.allowedTCPPorts = [22];
  };

  # Set your time zone.
  time.timeZone = "Asia/Tashkent";

  # Select internationalisation properties.
  i18n.defaultLocale = "uz_UZ.UTF-8";
  i18n.supportedLocales = ["all"];

  # Garbage collector.
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 10d";
  };

  environment = {
    systemPackages = with pkgs; [
      neovim
      vim
      fastfetch
      age
      sops
    ];
  };
  programs = {
    zsh.enable = true;
    mtr.enable = true;
  };

  # Select host type for the system
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = "25.05";
}
