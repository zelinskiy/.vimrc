# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  boot.loader.grub.extraEntries = ''
    menuentry "Windows" {
      chainloader (hd0,1)+1
    }
  '';

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  i18n = {
    consoleFont = "LatArCyrHeb-16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Kyiv";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    wget
    haskellPackages.Agda
    AgdaStdlib
    chromium
    coq
    feh
    ghc
    git
    gnumake
    os-prober
    emacs
    evince
    dmenu
    gmrun
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;


  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us, ru(winkeys)";
  services.xserver.xkbOptions = "eurosign:e, grp:ctrl_shift_toggle";
  services.xserver.autorun = true;
  services.xserver.xkbVariant = "winkeys";

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.windowManager.xmonad.enable = true;
  services.xserver.displayManager.sessionCommands = "${pkgs.feh}/bin/feh --bg-center ~/dotfiles/wp.png &";

  services.xserver.libinput = {
    enable = true;
    middleEmulation = true;
    tapping = true;
    naturalScrolling = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.nik = {
    isNormalUser = true;
    uid = 1000;
    group = "wheel";
    home = "/home/nik";
    name = "nik";
    createHome = true;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";
  
}
