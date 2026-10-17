{ config, pkgs, ... }:

{
  # Enable modern Nix commands and flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
