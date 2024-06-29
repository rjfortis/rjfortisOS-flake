{
  config,
  pkgs,
  host,
  inputs,
  options,
  ...
}:
{
  services = {
    xserver = {
      windowManager.awesome = {
        enable = true;
      };
    };
  };
}
