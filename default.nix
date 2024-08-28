# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage
{ pkgs ? import <nixpkgs> { } }: {
  # The `lib`, `modules`, and `overlays` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  example-package = pkgs.callPackage ./pkgs/example-package { };
  gear = pkgs.callPackage ./pkgs/gear { };
  wemeet = pkgs.callPackage ./pkgs/wemeet { };
  yosys-synlig = pkgs.callPackage ./pkgs/synlig { };
  probe-rs = pkgs.callPackage ./pkgs/probe-rs { };
  flutter_rust_bridge_codegen = pkgs.callPackage ./pkgs/flutter_rust_bridge_codegen { };
  dioxus-cli = pkgs.callPackage ./pkgs/dioxus-cli { };
  form = pkgs.callPackage ./pkgs/form { };
  chiptool = pkgs.callPackage ./pkgs/chiptool { };
  target-gen = pkgs.callPackage ./pkgs/target-gen { };
  # some-qt5-package = pkgs.libsForQt5.callPackage ./pkgs/some-qt5-package { };
  # ...
}
