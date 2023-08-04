{config, lib, options, ...}: {
  # time.timeZone = "America/Los_Angeles";
  time.timeZone = "Asia/Shanghai";
  networking.timeServers = [ "pool.ntp.org" ] ++ options.networking.timeServers.default;
}
