{ config, pkgs, ... }:

{
  # Networking
  networking.hostName = "nixos";

  networking.networkmanager = {
    enable = true;
    dns = "none";
  };

  networking.firewall.allowedTCPPorts = [ 18080 ];

  # BattleEye-related host blocks
  networking.hosts = {
    "0.0.0.0" = [
      "paradise-s1.battleye.com"
      "test-s1.battleye.com"
      "paradiseenhanced-s1.battleye.com"
    ];
  };

  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
  ];
}
