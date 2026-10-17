{ config, pkgs, ... }:

{
  # Kernel / VM tuning
  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
    "vm.watermark_boost_factor" = 0;
    "vm.watermark_scale_factor" = 125;
    "kernel.split_lock_mitigate" = 0;
    "vm.max_map_count" = 2147483642;
  };
}
