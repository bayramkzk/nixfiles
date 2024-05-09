{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [];

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
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
    neovim
    python3

    kitty
    alacritty
    wofi
    mako
    wl-clipboard
    cliphist
    xsettingsd
    darkman
    papirus-icon-theme
    pavucontrol
    nwg-look

    firefox
    discord
    prismlauncher
    jdk21
  ];

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      rebuild = "sudo nixos-rebuild switch --flake ~/Nixfiles/";
      rebuildhome = "home-manager switch --flake ~/Nixfiles/";
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };

  programs.atuin = {
    enable = true;
    flags = [ "--disable-up-arrow" ];
  };

  programs.git = {
    enable = true;
    userName = "bayramkzk";
    userEmail = "48856944+bayramkzk@users.noreply.github.com";
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";
}
