{
  config,
  pkgs,
  ...
}:
{
  hm.home.packages = [
    pkgs.telegram-desktop
  ];
}
