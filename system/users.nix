{inputs, lib, pkgs, ...}: {
  users.mutableUsers = false;

  users.users.root.initialHashedPassword = "$6$/crs25H4N4aRAupx$gnI5ALlEXzLa8a0.Bvp1C.A0uDzVh2RG8CuPITmFMHljIZg25x8FB9YpdedKDClsgLqMKpFFyJy/S8TmQ3Thu/";

  users.users.nora = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "docker" ];
    initialHashedPassword = "$6$/crs25H4N4aRAupx$gnI5ALlEXzLa8a0.Bvp1C.A0uDzVh2RG8CuPITmFMHljIZg25x8FB9YpdedKDClsgLqMKpFFyJy/S8TmQ3Thu/";
  };

  programs.fuse.userAllowOther = true;
}
