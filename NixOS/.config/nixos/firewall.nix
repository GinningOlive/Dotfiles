{ config, pkgs, ... }:

{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 7000 7001 7100
    53317 # LocalSend
     ];
    allowedUDPPorts = [ 5353 6000 6001 7011 ];
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
  };
}

# LocalShare
# https://www.reddit.com/r/NixOS/comments/18kq1en/comment/kdvddt7/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
