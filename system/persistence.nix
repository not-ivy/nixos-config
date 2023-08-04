{ inputs, config, lib, ... }: {
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  environment.persistence."/nix/persist" = {
    # directories = [
    # ];
    files = [
      "/etc/machine-id"
      "/etc/wpa_supplicant/wireless.env"
      "/etc/sing-box/config.json"
    ];
  };
}
