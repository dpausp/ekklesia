{ pkgs, python }:

let
  elem = builtins.elem;
  basename = path: with pkgs.lib; last (splitString "/" path);

  pythonPackages = pkgs.pythonPackages;

  src-filter = path: type: with pkgs.lib;
    let
      ext = last (splitString "." path);
    in
      !elem (basename path) [".git" "__pycache__" ".eggs" "result"] &&
      !elem ext ["egg-info" "pyc"];

  ekklesia-src = builtins.filterSource src-filter ./.;

  lib = pkgs.lib;
  
  nixpkgs_deps = [pkgs.sassc pkgs.gnupg1orig ] ++ lib.optional lib.inNixShell [ pythonPackages.ipdb pythonPackages.ipython ];

in

self: super: rec {
  setuptools-scm = python.mkDerivation {
    name = "setuptools-scm-1.8.0";
    src = pkgs.fetchurl {
      url = https://pypi.python.org/packages/76/ac/0d97955afce837b065b8f2699d67f2e93b5f48b76f9e89c20dfeebb42ef7/setuptools_scm-1.8.0.tar.bz2;
      md5 = "49e83e8fee9ac1d356a634707a62e294";
    };  
    doCheck = false;
  }; 

  lockfile = super.lockfile.override (attrs: {
    buildInputs = with super; [pbr];
  });

  #pytest-django = super.pytest-django.override (attrs: {
  #  buildInputs = with super; [setuptools-scm];
  #});

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

  kryptomime = super.kryptomime.override {
    src = pkgs.fetchgit {
      url = "https://github.com/ttanner/kryptomime";
      rev = "bcb49cc492f3088b0a4476da127a46aa6668ac32";
      sha256 = "16mpkjcp38lifl1b3cpyp91ch33nzhhd1wk72ikw89plwq096v3w";
    };
  };

  ekklesia = python.mkDerivation rec {
    propagatedBuildInputs = with self; nixpkgs_deps
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
      django-agpl
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
      gnupg
      jsonfield
      kombu
      kryptomime
      libsass
      ndg-httpsclient
      pythonPackages.pillow
      psutil
      psycopg2
      py-bcrypt
      pyOpenSSL
      pyasn1
      pyjade
      pytz
      pythonPackages.requests2
      six
      unicodecsv
    ];

    name = "ekklesia-0.1";
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

  ekklesiaenv = pythonPackages.python.buildEnv.override {
    extraLibs = ekklesia.propagatedBuildInputs;
    ignoreCollisions = true;
  };
}
