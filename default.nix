{ pkgs ? (import <nixpkgs> {}), pythonPackages ? pkgs.python27Packages }:
let
  elem = builtins.elem;
  basename = path: with pkgs.lib; last (splitString "/" path);
  startsWith = prefix: full: let
    actualPrefix = builtins.substring 0 (builtins.stringLength prefix) full;
  in actualPrefix == prefix;

  src-filter = path: type: with pkgs.lib;
    let
      ext = last (splitString "." path);
    in
      !elem (basename path) [".git" "__pycache__" ".eggs"] &&
      !elem ext ["egg-info" "pyc"] &&
      !startsWith "result" path;

  arguments-src = builtins.filterSource src-filter ./.;

  pythonPackagesWithLocals = pythonPackages.override (a: {
    self = pythonPackagesWithLocals;
  })
  // deps;

  gen_deps = (scopedImport {
    self = pythonPackagesWithLocals;
    super = pythonPackages;
    inherit pkgs;
    inherit (pkgs) fetchurl fetchgit;
  } ./python-packages.nix);

  pbr = pythonPackages.buildPythonPackage {
    name = "pbr-1.8.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/source/p/pbr/pbr-1.8.1.tar.gz";
      md5 = "c8f9285e1a4ca6f9654c529b158baa3a";
    };
    doCheck = false;
  };

  overrides = {
    psycopg2 = gen_deps.psycopg2.override (attrs: {
      buildInputs = [pkgs.postgresql94];
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
  };

  deps = gen_deps // overrides;

  ekklesia = pythonPackages.buildPythonPackage {
    propagatedBuildInputs = builtins.attrValues deps;
    name = "ekklesia-0.1";
    src = arguments-src;
  };

in ekklesia
