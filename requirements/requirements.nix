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
        homepage = "";
        license = licenses.bsdOriginal;
        description = "A high-level Python Web framework that encourages rapid development and clean, pragmatic design.";
      };
    };



    "Jinja2" = python.mkDerivation {
      name = "Jinja2-2.9.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/90/61/f820ff0076a2599dd39406dcb858ecb239438c02ce706c8e91131ab9c7f1/Jinja2-2.9.6.tar.gz"; sha256 = "ddaa01a212cd6d641401cb01b605f4a4d9f37bfc93043d7f760ec70fb99ff9ff"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."MarkupSafe"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "A small but fast and easy to use stand-alone template engine written in pure python.";
      };
    };



    "Mako" = python.mkDerivation {
      name = "Mako-1.0.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/eb/f3/67579bb486517c0d49547f9697e36582cd19dafb5df9e687ed8e22de57fa/Mako-1.0.7.tar.gz"; sha256 = "4e02fde57bd4abb5ec400181e4c314f56ac3e49ba4fb8b0d50bba18cb27d25ae"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."MarkupSafe"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
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
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Implements a XML/HTML/XHTML Markup safe string for Python";
      };
    };



    "SQLAlchemy" = python.mkDerivation {
      name = "SQLAlchemy-1.1.11";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/59/f1/28f2205c3175e6bf32300c0f30f9d91dbc9eb910debbff3ffecb88d18528/SQLAlchemy-1.1.11.tar.gz"; sha256 = "76f76965e9a968ba3aecd2a8bc0d991cea04fd9a182e6c95c81f1551487b0211"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."psycopg2"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "Database Abstraction Library";
      };
    };



    "alembic" = python.mkDerivation {
      name = "alembic-0.9.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/90/4a/a783832723ea876232e4f9aa0034ad3c80d3fa22c5b5f320a6fe20e4ac8c/alembic-0.9.3.tar.gz"; sha256 = "57f2ede554c0b18f1cf811cfbb3b02c586a5422df94922e3821883ba0b8c616c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Mako"
      self."SQLAlchemy"
      self."python-dateutil"
      self."python-editor"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "A database migration tool for SQLAlchemy.";
      };
    };



    "amqp" = python.mkDerivation {
      name = "amqp-2.2.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/cc/6b/7573935fe6021a89e8b1a74fabae1a9050701b8cf7075ca217b8d3e361a6/amqp-2.2.1.tar.gz"; sha256 = "7ababb2c28672c2a48b907095bc79104531217a98807751b51e0d8c0fa831aff"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."vine"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Low-level AMQP client for Python (fork of amqplib).";
      };
    };



    "asn1crypto" = python.mkDerivation {
      name = "asn1crypto-0.22.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/67/14/5d66588868c4304f804ebaff9397255f6ec5559e46724c2496e0f26e68d6/asn1crypto-0.22.0.tar.gz"; sha256 = "cbbadd640d3165ab24b06ef25d1dca09a3441611ac15f6a6b452474fdf0aed1a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "Fast ASN.1 parser and serializer with definitions for private keys, public keys, certificates, CRL, OCSP, CMS, PKCS#3, PKCS#7, PKCS#8, PKCS#12, PKCS#5, X.509 and TSP";
      };
    };



    "billiard" = python.mkDerivation {
      name = "billiard-3.5.0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/39/ac/f5571210cca2e4f4532e38aaff242f26c8654c5e2436bee966c230647ccc/billiard-3.5.0.3.tar.gz"; sha256 = "1d7b22bdc47aa52841120fcd22a74ae4fc8c13e9d3935643098184f5788c3ce6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
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
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Distributed Task Queue.";
      };
    };



    "certifi" = python.mkDerivation {
      name = "certifi-2017.4.17";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/dd/0e/1e3b58c861d40a9ca2d7ea4ccf47271d4456ae4294c5998ad817bd1b4396/certifi-2017.4.17.tar.gz"; sha256 = "f7527ebf7461582ce95f7a9e03dd141ce810d40590834f4ec20cddd54234c10a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "ISC";
        description = "Python package for providing Mozilla's CA Bundle.";
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
        homepage = "";
        license = licenses.mit;
        description = "Foreign Function Interface for Python calling C code.";
      };
    };



    "chardet" = python.mkDerivation {
      name = "chardet-3.0.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"; sha256 = "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.lgpl2;
        description = "Universal encoding detector for Python 2 and 3";
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
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Config file reading, writing and validation.";
      };
    };



    "coreapi" = python.mkDerivation {
      name = "coreapi-2.3.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/49/79/e4013a052bfe0d192475afd6e529164cc512f218da09f3b2f344ee14f939/coreapi-2.3.1.tar.gz"; sha256 = "af88b5ad7415410de9ef33bd7f7cf605534f1c4cf24de716ebe4453021249714"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."coreschema"
      self."itypes"
      self."requests"
      self."uritemplate"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Python client library for Core API.";
      };
    };



    "coreschema" = python.mkDerivation {
      name = "coreschema-0.0.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/93/08/1d105a70104e078718421e6c555b8b293259e7fc92f7e9a04869947f198f/coreschema-0.0.4.tar.gz"; sha256 = "9503506007d482ab0867ba14724b93c18a33b22b6d19fb419ef2d239dd4a1607"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Jinja2"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Core Schema.";
      };
    };



    "cryptography" = python.mkDerivation {
      name = "cryptography-2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e6/7c/6d1b566fe84b0144f9277b120002046c2303cf012eaba912b2805969a209/cryptography-2.0.tar.gz"; sha256 = "d32453b54f99cfe3103f0cb79f6c0ea68c66483811dfe1527a4f06eb3bc580b0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."asn1crypto"
      self."cffi"
      self."idna"
      self."pytest"
      self."pytz"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
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
        homepage = "";
        license = licenses.bsdOriginal;
        description = "A Bootstrap theme for Django Admin";
      };
    };



    "django-agpl" = python.mkDerivation {
      name = "django-agpl-4.0.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9c/e4/fd714cfa332af1b23e7715172f4e539411f313a913d14f1c1ecf7e59cd98/django-agpl-4.0.0.tar.gz"; sha256 = "69545e276416cd96a76d9fcaa08b2ba6a3522d0078d9ba41032f79909b5d3fba"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Django"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
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
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Reusable, generic mixins for Django";
      };
    };



    "django-configurations" = python.mkDerivation {
      name = "django-configurations-1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/39/dc/5bcdd836d1bbca302453b80a4cb0a242776f60bcbaa0b184b86d59464db9/django-configurations-1.0.tar.gz"; sha256 = "98a14951cd0870d0343fe9c243172dc110353b430c3e06a87a90dc7bc82b0b75"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "A helper for organizing Django settings.";
      };
    };



    "django-cors-headers" = python.mkDerivation {
      name = "django-cors-headers-2.1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/42/c4/5a9c89f4d10f26b71a012848901ebb744530a4277e8fd224abdfb4490131/django-cors-headers-2.1.0.tar.gz"; sha256 = "451bc37a514792c2b46c52362368f7985985933ecdbf1a85f82652579a5cbe01"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "django-cors-headers is a Django application for handling the server headers required for Cross-Origin Resource Sharing (CORS).";
      };
    };



    "django-countries" = python.mkDerivation {
      name = "django-countries-4.6.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/84/df/19790ac0f5392d08a9fdd007aff85eb1916bbc5a0588a8eefbf2a022e5f2/django-countries-4.6.1.tar.gz"; sha256 = "a56707b5bd3d13d50177b4f1dbd650a40734698bf4693965b805c86d2d9fbb45"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
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
        homepage = "";
        license = licenses.mit;
        description = "Best way to have Django DRY forms";
      };
    };



    "django-debug-toolbar" = python.mkDerivation {
      name = "django-debug-toolbar-1.8";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d9/42/9d477cc1763504ac66eea5bb9ae32a932865f7cbac247025ed8f12313264/django-debug-toolbar-1.8.tar.gz"; sha256 = "e9f08b94f9423ac76cfc287151182bbaddbe7521ae32bef9f9863e2ac58018d3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Django"
      self."sqlparse"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "A configurable set of panels that display various debug information about the current request/response.";
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
        homepage = "";
        license = licenses.mit;
        description = "Extensions for Django";
      };
    };



    "django-mptt" = python.mkDerivation {
      name = "django-mptt-0.8.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d6/b9/918d3e5098af86bedc30ed1827d2223f03fd7ca0454a2d666fd39b00a1ee/django-mptt-0.8.7.tar.gz"; sha256 = "b6c80983bad659cfe7ebd04c95410969cf66ca89dcf8774f33b3fb0e0016270d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
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
        homepage = "";
        license = licenses.bsdOriginal;
        description = "OAuth2 goodies for Django";
      };
    };



    "django-otp" = python.mkDerivation {
      name = "django-otp-0.3.14";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d0/22/32081572f6787a97c8f12b0b23e139cf8e2ddd7807d2230bc35b6dcd46bb/django-otp-0.3.14.tar.gz"; sha256 = "662243ccda83986ca9a61c2f4658905c42acfb8cee56a3664928959165be2276"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Django"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "A pluggable framework for adding two-factor authentication to Django using one-time passwords.";
      };
    };



    "django-recaptcha" = python.mkDerivation {
      name = "django-recaptcha-1.3.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/27/10/beb2a0810e17fb5f8c1ef41c5c1570dd5fbf98fb8d8c7865137d200e1f26/django-recaptcha-1.3.1.tar.gz"; sha256 = "6cef6f94b8de84d889f0326fce572ec26b2a027fc802582666f148b38cc4d8d1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Django"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Django recaptcha form field/widget app.";
      };
    };



    "django-rest-swagger" = python.mkDerivation {
      name = "django-rest-swagger-2.1.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a8/b8/45efd0171032eda027f0ccf8ea9a6d5d53624ea8f29a6b4b9492d40a2da7/django-rest-swagger-2.1.2.tar.gz"; sha256 = "ff889e2b339a9a57010dba7729d56471e05b77827f6dd36c0bcb983839882598"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."coreapi"
      self."djangorestframework"
      self."openapi-codec"
      self."simplejson"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Swagger UI for Django REST Framework 3.5+";
      };
    };



    "django-scrypt" = python.mkDerivation {
      name = "django-scrypt-0.2.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/fc/e3/3056ac30ebbfa8a36dfedfbb47bdbb641e00bc2cb15a2dd0049e7b732ee5/django-scrypt-0.2.3.tar.gz"; sha256 = "e81a35ae85c21544a2f1541317ff78f525632553be916d6d3711f4ee88ee1966"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "A Scrypt-enabled password hasher for Django 1.4/1.5";
      };
    };



    "django-treebeard" = python.mkDerivation {
      name = "django-treebeard-4.1.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/88/bc/b796fb62adcdd7016fc184c9d2890750a353da6d0ab1b816197ae41a9025/django-treebeard-4.1.2.tar.gz"; sha256 = "a11bb3dfc60004adda12a4e2e2fd1f691b36d7aa302604542926d5d2209687fd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Django"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
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
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Web APIs for Django, made easy.";
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
        homepage = "";
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
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Internationalized Domain Names in Applications (IDNA)";
      };
    };



    "itypes" = python.mkDerivation {
      name = "itypes-1.1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d3/24/5e511590f95582efe64b8ad2f6dadd85c5563c9dcf40171ea5a70adbf5a9/itypes-1.1.0.tar.gz"; sha256 = "c6e77bb9fd68a4bfeb9d958fea421802282451a25bac4913ec94db82a899c073"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Simple immutable types for python.";
      };
    };



    "jsonfield" = python.mkDerivation {
      name = "jsonfield-2.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9b/c3/c36344d4c11e4d825fe42ed53367d6fa6d837e3028d8be56f208a7379cd2/jsonfield-2.0.2.tar.gz"; sha256 = "beb1cd4850d6d6351c32daefcb826c01757744e9c863228a642f87a1a4acb834"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Django"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
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
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Messaging library for Python.";
      };
    };



    "libsass" = python.mkDerivation {
      name = "libsass-0.13.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f1/db/49d9596da8fecb33125195eb84e0dd4db2769db003120bd1b4526690829a/libsass-0.13.2.tar.gz"; sha256 = "f6270e6f5eb0bfa4e5ecf5b9e6443f576a6fe47cbb732b8d6acaf396c323ec0a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
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
        homepage = "";
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
        homepage = "";
        license = licenses.bsdOriginal;
        description = "A generic, spec-compliant, thorough implementation of the OAuth request-signing logic";
      };
    };



    "openapi-codec" = python.mkDerivation {
      name = "openapi-codec-1.3.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/34/f9/40b5691749416f5fbd3f33318384f32474b9d06d476ae7f8929a84234786/openapi-codec-1.3.1.tar.gz"; sha256 = "7d88a4cecddf53002e58256a1e9d7fe20af0c8560d008a6e6e3cd5dbcba1109d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."coreapi"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "An OpenAPI codec for Core API.";
      };
    };



    "psutil" = python.mkDerivation {
      name = "psutil-5.2.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/57/93/47a2e3befaf194ccc3d05ffbcba2cdcdd22a231100ef7e4cf63f085c900b/psutil-5.2.2.tar.gz"; sha256 = "44746540c0fab5b95401520d29eb9ffe84b3b4a235bd1d1971cbe36e1f38dd13"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
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
        homepage = "";
        license = licenses.lgpl2;
        description = "psycopg2 - Python-PostgreSQL Database Adapter";
      };
    };



    "py" = python.mkDerivation {
      name = "py-1.4.34";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/68/35/58572278f1c097b403879c1e9369069633d1cbad5239b9057944bb764782/py-1.4.34.tar.gz"; sha256 = "0f2d585d22050e90c7d293b6451c83db097df77871974d90efd5a30dc12fcde3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
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
        homepage = "";
        license = licenses.bsdOriginal;
        description = "bcrypt password hashing and key derivation";
      };
    };



    "pyOpenSSL" = python.mkDerivation {
      name = "pyOpenSSL-17.1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4b/13/5521fdbfe26e0aa4aa04b9133c0dd5450a50e4aee5be44461d448e57560e/pyOpenSSL-17.1.0.tar.gz"; sha256 = "5a20a51d35104cd234d056861ace3e7a335aaf1f47fc96726c9e20ac1dc49563"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."cryptography"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
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
        homepage = "";
        license = licenses.bsdOriginal;
        description = "ASN.1 types and codecs";
      };
    };



    "pycparser" = python.mkDerivation {
      name = "pycparser-2.18";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8c/2d/aad7f16146f4197a11f8e91fb81df177adcc2073d36a17b1491fd09df6ed/pycparser-2.18.tar.gz"; sha256 = "99a8ca03e29851d96616ad0404b4aad7d9ee16f25c9f9708a11faf2810f7b226"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
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
        homepage = "";
        license = licenses.mit;
        description = "Jade syntax template adapter for Django, Jinja2, Mako and Tornado templates";
      };
    };



    "pytest" = python.mkDerivation {
      name = "pytest-3.1.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/15/c8/6b42bf58f91d72416806472512bb67dabc6edb5a6a8ace29853ff940400a/pytest-3.1.3.tar.gz"; sha256 = "095e1832f7e424563c95daf4d8d3c865052b80e139cdd2f9610a986ee8526206"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."py"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
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
        homepage = "";
        license = licenses.bsdOriginal;
        description = "A Django plugin for pytest.";
      };
    };



    "python-dateutil" = python.mkDerivation {
      name = "python-dateutil-2.6.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/54/bb/f1db86504f7a49e1d9b9301531181b00a1c7325dc85a29160ee3eaa73a54/python-dateutil-2.6.1.tar.gz"; sha256 = "891c38b2a02f5bb1be3e4793866c8df49c7d19baabf9c1bad62547e0b4866aca"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
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
        homepage = "";
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
        homepage = "";
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
        homepage = "";
        license = licenses.mit;
        description = "Python client for Redis key-value store";
      };
    };



    "requests" = python.mkDerivation {
      name = "requests-2.18.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2c/b5/2b6e8ef8dd18203b6399e9f28c7d54f6de7b7549853fe36d575bd31e29a7/requests-2.18.1.tar.gz"; sha256 = "c6f3bdf4a4323ac7b45d01e04a6f6c20e32a052cd04de81e05103abc049ad9b9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."certifi"
      self."chardet"
      self."cryptography"
      self."idna"
      self."pyOpenSSL"
      self."urllib3"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
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
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Bindings for the scrypt key derivation function library";
      };
    };



    "simplejson" = python.mkDerivation {
      name = "simplejson-3.11.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/08/48/c97b668d6da7d7bebe7ea1817a6f76394b0ec959cb04214ca833c34359df/simplejson-3.11.1.tar.gz"; sha256 = "01a22d49ddd9a168b136f26cac87d9a335660ce07aa5c630b8e3607d6f4325e7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "Simple, fast, extensible JSON encoder/decoder for Python";
      };
    };



    "six" = python.mkDerivation {
      name = "six-1.10.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz"; sha256 = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };



    "sqlparse" = python.mkDerivation {
      name = "sqlparse-0.2.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/45/67/14bdaeff492e6d03a055fe80502bae10b679891c25a0dc59be2fe51002f8/sqlparse-0.2.3.tar.gz"; sha256 = "becd7cc7cebbdf311de8ceedfcf2bd2403297024418801947f8c953025beeff8"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Non-validating SQL parser";
      };
    };



    "unicodecsv" = python.mkDerivation {
      name = "unicodecsv-0.14.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/6f/a4/691ab63b17505a26096608cc309960b5a6bdf39e4ba1a793d5f9b1a53270/unicodecsv-0.14.1.tar.gz"; sha256 = "018c08037d48649a0412063ff4eda26eaa81eff1546dbffa51fa5293276ff7fc"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Python2's stdlib csv module is nice, but it doesn't support unicode. This module is a drop-in replacement which *does*.";
      };
    };



    "uritemplate" = python.mkDerivation {
      name = "uritemplate-3.0.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/cd/db/f7b98cdc3f81513fb25d3cbe2501d621882ee81150b745cdd1363278c10a/uritemplate-3.0.0.tar.gz"; sha256 = "c02643cebe23fc8adb5e6becffe201185bf06c40bda5c0b4028a93f1527d011d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "URI templates";
      };
    };



    "urllib3" = python.mkDerivation {
      name = "urllib3-1.21.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/96/d9/40e4e515d3e17ed0adbbde1078e8518f8c4e3628496b56eb8f026a02b9e4/urllib3-1.21.1.tar.gz"; sha256 = "b14486978518ca0901a76ba973d7821047409d7f726f22156b24e83fd71382a5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."certifi"
      self."cryptography"
      self."idna"
      self."pyOpenSSL"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "HTTP library with thread-safe connection pooling, file post, and more.";
      };
    };



    "vine" = python.mkDerivation {
      name = "vine-1.1.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/32/23/36284986e011f3c130d802c3c66abd8f1aef371eae110ddf80c5ae22e1ff/vine-1.1.4.tar.gz"; sha256 = "52116d59bc45392af9fdd3b75ed98ae48a93e822cee21e5fda249105c59a7a72"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
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