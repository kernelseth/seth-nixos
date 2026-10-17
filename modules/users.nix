{ config, pkgs, ... }:

{
  # User
  users.users."seth" = {
    isNormalUser = true;
    description = "seth";

    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
