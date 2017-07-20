{ pkgs ? import ./requirements/nixpkgs.nix }:
let
  inherit (pkgs) lib python36Packages;
  
  basename = path: with pkgs.lib; with builtins; last (splitString "/" path);
  src-filter = path: type: with pkgs.lib;
    let
      ext = last (splitString "." path);
    in
      !elem (basename path) [".git" "__pycache__" ".eggs" "result"] &&
      !elem ext ["egg-info" "pyc" "nix" ];

  src = builtins.filterSource src-filter ./.;

  python = import ./requirements/requirements.nix { inherit pkgs; };
  gnupg1 = pkgs.gnupg1orig;
  deps = builtins.attrValues python.packages ++ [ gnupg1 python36Packages.pillow ] ++ lib.optional lib.inNixShell [ ];


  ekklesia = python.mkDerivation rec {
    pname = "ekklesia";
    version = "0.1";
    name = "${pname}-${version}";
    inherit src;

    propagatedBuildInputs = deps;
    doCheck = false;

    buildInputs = with python.packages; [
      pkgs.sassc
      libsass
      pyjade
    ];

    postBuild = ''
      make clean
      mkdir -p static/css
      pushd identity
      OLD_PP=$PYTHONPATH
      export DJANGO_CONFIGURATION=Build 
      export DJANGO_SETTINGS_MODULE=identity.nix_build_settings 
      export PYTHONPATH=$PYTHONPATH:`pwd` 
      make css
      echo $PYTHONPATH
      make html
      python manage.py collectstatic --noinput
      popd
      export PYTHONPATH=$OLD_PP
    '';

    postInstall = ''
      mkdir -p $out/share/www
      mkdir $out/share/templates
      mkdir $out/share/locale
      for x in `find -type d -name templates`; do
          echo copying HTML templates from $x
          (cd $x && find -name '*.html' -exec cp -v --parents {} $out/share/templates \;) 
          echo copying TXT templates from $x
          (cd $x && find -name '*.txt' -exec cp -v --parents {} $out/share/templates \;) 
      done
      mv identity/static.prod $out/share/www/
      echo copying locale files
      (cd identity && find locale -name '*.mo' -exec cp -v --parents {} $out/share \;)

      echo $PYTHONPATH
      echo $PATH
    '';
    shellHook = ''
      export PATH=$PATH:${gnupg1}/bin/
    '';

    passthru.python = python.interpreter.interpreter;
  };
in ekklesia
