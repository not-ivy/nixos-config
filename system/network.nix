{config, lib, ...}: {
  networking.hostName = "remorse";

  systemd.network.enable = true;
  systemd.network.networks."40-wlp2s0" = {
    matchConfig.Name = "wlp2s0";
    networkConfig = {
      DHCP = "yes";
      IgnoreCarrierLoss = "3s";
    };
  };

  networking.wireless.enable = true;
  networking.wireless.environmentFile = "/etc/wpa_supplicant/wireless.env";
  networking.wireless.networks = {
    "1-1-201".psk = "@PSK_0@";
    "also no wifi here".psk = "@PSK_1@";
    "123456789".psk = "@PSK_2@";
    "WiFIUSD".auth = ''
      key_mgmt=WPA-EAP
      eap=PEAP
      phase2="auth=MSCHAPV2"
      identity="@IDENTITY_0@"
      password="@PASS_0@"
    '';
  };

  networking.nameservers = [ ];
  services.resolved = {
    enable = true;
    # dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [ "8.8.8.8" "1.1.1.1" "1.0.0.1" ];
    # extraConfig = ''
    #   DNSOverTLS=yes
    # '';
  };

  networking.proxy.default = "socks5://127.0.0.1:7890";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
