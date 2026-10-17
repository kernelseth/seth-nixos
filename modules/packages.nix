{ config, pkgs, ... }:

{
  # System packages
  environment.systemPackages = with pkgs; [
    prismlauncher
    chromium
    fastfetch
    discord
    flatpak
    steam
    waydroid
    stremio-linux-shell
    obs-studio
    unrar
    krita
    jwm
    jwm-settings-manager
    wine
    lutris
  ];
}
