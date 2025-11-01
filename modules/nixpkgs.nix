{
  lib,
  config,
  inputs,
  ...
}: {
  nixpkgs = {
    overlays = [
    ];
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Disable if you don't want linux thingies on mac
      allowUnsupportedSystem = true;
      allowUnfreePredicate = pkg: true;
      # Let the system use fucked up programs
      allowBroken = true;
    };
  };

  nix = {
    enable = true;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
    settings = {
      experimental-features = "nix-command flakes";
      substituters = ["https://cache.xinux.uz/"];
      trusted-public-keys = [
        "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
      ];
      trusted-users = [
        "root"
        "bahrom04"
        "@wheel"
      ];
    };
  };
}
