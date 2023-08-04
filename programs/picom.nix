{inputs, pkgs, lib, ...}: {
  services.picom = {
    enable = true;
    backend = "egl";
    vSync = true;
    shadow = true;
  };
}
