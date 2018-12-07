{ config, pkgs, ... }:
{
  networking.hostName = "nux";

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

  networking.firewall.allowedTCPPorts = [80 443];
  services.nginx = {
    enable = true;
    virtualHosts."nux.hackeriet.no" = {
      enableACME = true;
      forceSSL = true;
      root = "/srv/www/nux";
    };
  };

}
