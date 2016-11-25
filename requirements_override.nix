{ pkgs, python }:

let
  inherit (pkgs) pythonPackages;
in

self: super: rec {
  six = pythonPackages.six;

  pyjade = super.pyjade.override (attrs: {
    postInstall = "sed -i '/__main__/i import configurations; configurations.setup()' $out/bin/pyjade";
  });

  psycopg2 = super.psycopg2.override (attrs: {
    buildInputs = with super; [pkgs.postgresql];
  });

  scrypt = super.scrypt.override (attrs: {
    buildInputs = with super; [pkgs.openssl];
  });

  cryptography = super.cryptography.override (attrs: {
    buildInputs = with super; [pkgs.openssl];
  });

  cffi = super.cffi.override (attrs: {
    buildInputs = with super; [pkgs.libffi];
  });

  django-braces = super.cryptography.override (attrs: {
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/e4/8c/6244960c86a894cbad8a29433a37f527dc3016f845fe41e34deb2e686ca8/django-braces-1.10.0.tar.gz";
      sha256 = "1ixab5r359rbggbfn8lgrj3l8hkhsr899m6kghxc0rg667q8lh1g";
    };
  });

  lockfile = python.overrideDerivation super."lockfile" (old: {
    buildInputs = old.buildInputs ++ [ self."pbr" ];
  });

  kryptomime = python.mkDerivation {
    propagatedBuildInputs = [ pythonPackages.subprocess32 self.gnupg self.six ];
    name = "kryptomime-0.5.0";
    src = pkgs.fetchFromGitHub {
      owner = "ttanner";
      repo = "kryptomime";
      rev = "bcb49cc492f3088b0a4476da127a46aa6668ac32";
      sha256 = "1kx85sdmm0300wmcxhjhgfvxz3qhwmlkwf8q0lgbvyjzzqa3fnvh";
    };
    doCheck = false;
  };
}
