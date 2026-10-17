{ config, pkgs, ... }:

{
  # Allow proprietary/unfree packages
  nixpkgs.config.allowUnfree = true;

  # Insecure packages
  nixpkgs.config.permittedInsecurePackages = [
  ];
}
