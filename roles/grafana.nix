{ config, pkgs, ... }:
{
  services.grafana = {
    enable   = true;
    port     = 3000;
    domain   = "grafana.hackeriet.no";
    protocol = "http";
    dataDir  = "/var/lib/grafana";
  };
  networking.firewall.allowedTCPPorts = [80 443];
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts."nux.hackeriet.no" = {
      enableACME = true;
      forceSSL = true;
      root = "/srv/www/nux";
    };
    virtualHosts."grafana.hackeriet.no" = {
      enableACME = true;
      forceSSL = true;
      locations."/".proxyPass = "http://127.0.0.1:3000/";
    };
  };
}
