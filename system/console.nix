{config, lib, pkgs, ...}: {
  services.kmscon = {
    enable = true;
    hwRender = true;
    fonts = [
      { name = "Monoid"; package = pkgs.monoid; }
    ];
    extraConfig = ''
      font-dpi=227;
    '';
  };

  # console = {
  #   earlySetup = true;
  #   font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
  #   packages = with pkgs; [ terminus_font ];
  #   keyMap = "us";
  # };
}
