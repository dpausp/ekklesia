# generated using pypi2nix tool (version: 1.8.0)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -V 3.6 -r pypi2nix.txt -E openssl postgresql libffi 
#

{ pkgs ? import <nixpkgs> {}
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell;

  pythonPackages =
  import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv;
    python = pkgs.python36;
    # patching pip so it does not try to remove files when running nix-shell
    overrides =
      self: super: {
        bootstrapped-pip = super.bootstrapped-pip.overrideDerivation (old: {
          patchPhase = old.patchPhase + ''
            sed -i               -e "s|paths_to_remove.remove(auto_confirm)|#paths_to_remove.remove(auto_confirm)|"                -e "s|self.uninstalled = paths_to_remove|#self.uninstalled = paths_to_remove|"                  $out/${pkgs.python35.sitePackages}/pip/req/req_install.py
          '';
        });
      };
  };

  commonBuildInputs = with pkgs; [ openssl postgresql libffi ];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreter = pythonPackages.buildPythonPackage {
        name = "python36-interpreter";
        buildInputs = [ makeWrapper ] ++ (builtins.attrValues pkgs);
        buildCommand = ''
          mkdir -p $out/bin
          ln -s ${pythonPackages.python.interpreter}               $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "               (builtins.attrValues pkgs)}; do
            if [ -d "$dep/bin" ]; then
              for prog in "$dep/bin/"*; do
                if [ -f $prog ]; then
                  ln -s $prog $out/bin/`basename $prog`
                fi
              done
            fi
          done
          for prog in "$out/bin/"*; do
            wrapProgram "$prog" --prefix PYTHONPATH : "$PYTHONPATH"
          done
          pushd $out/bin
          ln -s ${pythonPackages.python.executable} python
          popd
        '';
        passthru.interpreter = pythonPackages.python;
      };
    in {
      __old = pythonPackages;
      inherit interpreter;
      mkDerivation = pythonPackages.buildPythonPackage;
      packages = pkgs;
      overrideDerivation = drv: f:
        pythonPackages.buildPythonPackage (drv.drvAttrs // f drv.drvAttrs);
      withPackages = pkgs'':
        withPackages (pkgs // pkgs'');
    };

  python = withPackages {};

  generated = self: {

    "Django" = python.mkDerivation {
      name = "Django-1.8.18";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/58/df/55c6e7761a8c144f5bf9629ed3f066dc9fbe39df3f7a1ca4af093a0911ba/Django-1.8.18.tar.gz"; sha256 = "c7611cdd5e2539a443b7960c7cafd867d986c2720a1b44808deaa60ce3da50c7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.djangoproject.com/";
        license = licenses.bsdOriginal;
        description = "A high-level Python Web framework that encourages rapid development and clean, pragmatic design.";
      };
    };



    "Mako" = python.mkDerivation {
      name = "Mako-1.0.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/56/4b/cb75836863a6382199aefb3d3809937e21fa4cb0db15a4f4ba0ecc2e7e8e/Mako-1.0.6.tar.gz"; sha256 = "48559ebd872a8e77f92005884b3d88ffae552812cdf17db6768e5c3be5ebbe0d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."MarkupSafe"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.makotemplates.org/";
        license = licenses.mit;
        description = "A super-fast templating language that borrows the  best ideas from the existing templating languages.";
      };
    };



    "MarkupSafe" = python.mkDerivation {
      name = "MarkupSafe-1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz"; sha256 = "a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/pallets/markupsafe";
        license = licenses.bsdOriginal;
        description = "Implements a XML/HTML/XHTML Markup safe string for Python";
      };
    };



    "SQLAlchemy" = python.mkDerivation {
      name = "SQLAlchemy-1.1.10";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a7/8c/cc24b9794ffa87506aedf528ba3a236e11cc537f81a1e3b52193e5e948cd/SQLAlchemy-1.1.10.tar.gz"; sha256 = "dbd92b8af2306d600efa98ed36262d73aad227440a758c8dc3a067ca30096bd3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."psycopg2"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.sqlalchemy.org";
        license = licenses.mit;
        description = "Database Abstraction Library";
      };
    };



    "alembic" = python.mkDerivation {
      name = "alembic-0.9.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/78/48/b5b26e7218b415f40b60b92c53853d242e5456c0f19f6c66101d98ff5f2a/alembic-0.9.2.tar.gz"; sha256 = "a2b6b599f48b39ebf33b7dd069463924ca59c94aae7ae6f3661e0e54b5e78647"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Mako"
      self."SQLAlchemy"
      self."python-dateutil"
      self."python-editor"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://bitbucket.org/zzzeek/alembic";
        license = licenses.mit;
        description = "A database migration tool for SQLAlchemy.";
      };
    };



    "amqp" = python.mkDerivation {
      name = "amqp-2.1.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/23/39/06bb8bd31e78962675f696498f7821f5dbd11aa0919c5a811d83a0e02609/amqp-2.1.4.tar.gz"; sha256 = "1378cc14afeb6c2850404f322d03dec0082d11d04bdcb0360e1b10d4e6e77ef9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."vine"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/celery/py-amqp";
        license = licenses.bsdOriginal;
        description = "Low-level AMQP client for Python (fork of amqplib).";
      };
    };



    "appdirs" = python.mkDerivation {
      name = "appdirs-1.4.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/48/69/d87c60746b393309ca30761f8e2b49473d43450b150cb08f3c6df5c11be5/appdirs-1.4.3.tar.gz"; sha256 = "9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/ActiveState/appdirs";
        license = licenses.mit;
        description = "A small Python module for determining appropriate platform-specific dirs, e.g. a \"user data dir\".";
      };
    };



    "asn1crypto" = python.mkDerivation {
      name = "asn1crypto-0.22.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/67/14/5d66588868c4304f804ebaff9397255f6ec5559e46724c2496e0f26e68d6/asn1crypto-0.22.0.tar.gz"; sha256 = "cbbadd640d3165ab24b06ef25d1dca09a3441611ac15f6a6b452474fdf0aed1a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/wbond/asn1crypto";
        license = licenses.mit;
        description = "Fast ASN.1 parser and serializer with definitions for private keys, public keys, certificates, CRL, OCSP, CMS, PKCS#3, PKCS#7, PKCS#8, PKCS#12, PKCS#5, X.509 and TSP";
      };
    };



    "billiard" = python.mkDerivation {
      name = "billiard-3.5.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e6/b8/6e6750f21309c21ea267834d5e76b89ce64a9ddf38fa4161fd6fb32ffc3b/billiard-3.5.0.2.tar.gz"; sha256 = "3eb01a8fe44116aa6d63d2010515ef1526e40caee5f766f75b2d28393332dcaa"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/celery/billiard";
        license = licenses.bsdOriginal;
        description = "Python multiprocessing fork with improvements and bugfixes";
      };
    };



    "celery" = python.mkDerivation {
      name = "celery-4.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b2/b7/888565f3e955473247aef86174db5121d16de6661b69bd8f3d10aff574f6/celery-4.0.2.tar.gz"; sha256 = "e3d5a6c56a73ff8f2ddd4d06dc37f4c2afe4bb4da7928b884d0725ea865ef54d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Django"
      self."SQLAlchemy"
      self."billiard"
      self."kombu"
      self."pyOpenSSL"
      self."pytz"
      self."redis"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://celeryproject.org";
        license = licenses.bsdOriginal;
        description = "Distributed Task Queue.";
      };
    };



    "cffi" = python.mkDerivation {
      name = "cffi-1.10.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/5b/b9/790f8eafcdab455bcd3bd908161f802c9ce5adbf702a83aa7712fcc345b7/cffi-1.10.0.tar.gz"; sha256 = "b3b02911eb1f6ada203b0763ba924234629b51586f72a21faacc638269f4ced5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pycparser"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://cffi.readthedocs.org";
        license = licenses.mit;
        description = "Foreign Function Interface for Python calling C code.";
      };
    };



    "configobj" = python.mkDerivation {
      name = "configobj-5.0.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/64/61/079eb60459c44929e684fa7d9e2fdca403f67d64dd9dbac27296be2e0fab/configobj-5.0.6.tar.gz"; sha256 = "a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/DiffSK/configobj";
        license = licenses.bsdOriginal;
        description = "Config file reading, writing and validation.";
      };
    };



    "cryptography" = python.mkDerivation {
      name = "cryptography-1.8.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ec/5f/d5bc241d06665eed93cd8d3aa7198024ce7833af7a67f6dc92df94e00588/cryptography-1.8.1.tar.gz"; sha256 = "323524312bb467565ebca7e50c8ae5e9674e544951d28a2904a50012a8828190"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."asn1crypto"
      self."cffi"
      self."idna"
      self."packaging"
      self."pytest"
      self."pytz"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pyca/cryptography";
        license = licenses.bsdOriginal;
        description = "cryptography is a package which provides cryptographic recipes and primitives to Python developers.";
      };
    };



    "django-admin-bootstrapped" = python.mkDerivation {
      name = "django-admin-bootstrapped-2.5.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e6/5f/4e29ecbd19fadf76dcc8360aa3dd588d19622df584b965771e63c05f4082/django-admin-bootstrapped-2.5.7.tar.gz"; sha256 = "54927a8b55f61d3b90b4ecb7527ca75d9d8f621f604d2c92fcc7a751f7ea099d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Django"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/django-admin-bootstrapped/django-admin-bootstrapped";
        license = licenses.bsdOriginal;
        description = "A Bootstrap theme for Django Admin";
      };
    };



    "django-agpl" = python.mkDerivation {
      name = "django-agpl-3.0.2";
      src = pkgs.fetchurl { url = "https://github.com/lamby/django-agpl/archive/master.zip"; sha256 = "90e6a56daba277a95acbe534e480987bd28964a154599711306b60ac680c8f3d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Django"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://chris-lamb.co.uk/projects/django-agpl";
        license = "";
        description = "Django application to assist GNU AGPL compliance";
      };
    };



    "django-braces" = python.mkDerivation {
      name = "django-braces-1.11.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/50/f5/cd8593f5502651c940a8a54de4aa6b2a302c16eb4eaa11388af7ec794374/django-braces-1.11.0.tar.gz"; sha256 = "5898ab2ce4ca7c85b21aedf789b96e90c59dc75d26db6d9a4dc0cff3fc7a7aca"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/brack3t/django-braces/";
        license = licenses.bsdOriginal;
        description = "Reusable, generic mixins for Django";
      };
    };



    "django-configurations" = python.mkDerivation {
      name = "django-configurations-2.0";
      src = pkgs.fetchurl { url = "https://github.com/jezdez/django-configurations/archive/master.zip"; sha256 = "0blmv5sd2wp6g3x1ccb8cakyb1nilgxzapcz8sanvihjxfrrnv3g"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://django-configurations.readthedocs.io/";
        license = licenses.bsdOriginal;
        description = "A helper for organizing Django settings.";
      };
    };



    "django-cors-headers" = python.mkDerivation {
      name = "django-cors-headers-2.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/00/5d/5c5ec1a8dd97294251aed1dbec507f61f489c10bbbc2598582b67651f0fa/django-cors-headers-2.0.2.tar.gz"; sha256 = "a9613cfca9eca3b3f1b32fdd5c5bfac4cbc22d2e27e64f297cf2acd90aa72d76"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/ottoyiu/django-cors-headers";
        license = licenses.mit;
        description = "django-cors-headers is a Django application for handling the server headers required for Cross-Origin Resource Sharing (CORS).";
      };
    };



    "django-countries" = python.mkDerivation {
      name = "django-countries-4.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/72/ef/46ff08cdd1e94b9b09121f08f875e4547a46bda322c586ccd6ddfa1c5117/django-countries-4.5.tar.gz"; sha256 = "1ea16125b93895fdb5c85c17a8233ad145313fbc4a64a3a915e3ad4ee2b15631"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/SmileyChris/django-countries/";
        license = licenses.mit;
        description = "Provides a country field for Django models.";
      };
    };



    "django-crispy-forms" = python.mkDerivation {
      name = "django-crispy-forms-1.6.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ef/f3/511b017c2cc3923bc3b317111fa230b0497d12ae3a9ed4c8c2237c07aef1/django-crispy-forms-1.6.1.tar.gz"; sha256 = "c894f3a44e111ae6c6226c67741d96d120adb942de41dc8b2a991b87de7ff9c0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/maraujop/django-crispy-forms";
        license = licenses.mit;
        description = "Best way to have Django DRY forms";
      };
    };



    "django-extensions" = python.mkDerivation {
      name = "django-extensions-1.7.9";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/26/4e/acf4324faf57aca09a117b6125a57e43a77cacd74349fedc7c889ade9edd/django-extensions-1.7.9.tar.gz"; sha256 = "3d028994db76b78bbc5adef7e48102d44fb70a33b34adaddcf8d4f85620453c1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/django-extensions/django-extensions";
        license = licenses.mit;
        description = "Extensions for Django";
      };
    };



    "django-mptt" = python.mkDerivation {
      name = "django-mptt-0.8.7";
      src = pkgs.fetchurl { url = "https://github.com/django-mptt/django-mptt/archive/master.zip"; sha256 = "170v5c4v64kq3cf0xa4bs0a5q80spmxnrwdyxk67xr2318vkvr9x"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/django-mptt/django-mptt";
        license = licenses.mit;
        description = "Utilities for implementing Modified Preorder Tree Traversal
        with your Django Models and working with trees of Model instances.";
      };
    };



    "django-oauth-toolkit" = python.mkDerivation {
      name = "django-oauth-toolkit-0.12.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/77/f4/6554d68fb5de85e2655e347573aa578eafa7c65fbf8665a784b21b104e15/django-oauth-toolkit-0.12.0.tar.gz"; sha256 = "4e50e6e4ba59bc09502ee39d7e7ad8f14e1fe1e15f93e7f4422791c9ecc3b1e0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Django"
      self."django-braces"
      self."oauthlib"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/evonove/django-oauth-toolkit";
        license = licenses.bsdOriginal;
        description = "OAuth2 goodies for Django";
      };
    };



    "django-otp" = python.mkDerivation {
      name = "django-otp-0.3.13";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/fb/81/5f028042401878bf3465911463a592f0133ef5db4b45a1915aacfd7c0769/django-otp-0.3.13.tar.gz"; sha256 = "7488f24c472e592ece7431f9be42d71f601e3482d967c9736f37b6f50c13430e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Django"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://bitbucket.org/psagers/django-otp";
        license = licenses.bsdOriginal;
        description = "A pluggable framework for adding two-factor authentication to Django using one-time passwords.";
      };
    };



    "django-recaptcha" = python.mkDerivation {
      name = "django-recaptcha-1.3.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/7d/ed/4931eb40b867c35ee8ceede584ae44b224d1d5dc1b23d93513014cf9018c/django-recaptcha-1.3.0.tar.gz"; sha256 = "25e19b56f55101aaf145107e58e00f336d813886dc14de993c2d778f92ac22f9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Django"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/praekelt/django-recaptcha";
        license = licenses.bsdOriginal;
        description = "Django recaptcha form field/widget app.";
      };
    };



    "django-scrypt" = python.mkDerivation {
      name = "django-scrypt-0.2.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/fc/e3/3056ac30ebbfa8a36dfedfbb47bdbb641e00bc2cb15a2dd0049e7b732ee5/django-scrypt-0.2.3.tar.gz"; sha256 = "e81a35ae85c21544a2f1541317ff78f525632553be916d6d3711f4ee88ee1966"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://bitbucket.org/kelvinwong_ca/django-scrypt";
        license = licenses.bsdOriginal;
        description = "A Scrypt-enabled password hasher for Django 1.4/1.5";
      };
    };



    "django-treebeard" = python.mkDerivation {
      name = "django-treebeard-4.1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d5/6a/dd4e1a6ca97e3b1d5546d5ad9b14cac1dad7bc64579f66710532ad96fd48/django-treebeard-4.1.0.tar.gz"; sha256 = "f13c9a612a554ee0784632961904870efcf05f58282cd158da84ee88120fbafb"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Django"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/django-treebeard/django-treebeard/";
        license = licenses.asl20;
        description = "Efficient tree implementations for Django";
      };
    };



    "djangorestframework" = python.mkDerivation {
      name = "djangorestframework-3.6.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/41/07/7425c7167e6870eabbea8e0aece0738a45bbe52d38fd455c6fe089783c8e/djangorestframework-3.6.3.tar.gz"; sha256 = "6aa6aafdfb7f6152a401873ecae93aff9eb54d7a74266065347cf4de68278ae4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.django-rest-framework.org";
        license = licenses.bsdOriginal;
        description = "Web APIs for Django, made easy.";
      };
    };



    "docutils" = python.mkDerivation {
      name = "docutils-0.13.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/05/25/7b5484aca5d46915493f1fd4ecb63c38c333bd32aa9ad6e19da8d08895ae/docutils-0.13.1.tar.gz"; sha256 = "718c0f5fb677be0f34b781e04241c4067cbd9327b66bdd8e763201130f5175be"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docutils.sourceforge.net/";
        license = licenses.publicDomain;
        description = "Docutils -- Python Documentation Utilities";
      };
    };



    "gnupg" = python.mkDerivation {
      name = "gnupg-2.3.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/fa/ea/58e0415e1e3c3a0649119158e036ca4a9af154c56ef80f3d6de986bf9cb2/gnupg-2.3.0.tar.gz"; sha256 = "1d90e854dcc7790a7efc3aac5998159553cc34ec599ee2bc7927beb45fb564ec"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."psutil"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/isislovecruft/python-gnupg";
        license = licenses.gpl3Plus;
        description = "A Python wrapper for GnuPG";
      };
    };



    "idna" = python.mkDerivation {
      name = "idna-2.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d8/82/28a51052215014efc07feac7330ed758702fc0581347098a81699b5281cb/idna-2.5.tar.gz"; sha256 = "3cb5ce08046c4e3a560fc02f138d0ac63e00f8ce5901a56b32ec8b7994082aab"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/kjd/idna";
        license = licenses.bsdOriginal;
        description = "Internationalized Domain Names in Applications (IDNA)";
      };
    };



    "jsonfield" = python.mkDerivation {
      name = "jsonfield-2.0.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/80/d1/d9c12a8b4536aaf43f423d6d2baf88ce5dfdc6ce2758379d673d23ad763a/jsonfield-2.0.1.tar.gz"; sha256 = "b9bbedad885bf49a3f9f89d472bf5323c23319d2dc13f45304fc1068915c086c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Django"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/bradjasper/django-jsonfield/";
        license = licenses.mit;
        description = "A reusable Django field that allows you to store validated JSON in your model.";
      };
    };



    "kombu" = python.mkDerivation {
      name = "kombu-4.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c7/76/58c655a80bf08b703478ce673ed4e3029297105951863b73030d45b06b42/kombu-4.0.2.tar.gz"; sha256 = "d0fc6f2a36610a308f838db4b832dad79a681b516ac1d1a1f9d42edb58cc11a2"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."amqp"
      self."redis"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://kombu.readthedocs.io";
        license = licenses.bsdOriginal;
        description = "Messaging library for Python.";
      };
    };



    "libsass" = python.mkDerivation {
      name = "libsass-0.12.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/77/3e/3854643362efea519450b60dec8cee6775ebf104cae4cf98f3c6d23fb3bd/libsass-0.12.3.tar.gz"; sha256 = "236762af9c693bb72ed92d65ff4a5a77d27af9494b6174fbec7e6308416673b0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://hongminhee.org/libsass-python/";
        license = licenses.mit;
        description = "SASS for Python: A straightforward binding of libsass for Python.";
      };
    };

    "ndg-httpsclient" = python.mkDerivation {
      name = "ndg-httpsclient-0.4.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a2/a7/ad1c1c48e35dc7545dab1a9c5513f49d5fa3b5015627200d2be27576c2a0/ndg_httpsclient-0.4.2.tar.gz"; sha256 = "580987ef194334c50389e0d7de885fccf15605c13c6eecaabd8d6c43768eb8ac"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pyOpenSSL"
      self."pyasn1"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/cedadev/ndg_httpsclient/";
        license = licenses.bsdOriginal;
        description = "Provides enhanced HTTPS support for httplib and urllib2 using PyOpenSSL";
      };
    };



    "oauthlib" = python.mkDerivation {
      name = "oauthlib-2.0.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d2/4c/5ac894a469e25ebd02f6b3c2adb9f55253e6d1ca1f16a7d247ae6d48b4c8/oauthlib-2.0.1.tar.gz"; sha256 = "132ad46df25e53a84b33f1fd43f80e973cda2cb018cc0168d7d0c8c4d5cef9b5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."cryptography"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/idan/oauthlib";
        license = licenses.bsdOriginal;
        description = "A generic, spec-compliant, thorough implementation of the OAuth request-signing logic";
      };
    };



    "packaging" = python.mkDerivation {
      name = "packaging-16.8";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c6/70/bb32913de251017e266c5114d0a645f262fb10ebc9bf6de894966d124e35/packaging-16.8.tar.gz"; sha256 = "5d50835fdf0a7edf0b55e311b7c887786504efea1177abd7e69329a8e5ea619e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pyparsing"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pypa/packaging";
        license = licenses.bsdOriginal;
        description = "Core utilities for Python packages";
      };
    };



    "psutil" = python.mkDerivation {
      name = "psutil-5.2.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/57/93/47a2e3befaf194ccc3d05ffbcba2cdcdd22a231100ef7e4cf63f085c900b/psutil-5.2.2.tar.gz"; sha256 = "44746540c0fab5b95401520d29eb9ffe84b3b4a235bd1d1971cbe36e1f38dd13"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/giampaolo/psutil";
        license = licenses.bsdOriginal;
        description = "psutil is a cross-platform library for retrieving information onrunning processes and system utilization (CPU, memory, disks, network)in Python.";
      };
    };



    "psycopg2" = python.mkDerivation {
      name = "psycopg2-2.7.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f8/e9/5793369ce8a41bf5467623ded8d59a434dfef9c136351aca4e70c2657ba0/psycopg2-2.7.1.tar.gz"; sha256 = "86c9355f5374b008c8479bc00023b295c07d508f7c3b91dbd2e74f8925b1d9c6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://initd.org/psycopg/";
        license = licenses.lgpl2;
        description = "psycopg2 - Python-PostgreSQL Database Adapter";
      };
    };



    "py" = python.mkDerivation {
      name = "py-1.4.33";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2a/a5/139ca93a9ffffd9fc1d3f14be375af3085f53cc490c508cf1c988b886baa/py-1.4.33.tar.gz"; sha256 = "1f9a981438f2acc20470b301a07a496375641f902320f70e31916fe3377385a9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://py.readthedocs.io/";
        license = licenses.mit;
        description = "library with cross-python path, ini-parsing, io, code, log facilities";
      };
    };



    "py-bcrypt" = python.mkDerivation {
      name = "py-bcrypt-0.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/68/b1/1c3068c5c4d2e35c48b38dcc865301ebfdf45f54507086ac65ced1fd3b3d/py-bcrypt-0.4.tar.gz"; sha256 = "5fa13bce551468350d66c4883694850570f3da28d6866bb638ba44fe5eabda78"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://code.google.com/p/py-bcrypt";
        license = licenses.bsdOriginal;
        description = "bcrypt password hashing and key derivation";
      };
    };



    "pyOpenSSL" = python.mkDerivation {
      name = "pyOpenSSL-17.0.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9f/32/80fe4fddeb731b7766cd09fe0b2032a91b43dae655e216792af2a6ae3190/pyOpenSSL-17.0.0.tar.gz"; sha256 = "48abfe9d2bb8eb8d8947c8452b0223b7b1be2383b332f3b4f248fe59ef0bafdd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."cryptography"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://pyopenssl.readthedocs.io/";
        license = licenses.asl20;
        description = "Python wrapper module around the OpenSSL library";
      };
    };



    "pyasn1" = python.mkDerivation {
      name = "pyasn1-0.2.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/69/17/eec927b7604d2663fef82204578a0056e11e0fc08d485fdb3b6199d9b590/pyasn1-0.2.3.tar.gz"; sha256 = "738c4ebd88a718e700ee35c8d129acce2286542daa80a82823a7073644f706ad"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/etingof/pyasn1";
        license = licenses.bsdOriginal;
        description = "ASN.1 types and codecs";
      };
    };



    "pycparser" = python.mkDerivation {
      name = "pycparser-2.17";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/be/64/1bb257ffb17d01f4a38d7ce686809a736837ad4371bcc5c42ba7a715c3ac/pycparser-2.17.tar.gz"; sha256 = "0aac31e917c24cb3357f5a4d5566f2cc91a19ca41862f6c3c22dc60a629673b6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/eliben/pycparser";
        license = licenses.bsdOriginal;
        description = "C parser in Python";
      };
    };



    "pyjade" = python.mkDerivation {
      name = "pyjade-4.0.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4a/04/396ec24e806fd3af7ea5d0f3cb6c7bbd4d00f7064712e4dd48f24c02ca95/pyjade-4.0.0.tar.gz"; sha256 = "8d95b741de09c4942259fc3d1ad7b4f48166e69cef6f11c172e4b2c458b1ccd7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/syrusakbary/pyjade";
        license = licenses.mit;
        description = "Jade syntax template adapter for Django, Jinja2, Mako and Tornado templates";
      };
    };



    "pyparsing" = python.mkDerivation {
      name = "pyparsing-2.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/3c/ec/a94f8cf7274ea60b5413df054f82a8980523efd712ec55a59e7c3357cf7c/pyparsing-2.2.0.tar.gz"; sha256 = "0832bcf47acd283788593e7a0f542407bd9550a55a8a8435214a1960e04bcb04"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pyparsing.wikispaces.com/";
        license = licenses.mit;
        description = "Python parsing module";
      };
    };



    "pytest" = python.mkDerivation {
      name = "pytest-3.1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/50/e2/a28d4c5e4520a0427bc5141703f3296184742e7cb2722ce71fd61020c417/pytest-3.1.0.tar.gz"; sha256 = "239c71f1804b57b07806f315752b42f675ddf3109a11ebe8d40eef043db12a83"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."py"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pytest.org";
        license = licenses.mit;
        description = "pytest: simple powerful testing with Python";
      };
    };



    "pytest-django" = python.mkDerivation {
      name = "pytest-django-3.1.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/78/8b/aeab19b727411f3ec5f68dc8c05b2dba949b27ed592d68217e72e7d4ce65/pytest-django-3.1.2.tar.gz"; sha256 = "038ccc5a9daa1b1b0eb739ab7dce54e495811eca5ea3af4815a2a3ac45152309"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://pytest-django.readthedocs.io/";
        license = licenses.bsdOriginal;
        description = "A Django plugin for pytest.";
      };
    };


    "python-dateutil" = python.mkDerivation {
      name = "python-dateutil-2.6.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/51/fc/39a3fbde6864942e8bb24c93663734b74e281b984d1b8c4f95d64b0c21f6/python-dateutil-2.6.0.tar.gz"; sha256 = "62a2f8df3d66f878373fd0072eacf4ee52194ba302e00082828e0d263b0418d2"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://dateutil.readthedocs.io";
        license = licenses.bsdOriginal;
        description = "Extensions to the standard Python datetime module";
      };
    };



    "python-editor" = python.mkDerivation {
      name = "python-editor-1.0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/65/1e/adf6e000ea5dc909aa420352d6ba37f16434c8a3c2fa030445411a1ed545/python-editor-1.0.3.tar.gz"; sha256 = "a3c066acee22a1c94f63938341d4fb374e3fdd69366ed6603d7b24bed1efc565"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/fmoo/python-editor";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Programmatically open an editor, capture the result.";
      };
    };



    "pytz" = python.mkDerivation {
      name = "pytz-2017.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a4/09/c47e57fc9c7062b4e83b075d418800d322caa87ec0ac21e6308bd3a2d519/pytz-2017.2.zip"; sha256 = "f5c056e8f62d45ba8215e5cb8f50dfccb198b4b9fbea8500674f3443e4689589"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonhosted.org/pytz";
        license = licenses.mit;
        description = "World timezone definitions, modern and historical";
      };
    };



    "redis" = python.mkDerivation {
      name = "redis-2.10.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/68/44/5efe9e98ad83ef5b742ce62a15bea609ed5a0d1caf35b79257ddb324031a/redis-2.10.5.tar.gz"; sha256 = "5dfbae6acfc54edf0a7a415b99e0b21c0a3c27a7f787b292eea727b1facc5533"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/andymccurdy/redis-py";
        license = licenses.mit;
        description = "Python client for Redis key-value store";
      };
    };



    "requests" = python.mkDerivation {
      name = "requests-2.14.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/72/46/4abc3f5aaf7bf16a52206bb0c68677a26c216c1e6625c78c5aef695b5359/requests-2.14.2.tar.gz"; sha256 = "a274abba399a23e8713ffd2b5706535ae280ebe2b8069ee6a941cb089440d153"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."cryptography"
      self."idna"
      self."pyOpenSSL"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://python-requests.org";
        license = licenses.asl20;
        description = "Python HTTP for Humans.";
      };
    };



    "scrypt" = python.mkDerivation {
      name = "scrypt-0.8.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/af/82/44b030646b9de44ba5a5c7e87b0419a4d44318ba18468f5292b9c16737ac/scrypt-0.8.0.tar.gz"; sha256 = "d4a5a4f53450b8ef629bbf1ee4be6105c69936e49b3d8bc621ac2287f0c86020"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://bitbucket.org/mhallin/py-scrypt";
        license = licenses.bsdOriginal;
        description = "Bindings for the scrypt key derivation function library";
      };
    };

    "setuptools-scm" = python.mkDerivation {
      name = "setuptools-scm-1.11.1";
      src = pkgs.fetchurl {  url = "https://pypi.python.org/packages/84/aa/c693b5d41da513fed3f0ee27f1bf02a303caa75bbdfa5c8cc233a1d778c4/setuptools_scm-1.11.1.tar.gz"; sha256 = "8c45f738a23410c5276b0ed9294af607f491e4260589f1eb90df8312e23819bf"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pypa/setuptools_scm/";
        license = licenses.mit;
        description = "the blessed package to manage your versions by scm tags";
      };
    };

    "six" = python.mkDerivation {
      name = "six-1.10.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz"; sha256 = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pypi.python.org/pypi/six/";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };



    "unicodecsv" = python.mkDerivation {
      name = "unicodecsv-0.14.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/6f/a4/691ab63b17505a26096608cc309960b5a6bdf39e4ba1a793d5f9b1a53270/unicodecsv-0.14.1.tar.gz"; sha256 = "018c08037d48649a0412063ff4eda26eaa81eff1546dbffa51fa5293276ff7fc"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jdunck/python-unicodecsv";
        license = licenses.bsdOriginal;
        description = "Python2's stdlib csv module is nice, but it doesn't support unicode. This module is a drop-in replacement which *does*.";
      };
    };



    "vine" = python.mkDerivation {
      name = "vine-1.1.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/35/21/308904b027636f13c3970ed7caf2c53fca77fa160122ae3ac392d9eb6307/vine-1.1.3.tar.gz"; sha256 = "87b95da19249373430a8fafca36f1aecb7aa0f1cc78545877857afc46aea2441"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/celery/vine";
        license = licenses.bsdOriginal;
        description = "Promises, promises, promises.";
      };
    };

  };
  overrides = import ./requirements_override.nix { inherit pkgs python; };
  commonOverrides = [

  ];

in python.withPackages
   (fix' (pkgs.lib.fold
            extends
            generated
            ([overrides] ++ commonOverrides)
         )
   )
