#vim: ts=2:sw=2:rnu:expandtab

{ ... }:

{
  imports = [
    ./apps/bash
    ./apps/git
    ./apps/firefox
    ./apps/kitty
    ./apps/neovim
    ./themes/gtk-qt.nix
  ];

  home = {
    stateVersion = "23.11";
    username = "chuck";
    homeDirectory = "/home/chuck";
  };

  programs.home-manager.enable = true;

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  systemd.user.startServices = "sd-switch";
}
