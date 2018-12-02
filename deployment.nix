{
  network.description = "Hackeriet Servers";
  nux =
    { resources, ... }:
    {
      imports = [
        ./nux/configuration.nix
      ];

      deployment.targetHost = "185.35.202.197";
    };
}


