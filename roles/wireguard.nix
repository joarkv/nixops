{ config, pkgs, ... }:
{

  networking.firewall.allowedUDPPorts = [ 51820 ];
  networking.nat.enable = true;
  networking.nat.externalInterface = "ens18";
  networking.nat.internalInterfaces = [ "wg0" ];

  networking.wireguard.interfaces = {
    # The servers public key is: 63NG3mMRR2R+RXtfErXcRQ8JedneNH0hB1I58ir6dlY=
    wg0 = {
      ips = [ "10.31.42.1/24" ];
      listenPort = 51820;
      privateKeyFile = "/private/wireguard-server-pk";
      peers = [

        {
          publicKey = "ut+9x79/k3JzUaIynBNsM3DEAkBBnz+dpoxwRlk9GUc=";
          allowedIPs = [ "10.31.42.100/32" ];
        }
        
        { # joarkv
        publicKey = "Wc5ZC0v6Nb5UO/c83Jrs18OUfp9g5DFf7oTjPhZ5a3c=";
        allowedIPs = [ "10.31.42.108/32"];
        }
        
        { # lassegs1
          publicKey = "msDoQv3EWw9lI8jR9ka4ZqeL4bIr1xkwruYNVh99CkM=";
          allowedIPs = [ "10.31.42.105/32" ];
        }
        { # lassegs2
          publicKey = "QB2wZ7S6toGiSwCNGeHM9+R765oA810GSiGQVEVutEk=";
          allowedIPs = [ "10.31.42.106/32" ];
        }

        # {
        #  publicKey = "<add your wireguard pk here>";
        #  allowedIPs = [ "10.31.42.XXX/32" ]; # add your internal ip
        # }


      ];
    };
  };
}
