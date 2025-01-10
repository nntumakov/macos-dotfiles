{pkgs, ...}: {
  hm.home.packages = with pkgs; [
    jellyfin-ffmpeg
    djvu2pdf
  ];
}
