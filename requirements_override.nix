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
