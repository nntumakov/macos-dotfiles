{pkgs, ...}: {
  hm.home.packages = with pkgs; [
    tmux
    nerdfonts
    neovim
    ripgrep
    lazygit
    gdu
    bottom
  ];
}
