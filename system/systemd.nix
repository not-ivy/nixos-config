{config, lib, pkgs, ...}: {
  systemd.services."sing-box" = {
    description = "the universal proxy platform";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs."sing-box"}/bin/sing-box run -C /etc/sing-box";
      ExecStop = "pkill sing-box";
      Restart = "on-failure";
    };
    wantedBy = [ "default.target" ];
    after = [ "network.target" ];
  };
}
