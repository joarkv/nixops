# Sets up nginx, grafana, influxdb, and telegraf for Hackeriets Environment monitor. 
{ config, pkgs, ... }:

let
  grafana_domain = "grafana.hackeriet.no";
  grafana_org = "Hackeriet";
  grafana_anonymous_enable = true;
  mqtt_servers = ["tcp://matrix.hackeriet.no:1883"];
in {
  services.influxdb.enable = true;

  services.grafana = {
    enable   = true;
    domain   = grafana_domain;
    port     = 3000;
    protocol = "http";
    dataDir  = "/var/lib/grafana";
    auth.anonymous.enable   = grafana_anonymous_enable;
    auth.anonymous.org_name = grafana_org;
    analytics.reporting.enable = false;
  };

  services.telegraf = {
    enable = true;
    extraConfig = {
      agent = {
        interval = "1s";
        flush_interval = "1s";
      };
      inputs = {
        mqtt_consumer = [
          {
            topics  = ["hackeriet/environment/temp" "hackeriet/serverroom/temp"];
            name_override = "temp";
            data_format = "value";
            data_type = "float";
            servers = mqtt_servers;

          }
          {
            topics  = ["hackeriet/environment/eCO2"];
            name_override = "eCO2";
            data_format = "value";
            data_type = "integer";
            servers  = mqtt_servers;
          }
          {
            topics  = ["hackeriet/environment/tVOC"];
            name_override = "tVOC";
            data_format = "value";
            data_type = "integer";
            servers  = mqtt_servers;
          }];
        };
      outputs = {
        influxdb = {
          urls = ["http://127.0.0.1:8086"];
          database = "hackeriet";
        };
      };
    };
    };
  networking.firewall.allowedTCPPorts = [80 443];
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts."${grafana_domain}" = {
      enableACME = true;
      forceSSL = true;
      locations."/".proxyPass = "http://127.0.0.1:3000/";
    };
  };
}
