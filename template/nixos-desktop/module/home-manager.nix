{pkgs, ...}: {
  # add home-manager user settings here
  home.packages = with pkgs; [git neovim];
  home.stateVersion = "24.11";
}
