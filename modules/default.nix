{
  home = import ./home;
  users = import ./users;
  direnv = import ./direnv.nix;
  nixpkgs = import ./nixpkgs.nix;
  packages = import ./packages.nix;
}
