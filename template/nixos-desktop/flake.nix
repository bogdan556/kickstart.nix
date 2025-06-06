{
  description = "Example kickstart NixOS desktop environment.";

  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = inputs @ {
    self,
    home-manager,
    nixpkgs,
    ...
  }: let
    nixos-system = import ./system/nixos.nix {
      inherit inputs;
      username = throw "<enter username in flake.nix>"; # TODO: replace with user name and remove throw
      password = throw "<enter password in flake.nix>"; # TODO: replace with password and remove throw
      desktop = "gnome"; # optional: "gnome" by default, or "plasma5" for KDE Plasma
    };
  in {
    nixosConfigurations = {
      aarch64 = nixos-system "aarch64-linux";
      x86_64 = nixos-system "x86_64-linux";
    };
  };
}
