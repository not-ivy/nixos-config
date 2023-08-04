{config, lib, pkgs, ...}: {
  services.xserver = {
    enable = true;
    libinput.enable = true;
    dpi = 227;

    displayManager = {
      sddm.enable = true;
      defaultSession = "none+awesome";
    };

    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks
        luadbi-mysql
      ];
    };
  };
}
