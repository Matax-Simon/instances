<p align="center">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="./.github/assets/nix-config-header.png">
        <img alt="Welcome Image" src="./.github/assets/nix-config-header.png">
    </picture>
</p>

# NixOS
```bash
# rebuild and switch
sudo nixos-rebuild switch --flake .#matax-1 #use hostname here

# build and test
nix build .#nixosConfigurations.matax-1.config.system.build.toplevel --show-trace
```

### Install from live iso. Disko
```bash
# Clone the repository
git clone https://github.com/bahrom04/nix-config.git

# Partition disks regarding to configuration
# Replace ? with available hostname
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode disko ./hosts/?/disk-configuration.nix

# Install using flake configurations on top of partitioned disks
# Replace ? with available hostname
sudo nixos-install --flake .#?
```

## Code formatter and checkers
```bash
nix fmt .
nix flake check --all-systems --show-trace
```

## Edit secrets 
```bash
nix develop
EDITOR=vim sops ./secrets/secrets.yaml
```
<p align="center">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="./.github/assets/nix-config-footer.png">
        <img alt="Welcome Image" src="./.github/assets/nix-config-footer.png">
    </picture>
</p>