{
  network.description = "Hackeriet Ops";
  nux =
    { resources, ... }:
    {
      imports = [
        ./nux/configuration.nix
        ./roles/grafana.nix
        ./roles/wireguard.nix
      ];
      deployment.targetHost = "185.35.202.197";
    };
}


