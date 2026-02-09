{ pkgs }:

let
  litecoinSharedConfig = {
    stdenv = pkgs.gcc14Stdenv;
    boost = pkgs.boost183;
    miniupnpc =
      (import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/nixos-22.11.tar.gz";
      }) { }).miniupnpc;
  };

  litecoinQt5Config = {
    inherit (pkgs.libsForQt5.qt5) qtbase qttools wrapQtAppsHook;
  };
in
{
  litecoin = pkgs.callPackage ./package.nix (
    litecoinSharedConfig // litecoinQt5Config // { withGui = true; }
  );

  litecoin-cli = pkgs.callPackage ./package.nix (litecoinSharedConfig // { withGui = false; });
}
