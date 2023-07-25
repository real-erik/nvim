{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [
    pkgs.lua
    pkgs.just
		pkgs.watchexec
  ];
}


