{ system ? builtins.currentSystem
, nixpkgs ? <nixpkgs>
}:

let

  inherit (pkgs.stdenv.lib) fix' extends;

  pkgs = import nixpkgs { inherit system; };
  pythonPackages = pkgs.python27Packages;

  python = {
    interpreter = pythonPackages.python;
    mkDerivation = pythonPackages.buildPythonPackage;
    modules = pythonPackages.python.modules;
    overrideDerivation = drv: f: pythonPackages.buildPythonPackage (drv.drvAttrs // f drv.drvAttrs);
    pkgs = pythonPackages;
  };

  generated = import ./django1.8_generated.nix { inherit pkgs python; };
  overrides = import ./django1.8_override.nix { inherit pkgs python; };

in fix' (extends overrides generated)
