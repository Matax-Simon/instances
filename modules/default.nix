{
  home = import ./home;
  ssh = import ./ssh.nix;
  users = import ./users;
  boot = import ./boot.nix;
  direnv = import ./direnv.nix;
  nixpkgs = import ./nixpkgs.nix;
  network = import ./network.nix;
  packages = import ./packages.nix;
}
