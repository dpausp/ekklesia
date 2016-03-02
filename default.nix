args @ { pkgs ? (import <nixpkgs> {}), pythonPackages ? pkgs.python27Packages, djangoVersion ? "1.8" }:
builtins.trace args
(import ./ekklesia.nix {inherit pkgs pythonPackages djangoVersion; }).ekklesia 

