{ inputs, lib, config, pkgs, ... }: {
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  programs.home-manager.enable = true;

  home.persistence."/nix/persist/home/nora" = {
    directories = [
      ".ssh"
      "Downloads"
      ".config/awesome"
      ".librewolf"
      ".cache"
    ];
    allowOther = true;
  };

  home.packages = with pkgs; [
    pinentry-qt
  ];

  xresources.properties = {
    "Xft.dpi" = 227;
    "Xcursor.size" = 48;
  };

  programs.git = {
    enable = true;
    userName = "ivy";
    userEmail = "ivy@not-ivy.dev";
  };

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";
  };

  programs.librewolf.enable = true;
  programs.alacritty.enable = true;
  programs.helix = {
    enable = true;
  #  defaultEditor = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
