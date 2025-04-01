{...}: {
  homebrew = {
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
    };

    enable = true;
    
    casks = [
      "alacritty"
      "chatgpt"
      "logseq"
      "obs"
      "obsidian"
      "pomatez"
      "stats"
      "syncthing"
      "telegram"
      "thunderbird"
      "yandex-music"
    ];
  };
}
