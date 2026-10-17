{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/locale.nix
    ./modules/desktop.nix
    ./modules/audio.nix
    ./modules/bluetooth.nix
    ./modules/printing.nix
    ./modules/users.nix
    ./modules/programs.nix
    ./modules/virtualization.nix
    ./modules/services.nix
    ./modules/packages.nix
    ./modules/nixpkgs.nix
    ./modules/nix-ld.nix
    ./modules/performance.nix
    ./modules/security.nix
    ./modules/swap.nix
    ./modules/nix.nix
  ];

  system.stateVersion = "26.05";
}
