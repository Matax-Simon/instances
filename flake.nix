{
  description = "My macOS config with nix-darwin + Home Manager";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Flake utils for eachSystem
    # flake-utils.url = "github:numtide/flake-utils";
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Disko for easier partition management
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, ...} @ inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
        ./hosts/matax-1/flake.nix
      ];

      flake = {
        homeModules = import ./modules;
      };

      perSystem = {
        inputs,
        pkgs,
        ...
      }: {
        devShells.default = import ./shell.nix {inherit pkgs inputs;};
        formatter = pkgs.alejandra;
      };
    };
}
