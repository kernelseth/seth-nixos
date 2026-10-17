{ config, pkgs, ... }:

{
  # Compressed RAM swap
  zramSwap = {
    enable = true;
    algorithm = "lz4";
    memoryPercent = 50;
    priority = 100;
  };

  # 12 GB disk swap
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 12 * 1024;
      priority = 1;
    }
  ];
}
