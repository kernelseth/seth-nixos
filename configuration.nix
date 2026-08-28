# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # Hardware configuration
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  # Kernel Setup - Configured for Intel Ice Lake Stability
  boot.kernelPackages = pkgs.linuxPackages_6_12;

  # Disable Panel Self Refresh (PSR) & Framebuffer Compression (FBC) to prevent HDMI hotplug freezes
  boot.kernelParams = [
    "i915.enable_psr=0"
    "i915.enable_fbc=0"
    "i915.fastboot=1"
  ];


  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # Networking
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.networkmanager = {
    enable = true;
    dns = "none";
  };

  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
  ];


  # Time and locale
  time.timeZone = "America/Argentina/Buenos_Aires";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_AR.UTF-8";
    LC_IDENTIFICATION = "es_AR.UTF-8";
    LC_MEASUREMENT = "es_AR.UTF-8";
    LC_MONETARY = "es_AR.UTF-8";
    LC_NAME = "es_AR.UTF-8";
    LC_NUMERIC = "es_AR.UTF-8";
    LC_PAPER = "es_AR.UTF-8";
    LC_TELEPHONE = "es_AR.UTF-8";
    LC_TIME = "es_AR.UTF-8";
  };


  # Desktop & Display Drivers
  services.xserver.enable = true;

  # Force clean generic modesetting driver instead of legacy Intel drivers
  services.xserver.videoDrivers = [ "modesetting" ];
  hardware.graphics.enable = true;

  # Enable Desktop Environments and Login Manager.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.desktopManager.lxqt.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "es";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "es";


  # Printing
  # Enable CUPS to print documents.
  services.printing.enable = true;


  # Audio
  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  # User
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."seth" = {
    isNormalUser = true;
    description = "seth";
    extraGroups = [ "networkmanager" "wheel" ];

    packages = with pkgs; [
      kdePackages.kate
    ];
  };


  # Programs
  programs.firefox.enable = true;
  programs.steam.enable = true;
  programs.git.enable = true;


  # Virtualization
  virtualisation.waydroid.enable = true;


  # Services
  services.flatpak.enable = true;


  # Unfree packages
  nixpkgs.config.allowUnfree = true;

  # Insecure packages
  nixpkgs.config.permittedInsecurePackages = [
  ];


  # System packages
  environment.systemPackages = with pkgs; [
    prismlauncher
    fastfetch
    discord
    flatpak
    steam
    waydroid
    stremio-linux-shell
    obs-studio
    unrar
  ];

  # NixOS version
  system.stateVersion = "26.05";
}
