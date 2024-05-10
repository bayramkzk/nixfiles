{ inputs, lib, config, pkgs, ... }:

{
  imports = [];

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  gtk = {
    enable = true;
    font.name = "Noto Sans Condensed Medium";
    iconTheme = {
      name = "Papirus-Light";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk3";
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  home = {
    username = "barry";
    homeDirectory = "/home/barry";
  };

  home.packages = with pkgs; [
    gh
    brightnessctl
    ranger
    pyenv
    alejandra
    python3
    gcc
    tldr
    acpi
    pandoc

    kitty
    alacritty
    wofi
    mako
    wl-clipboard
    cliphist
    xsettingsd
    darkman
    pavucontrol
    nwg-look
    nextcloud-client
    flameshot
    cloudflared

    firefox
    discord
    prismlauncher
    jdk21
    remmina
    gimp
  ];

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      rebuild = "sudo nixos-rebuild switch --flake path:$HOME/Nixfiles";
      rebuildhome = "home-manager switch --flake path:$HOME/Nixfiles";
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };

  programs.atuin = {
    enable = true;
    flags = ["--disable-up-arrow"];
  };

  programs.git = {
    enable = true;
    userName = "bayramkzk";
    userEmail = "48856944+bayramkzk@users.noreply.github.com";
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";
}
