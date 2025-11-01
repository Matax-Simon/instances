{inputs, ...}: {
  flake = {
    nixosConfigurations.matax-1 = inputs.nixpkgs.lib.nixosSystem {
      # system = "x86_64-linux";
      modules = [
        ./configuration.nix
      ];

      specialArgs = {
        inherit inputs;
      };
    };
  };
}
