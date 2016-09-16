{ pkgs ? import <nixpkgs> {}
}:
let
  inherit (pkgs) lib pythonPackages;
  inherit (builtins) elem;
  basename = path: with pkgs.lib; last (splitString "/" path);
  src-filter = path: type: with pkgs.lib;
    let
      ext = last (splitString "." path);
    in
      !elem (basename path) [".git" "__pycache__" ".eggs" "result"] &&
      !elem ext ["egg-info" "pyc"];

  ekklesia-src = builtins.filterSource src-filter ./.;

  python = import ./requirements.nix { inherit pkgs; };

  gnupg1 = pkgs.gnupg1orig;
  nixpkgs_deps = [pkgs.sassc gnupg1 ] ++ lib.optional lib.inNixShell [ pythonPackages.ipdb pythonPackages.ipython ];


  ekklesia = python.mkDerivation rec {
    propagatedBuildInputs = with python.packages; nixpkgs_deps
    ++ [
      amqp
      anyjson
      billiard
      django-braces
      Django
      Markdown
      SQLAlchemy
      alembic
      celery
      configobj
      django-admin-bootstrapped
      django-configurations
      django-cors-headers
      django-countries
      django-crispy-forms
      django-extensions
      django-oauth-toolkit
      django-otp
      django-recaptcha
      django-redis
      django-scrypt
      django-treebeard
      djangorestframework
      jsonfield
      kombu
      kryptomime
      ndg-httpsclient
      pythonPackages.pillow
      psutil
      psycopg2
      py-bcrypt
      pyOpenSSL
      pyasn1
      pytz
      pythonPackages.requests2
      six
      unicodecsv
    ];

    buildInputs = with python.packages; [
      libsass
      pyjade
    ];

    name = "ekklesia-0.1";
    src = ekklesia-src;
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
      for x in `find -type d -name templates`; do
          echo copying HTML templates from $x
          (cd $x && find -name '*.html' -exec cp -v --parents {} $out/share/templates \;) 
      done
      mv identity/static.prod $out/share/www/

      echo $PYTHONPATH
      echo $PATH
    '';
  };

in ekklesia
