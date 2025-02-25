{pkgs, ...}: {
  hm.home.packages = with pkgs; [
    djvu2pdf
    jellyfin-ffmpeg
  ];
}
