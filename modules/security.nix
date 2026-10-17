{ config, pkgs, ... }:

{
  # Firewall
  networking.firewall = {
    enable = true;

    allowedUDPPorts = [
      6672
      61455
      61456
      61457
      61458
    ];
  };

  # File descriptor limit
  security.pam.loginLimits = [
    {
      domain = "*";
      type = "hard";
      item = "nofile";
      value = "524288";
    }
  ];
}
