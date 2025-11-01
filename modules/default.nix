{
  home = import ./home;
  users = import ./users;
  direnv = import ./direnv.nix;
  nixpkgs = import ./nixpkgs.nix;
  network = import ./network.nix;
  packages = import ./packages.nix;
  boot = import ./boot.nix;
}
