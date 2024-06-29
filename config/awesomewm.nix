{
  pkgs, 
  inputs, 
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
