{ config, pkgs, ... }:

{
  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    vulkan-loader
    libglvnd
    xorg.libX11
    xorg.libXext
    xorg.libXrandr
    xorg.libXrender
    glib
    alsa-lib
  ];
}
