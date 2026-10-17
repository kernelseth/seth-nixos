{ config, pkgs, ... }:

{
  # Kernel Setup - Configured for Intel Ice Lake Stability
  boot.kernelPackages = pkgs.linuxPackages_6_12;

  # Disable Panel Self Refresh (PSR) & Framebuffer Compression (FBC)
  # to prevent HDMI hotplug freezes
  boot.kernelParams = [
    "i915.enable_psr=0"
    "i915.enable_fbc=0"
    "i915.fastboot=1"
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
