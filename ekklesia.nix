{ pkgs, pythonPackages, djangoVersion }:

  assert pkgs.lib.any (x: x == djangoVersion) ["1.7" "1.8"];

let
  importPath = if djangoVersion == "1.7" then ./python-packages_django1.7.nix else ./python-packages_django1.8.nix;
  elem = builtins.elem;
  basename = path: with pkgs.lib; last (splitString "/" path);

  src-filter = path: type: with pkgs.lib;
    let
      ext = last (splitString "." path);
    in
      !elem (basename path) [".git" "__pycache__" ".eggs" "result"] &&
      !elem ext ["egg-info" "pyc"];

  ekklesia-src = builtins.filterSource src-filter ./.;

  gen_deps = (scopedImport {
    self = pythonPackages // deps;
    super = pythonPackages;
    inherit pkgs;
    inherit (pkgs) fetchurl fetchgit;
  } importPath);

  pbr = pythonPackages.buildPythonPackage {
    name = "pbr-1.8.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/source/p/pbr/pbr-1.8.1.tar.gz";
      md5 = "c8f9285e1a4ca6f9654c529b158baa3a";
    };
    doCheck = false;
  };

  overrides = rec {
    psycopg2 = gen_deps.psycopg2.override (attrs: {
      propagatedBuildInputs = [pkgs.postgresql];
    });

    uwsgi = gen_deps.uwsgi.override (attrs: {
      buildInputs = [pkgs.ncurses];
    });

    lockfile = gen_deps.lockfile.override (attrs: {
      buildInputs = [pbr];
    });

    scrypt = gen_deps.scrypt.override (attrs: {
      buildInputs = [pkgs.openssl];
    });
  
    cryptography = gen_deps.cryptography.override (attrs: {
      buildInputs = [pkgs.openssl];
    });
  
    Pillow = gen_deps.Pillow.override (attrs: {
      buildInputs = [pkgs.zlib pkgs.libjpeg pkgs.libtiff pkgs.freetype pkgs.lcms2];
        # NOTE: we use LCMS_ROOT as WEBP root since there is not other setting for webp.
      preConfigure = ''
        sed -i "setup.py" \
            -e 's|^FREETYPE_ROOT =.*$|FREETYPE_ROOT = _lib_include("${pkgs.freetype}")|g ;
                s|^JPEG_ROOT =.*$|JPEG_ROOT = _lib_include("${pkgs.libjpeg}")|g ;
                s|^ZLIB_ROOT =.*$|ZLIB_ROOT = _lib_include("${pkgs.zlib}")|g ;
                s|^LCMS_ROOT =.*$|LCMS_ROOT = _lib_include("${pkgs.libwebp}")|g ;
                s|^TIFF_ROOT =.*$|TIFF_ROOT = _lib_include("${pkgs.libtiff}")|g ;
                s|^TCL_ROOT=.*$|TCL_ROOT = _lib_include("${pkgs.tcl}")|g ;'
      '';
    });
  
    cffi = gen_deps.cffi.override (attrs: {
      buildInputs = [pkgs.libffi];
    });
  
    kryptomime = gen_deps.kryptomime.override (attrs: {
      src = pkgs.fetchurl {
        url = "https://github.com/ttanner/kryptomime/archive/master.zip";
        sha256 = "0k8srjzwfvnbzb2n6m17fm656xljl52rway7nj9jskn8ri73inza";
      }; 
    });

    setuptools = pkgs.pythonPackages.setuptools;

    setuptools-scm = pkgs.buildPythonPackage {
      name = "setuptools-scm-1.7.0";
      src = pkgs.fetchurl {
        url = "https://pypi.python.org/packages/source/s/setuptools_scm/setuptools_scm-1.7.0.tar.gz";
        md5 = "d0423feeabda9c6a869d963cdc397d64";
      };  
      doCheck = false;
    }; 

    execnet = gen_deps.execnet.override (attrs: {
      buildInputs = [setuptools-scm];
    });
  };

  deps = gen_deps // overrides;
  
  lib = pkgs.lib;
  
  nixpkgs_deps = [pkgs.sassc pkgs.gnupg1orig ]; # ++ lib.optional lib.inNixShell [ pythonPackages.ipdb ];

  ekklesia = pythonPackages.buildPythonPackage rec {
    propagatedBuildInputs = builtins.attrValues deps ++ nixpkgs_deps;
    name = "ekklesia-0.1-django${djangoVersion}";
    src = ekklesia-src;
    postBuild = ''
      make html
      cd identity
      make html
      DJANGO_CONFIGURATION=Build DJANGO_SETTINGS_MODULE=identity.nix_build_settings python manage.py collectstatic --noinput
      cd ..
    '';

    postInstall = ''
      mkdir -p $out/share/www
      mkdir -p $out/share/templates
      for x in `find -type d -name templates`; do
            echo copying HTML templates from $x
            (cd $x && find -name '*.html' -exec cp -v --parents {} $out/share/templates \;) 
      done
      sleep 5
      mv identity/static.prod $out/share/www/
      echo $PYTHONPATH
      echo $PATH
    '';

  };

  ekklesiaenv = pkgs.python.buildEnv.override {
    extraLibs = builtins.attrValues deps;
    ignoreCollisions = true;
  };

in { inherit ekklesia; inherit ekklesiaenv; }
