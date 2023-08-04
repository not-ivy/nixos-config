{ inputs, pkgs, options, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./system/persistence.nix
    ./system/network.nix
    ./system/systemd.nix
    ./system/console.nix
    ./system/users.nix
    ./system/time.nix
    ./system/sudo.nix
    ./system/xorg.nix

    ./programs/picom.nix
  ];

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  i18n.defaultLocale = "en_US.UTF-8";

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  services.dbus = {
    enable = true;
    implementation = "broker";
  };

  environment.systemPackages = with pkgs; [
    vim
    sing-box
  ];
  programs.light.enable = true;
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.extraPackages = with pkgs; [ intel-media-driver libvdpau-va-gl vaapiIntel vaapiVdpau intel-compute-runtime ];
  programs.git.enable = true;

  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
