{ config, lib, pkgs, ...}:
{
  programs.fish.enable = true;
  services.haveged.enable = true;
  environment.systemPackages = with pkgs; [
    coreutils moreutils htop
    screen tmux wget gnupg dnsutils
    file ag git emacs26-nox vim
  ];
  programs.mosh.enable = true;
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "yes";
  services.fail2ban.enable = true;
  networking.firewall.enable = true;
}
