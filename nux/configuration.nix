{ config, pkgs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
      ../users.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  time.timeZone = "Europe/Oslo";

  environment.systemPackages = with pkgs; [
     wget vim nettools tmux screen weechat nix
  ];

  programs.mosh.enable = true;
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "yes";
  networking.firewall.enable = true;

  networking.interfaces.ens18 = {
     ipv4.addresses = [ {
       address = "185.35.202.197";
       prefixLength = 26;
     } ];
     ipv6.addresses = [ {
       address = "2a02:ed06::197";
       prefixLength = 64;
     } ];
  };
  networking.defaultGateway = "185.35.202.193";
  networking.defaultGateway6.address = "2a02:ed06::1";
  networking.nameservers =  ["1.1.1.1"];
  networking.hostName = "nux";

  system.stateVersion = "18.09"; # Did you read the comment?
}
