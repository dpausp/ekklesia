args @ { pkgs ? (import <nixpkgs> {}), pythonPackages ? pkgs.python27Packages, djangoVersion ? "1.7" }:
builtins.trace args
(import ./ekklesia.nix {inherit pkgs pythonPackages djangoVersion; }).ekklesiaenv

