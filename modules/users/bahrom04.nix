{
  pkgs,
  ...
}: let
  hashedPassword = "$2b$05$QgiAihjGOtxfGZ06pfm2u.dMR6522sT2Pmy4mt//Rf2x5YonDcD.2";
in {
  config = {
    users.users = {
      bahrom = {
        inherit hashedPassword;
        isNormalUser = true;
        description = "Bakhrom Rakhmatov";
        shell = pkgs.zsh;

        extraGroups = [
          "networkmanager"
          "wheel"
          "docker"
          "vboxusers"
          "media"
          "admins"
          "libvirtd"
          "input"
        ];

        openssh.authorizedKeys.keys = [
          # dll
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDH+EVAeaZpe98gggH8fPQ4bKEgw2FbTqYzngTRSpSbp magdiyevbahrom04@gmail.com"
          # mtx
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF+Iwxr6xnmkaKh+SCZer2OM4ARcCBGXkKLhxFe158aU magdiyevbahrom@gmail.com"
          # add more
        ];
      };
    };

    # home-manager = {
    #   backupFileExtension = "hbak";
    #   extraSpecialArgs = {
    #     inherit inputs outputs;
    #   };
    #   users = {
    #     # Import your home-manager configuration
    #     bahrom = import ../../hosts/matax-1/home.nix;
    #   };
    # };
  };
}
