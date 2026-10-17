{ config, pkgs, ... }:

{
  # Services
  services.flatpak.enable = true;
  services.usbmuxd.enable = true;
}
