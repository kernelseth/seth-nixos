{ config, pkgs, ... }:

{
  # Desktop & Display Drivers
  services.xserver.enable = true;

  # Generic modesetting driver for Intel graphics
  services.xserver.videoDrivers = [ "modesetting" ];
  hardware.graphics.enable = true;

  # Display manager
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    enableHidpi = true;
  #  theme = "breeze";
  };

  services.displayManager.defaultSession = "plasma";

  # KDE Plasma 6
  services.desktopManager.plasma6.enable = true;

  # LXQt
  services.xserver.desktopManager.lxqt.enable = true;

  # X11 keyboard layout
  services.xserver.xkb = {
    layout = "es";
    variant = "";
  };

  # OBS Wayland screen capture / desktop portal
  xdg.portal = {
    enable = true;

    extraPortals = [
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];
  };
}
