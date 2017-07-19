{ pkgs, python }:

self: super: {
  pyjade = super.pyjade.override (old: {
    postInstall = "sed -i '/__main__/i import configurations; configurations.setup()' $out/bin/pyjade";
  });

  "django-oauth-toolkit" = python.overrideDerivation super."django-oauth-toolkit" (old: {
    patchPhase = "echo > README.rst";
  });

  kryptomime = python.mkDerivation {
    propagatedBuildInputs = [ self.gnupg self.six ];
    name = "kryptomime-0.5.0";
    src = pkgs.fetchFromGitHub {
      owner = "ttanner";
      repo = "kryptomime";
      rev = "bcb49cc492f3088b0a4476da127a46aa6668ac32";
      sha256 = "1kx85sdmm0300wmcxhjhgfvxz3qhwmlkwf8q0lgbvyjzzqa3fnvh";
    };
    doCheck = false;
  };

  "logging-tree" = python.mkDerivation {
    name = "logging-tree-1.7";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/31/64/d014398666f51237f8213c4b55f0c025a61ffaba72cfa567e4d761ecb8da/logging_tree-1.7.tar.gz"; sha256 = "3df68a170f30386e58bbea330d27c6a6ce88681919b35080deac8ec69458973e"; };
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Introspect and display the logger tree inside \"logging\"";
    };
  };
}
