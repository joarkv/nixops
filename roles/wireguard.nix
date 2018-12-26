{ config, pkgs, ... }:
{

  networking.firewall.allowedUDPPorts = [ 51820 ];
  networking.nat.enable = true;
  networking.nat.externalInterface = "ens18";
  networking.nat.internalInterfaces = [ "wg0" ];

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.31.42.1/24" ];
      listenPort = 51820;
      privateKeyFile = "/private/wireguard-server-pk";
      peers = [

        {
          publicKey = "ut+9x79/k3JzUaIynBNsM3DEAkBBnz+dpoxwRlk9GUc=";
          allowedIPs = [ "10.31.42.100/32" ];
        }

        # {
        #  publicKey = "<add your wireguard pk here>";
        #  allowedIPs = [ "10.31.42.XXX/32" ]; # add your internal ip
        # }


      ];
    };
  };
}
