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
        extraLuaConfig = ''
          ${builtins.readFile ./awesomewm/awesomewm.lua}
        '';
      };
    };
  };
}
