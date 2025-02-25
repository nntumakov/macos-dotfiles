{...}: {
  homebrew = {
    enable = true;

    brews = [
      "clamav"
      "clang-format"
      "cmake"
      "llvm"
      "ninja"
    ];
    
    casks = [
      "alacritty"
      "chatgpt"
      "kitty"
      "logseq"
      "obs"
      "syncthing"
      "thunderbird"
      "obsidian"
      "telegram"
    ];
  };
}
