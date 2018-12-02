{ config, pkgs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
      ../common/server.nix
      ../common/users.nix
      ./net.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  time.timeZone = "Europe/Oslo";

  system.stateVersion = "18.09"; # Did you read the comment?
}
