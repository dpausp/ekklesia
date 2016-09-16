{ pkgs ? import <nixpkgs> {} }:
let
 req = pkgs.callPackage ./requirements.nix {};

in req.interpreter
