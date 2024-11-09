{pkgs, ...}: {
  hm.home.packages = with pkgs; [
    telegram-desktop
    obsidian
    # obs-studio
  ];
}
