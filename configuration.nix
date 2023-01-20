# NixOS Configuration

  { config, pkgs, ... }:

  {
    imports =
      [ 
        ./hardware-configuration.nix
      ];

  
# Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


# Networking
  networking.hostName = "george-nixos"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.


# Set your time zone.
  time.timeZone = "Europe/London";


# Services
  # hardware
  services.printing.enable = true; # CUPS for printing
  sound.enable = true; # sound
  hardware.pulseaudio.enable = true; # sound
  hardware.bluetooth.enable = true; # bluetooth
  hardware.enableAllFirmware = true; # all firmware
  hardware.enableRedistributableFirmware = true; # redistributable firmware
  services.xserver.libinput.enable = true; # touchpad
  services.fprintd.tod.enable = true; # fingerprint (not working)
  # gnome desktop environment
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # x11 windowing system
  services.xserver = {
    enable = true;
    layout = "gb";
  };


  #  Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.georgeallenryan = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.bash;
    packages = with pkgs; [
     # firefox
     # thunderbird
    ];
  };


# Disable sudo password for the wheel grouo
  security.sudo.wheelNeedsPassword = false;


# Check SMART status of all disks and notify in case of errors
  services.smartd = {
    enable = true;
    notifications = {
      x11.enable = if config.services.xserver.enable then true else false;
      wall.enable = true;
    };
  };


# Allow unfree packages
  nixpkgs.config.allowUnfree = true;


# Allow unsecure packages
  nixpkgs.config.permittedInsecurePackages = [
    "electron-12.2.3"
  ];


# Configure system packages
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    wget
    gparted
    rsync
    tree
    file
    speedtest-cli
    google-cloud-sdk
    lazygit
    docker-compose
    geekbench
    whois
    openvpn
    pavucontrol
    google-chrome
    spotify
    filezilla
    gimp
    kodi
    unzip
    zip
    mdbook     
    vlc
    teams
    drive
    qbittorrent
    notepadqq
    virtualbox
    minecraft
    netflix
    etcher
    bluemail
    extremetuxracer
    freecad
    mangohud
    betterdiscord-installer
    fswebcam
    audacity
    lutris
    oneko # cat cursor
    canon-cups-ufr2 # cups driver for canon printers
    prusa-slicer
    cura
    bitwarden
    # gnome stuff
    pkgs.gnome3.gnome-tweaks
    gnomecast
    gnome.gnome-weather
    gnome.nautilus
    gnome.file-roller
    gnome.gnome-sound-recorder
    gnomeExtensions.dash-to-panel
      
  ];


# Docker
  virtualisation.docker.enable = true;


# Some programs need SUID wrappers, can be configured further or are started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };


# System
  system.stateVersion = "22.11";
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

}

