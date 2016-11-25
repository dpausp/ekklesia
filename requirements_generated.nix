# generated using pypi2nix tool (version: 1.6.0)
#
# COMMAND:
#   pypi2nix -v -V 2.7 -E openssl postgresql libffi -r requirements/django1.8-pypi2nix.txt
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

  "Django" = python.mkDerivation {
    name = "Django-1.8.16";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/1a/83/daf33e1e897236d1a27cde3cbb49da03b7eec57fcbd658a3b05696b156d4/Django-1.8.16.tar.gz";
      sha256 = "224aaf17a28609707d942deafe6d0a5b382baf22a6f33e4e61c56c62f09081dd";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A high-level Python Web framework that encourages rapid development and clean, pragmatic design.";
    };
  };



  "Mako" = python.mkDerivation {
    name = "Mako-1.0.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/56/4b/cb75836863a6382199aefb3d3809937e21fa4cb0db15a4f4ba0ecc2e7e8e/Mako-1.0.6.tar.gz";
      sha256 = "48559ebd872a8e77f92005884b3d88ffae552812cdf17db6768e5c3be5ebbe0d";
    };
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



  "Markdown" = python.mkDerivation {
    name = "Markdown-2.6.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/d4/32/642bd580c577af37b00a1eb59b0eaa996f2d11dfe394f3dd0c7a8a2de81a/Markdown-2.6.7.tar.gz";
      sha256 = "daebf24846efa7ff269cfde8c41a48bb2303920c7b2c7c5e04fa82e6282d05c0";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Python implementation of Markdown.";
    };
  };



  "MarkupSafe" = python.mkDerivation {
    name = "MarkupSafe-0.23";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c0/41/bae1254e0396c0cc8cf1751cb7d9afc90a602353695af5952530482c963f/MarkupSafe-0.23.tar.gz";
      sha256 = "a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3";
    };
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
    name = "SQLAlchemy-1.1.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ca/ca/c2436fdb7bb75d772d9fa17ba60c4cfded6284eed053a7274b2beb96596a/SQLAlchemy-1.1.4.tar.gz";
      sha256 = "701b57d628b9fa1cfb82f10665e7214d5d2db23251ca6f23b91c5f56fcdbdeb5";
    };
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
    name = "alembic-0.8.8";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/93/16/d3a04f576a666582da368de60ba09a33e6711377775fd330d0a43bebacc5/alembic-0.8.8.tar.gz";
      sha256 = "cd6f2192ca2307bfe2a2a61f8a261420addc59a09a6379a6550e0a15693b0b8a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Mako"
      self."SQLAlchemy"
      self."python-editor"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A database migration tool for SQLAlchemy.";
    };
  };



  "amqp" = python.mkDerivation {
    name = "amqp-2.1.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/26/31/5ef415192dc8c150f23d47c926282dbd69dcd1a9c1158c18586036aeca4c/amqp-2.1.1.tar.gz";
      sha256 = "6d16feb4118cc9f5da9e98a10908d128252691bba2d4d31399ddc3092fb5226f";
    };
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



  "billiard" = python.mkDerivation {
    name = "billiard-3.5.0.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/e6/b8/6e6750f21309c21ea267834d5e76b89ce64a9ddf38fa4161fd6fb32ffc3b/billiard-3.5.0.2.tar.gz";
      sha256 = "3eb01a8fe44116aa6d63d2010515ef1526e40caee5f766f75b2d28393332dcaa";
    };
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
    name = "celery-4.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/47/a6/1b5f1cc0a720ef17abd4ab4ee47e769d6bd4bad38b5b7fec3248ff33b4fc/celery-4.0.0.tar.gz";
      sha256 = "3e38a9a7f2868f774dffbb49e3afd2e56f57875deb06cb3ee3808f572601a8f0";
    };
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



  "cffi" = python.mkDerivation {
    name = "cffi-1.9.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a1/32/e3d6c3a8b5461b903651dd6ce958ed03c093d2e00128e3f33ea69f1d7965/cffi-1.9.1.tar.gz";
      sha256 = "563e0bd53fda03c151573217b3a49b3abad8813de9dd0632e10090f6190fdaf8";
    };
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



  "configobj" = python.mkDerivation {
    name = "configobj-5.0.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/64/61/079eb60459c44929e684fa7d9e2fdca403f67d64dd9dbac27296be2e0fab/configobj-5.0.6.tar.gz";
      sha256 = "a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902";
    };
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



  "cryptography" = python.mkDerivation {
    name = "cryptography-1.5.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6c/c5/7fc1f8384443abd2d71631ead026eb59863a58cad0149b94b89f08c8002f/cryptography-1.5.3.tar.gz";
      sha256 = "cf82ddac919b587f5e44247579b433224cc2e03332d2ea4d89aa70d7e6b64ae5";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."cffi"
      self."enum34"
      self."idna"
      self."ipaddress"
      self."pyasn1"
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
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/e6/5f/4e29ecbd19fadf76dcc8360aa3dd588d19622df584b965771e63c05f4082/django-admin-bootstrapped-2.5.7.tar.gz";
      sha256 = "54927a8b55f61d3b90b4ecb7527ca75d9d8f621f604d2c92fcc7a751f7ea099d";
    };
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



  "django-braces" = python.mkDerivation {
    name = "django-braces-1.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/0f/d1/117ae0482a66bcc9525d5c9e7ba49b91a6c129d131e2b437976de6457732/django-braces-1.10.0.macosx-10.11-x86_64.tar.gz";
      sha256 = "94af56f0206c71c1c71af5a79b4bf76b24f0347283e7876bafc8ac948056b6d1";
    };
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
    name = "django-configurations-2.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6b/c2/7b882cb05240938468818f3c6a532f8f0e650d7660215761f733c113fbbd/django-configurations-2.0.tar.gz";
      sha256 = "b4a4eb3ed631c2abbeb7008b5cc5d8d04b190df838e7b613731d728f674f3a2f";
    };
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
    name = "django-cors-headers-1.3.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/19/52/56b26ccceb3444e5fcdebdd723f0ebf6d7b622fe239daca55f9c927e90d9/django-cors-headers-1.3.1.tar.gz";
      sha256 = "0c7cbcd92ca06ea64a1101b8e2f23952160c39ff894a913f77dcda1de9637949";
    };
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
    name = "django-countries-4.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/91/88/c99df63539deafc9306158e65965e1774eebf3a9f39c8bb2314369fb79a8/django-countries-4.0.tar.gz";
      sha256 = "8762ed8863e818c44619e10ab47a861546f465afe945fd5ddecb6f2ba294a646";
    };
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
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ef/f3/511b017c2cc3923bc3b317111fa230b0497d12ae3a9ed4c8c2237c07aef1/django-crispy-forms-1.6.1.tar.gz";
      sha256 = "c894f3a44e111ae6c6226c67741d96d120adb942de41dc8b2a991b87de7ff9c0";
    };
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
    name = "django-debug-toolbar-1.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f1/7c/bfcfe5db6691d090caf1ebca1436fa57b7be765437951482f048c88fc7ec/django-debug-toolbar-1.6.tar.gz";
      sha256 = "4eddb6fa791c4bfc6aa49e4c073663cd3719fe1c8609501aedf25b8586563e7a";
    };
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
    name = "django-extensions-1.7.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/1a/1a/ec5bb3673ac4945a4c7dd7973ca4b60b4ecdc962df67799666168e1567c5/django-extensions-1.7.4.tar.gz";
      sha256 = "e0829f1d1914e25750152b2a35665508b6e60edf6ac08717ee8eaf3df396d8b1";
    };
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



  "django-oauth-toolkit" = python.mkDerivation {
    name = "django-oauth-toolkit-0.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/cf/08/e718784a49f74d6861260c08b54d9b197244d9cb2a51f8693a4f6c0635dd/django-oauth-toolkit-0.10.0.tar.gz";
      sha256 = "22dcf08674a0b7d7fa7e8abd97d9df9884c1222de3f148473d60d2d7e2ed399a";
    };
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
    name = "django-otp-0.3.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/64/21/df35037c8fd7c2803fa916a834c44dd3e1d9197ceba1458da18c5bce9d1a/django-otp-0.3.7.tar.gz";
      sha256 = "c75e689c8b5fc2341efcd38fe309e4f1373ca6dc0b5a2382cb90cb3b40d16fd9";
    };
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
    name = "django-recaptcha-1.1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7e/6a/a4681c19d3bb900e1bf9939b90c91771d9909be6ab1597c9467c1af74a87/django-recaptcha-1.1.0.tar.gz";
      sha256 = "10718e6e372f13a16432674f4ffb443c8b4aee2bdb71c1871dcb08dff1520c32";
    };
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



  "django-redis" = python.mkDerivation {
    name = "django-redis-4.6.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/90/0f/77adda9899565222aa4824153d88b1391e6876dfc74e2ed9389688d10206/django-redis-4.6.0.tar.gz";
      sha256 = "7b64c8f1efaf426226e9055385ed9e783f1289f2b72a9f6efcc1f602ec6a6dbb";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."redis"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Full featured redis cache backend for Django.";
    };
  };



  "django-scrypt" = python.mkDerivation {
    name = "django-scrypt-0.2.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/fc/e3/3056ac30ebbfa8a36dfedfbb47bdbb641e00bc2cb15a2dd0049e7b732ee5/django-scrypt-0.2.3.tar.gz";
      sha256 = "e81a35ae85c21544a2f1541317ff78f525632553be916d6d3711f4ee88ee1966";
    };
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
    name = "django-treebeard-4.0.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c5/a2/0df0c2e11113a68d3ff6438e497382ad738aa2664e32aabe044a0266a0f8/django-treebeard-4.0.1.tar.gz";
      sha256 = "ead415f32fb8b67c7f9a5b924aaad95e71b1d0d883b150df89707b8fc0e88a92";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Django"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Efficient tree implementations for Django 1.7+";
    };
  };



  "djangorestframework" = python.mkDerivation {
    name = "djangorestframework-3.5.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/91/48/ac0abccf578b61d17267981786698525174412103adb1291d5768c11121e/djangorestframework-3.5.3.tar.gz";
      sha256 = "7c04e2a45e6d30df7042749b9a029882c449eb2fee038f3cc14dfbc93581bfbf";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Web APIs for Django, made easy.";
    };
  };



  "docutils" = python.mkDerivation {
    name = "docutils-0.12";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/37/38/ceda70135b9144d84884ae2fc5886c6baac4edea39550f28bcd144c1234d/docutils-0.12.tar.gz";
      sha256 = "c7db717810ab6965f66c8cf0398a98c9d8df982da39b4cd7f162911eb89596fa";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.publicDomain;
      description = "Docutils -- Python Documentation Utilities";
    };
  };



  "enum34" = python.mkDerivation {
    name = "enum34-1.1.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876/enum34-1.1.6.tar.gz";
      sha256 = "8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Python 3.4 Enum backported to 3.3, 3.2, 3.1, 2.7, 2.6, 2.5, and 2.4";
    };
  };



  "gnupg" = python.mkDerivation {
    name = "gnupg-2.0.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/3d/91/0d1181069007854eb46eaa595be1d8c195e6213cff4750cbc1b79cf8c071/gnupg-2.0.2.tar.gz";
      sha256 = "67fa884d7700914ef623721c38c38fbbd9659825b65bcc81884a1772f12713df";
    };
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
    name = "idna-2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/fb/84/8c27516fbaa8147acd2e431086b473c453c428e24e8fb99a1d89ce381851/idna-2.1.tar.gz";
      sha256 = "ed36f281aebf3cd0797f163bb165d84c31507cedd15928b095b1675e2d04c676";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Internationalized Domain Names in Applications (IDNA)";
    };
  };



  "ipaddress" = python.mkDerivation {
    name = "ipaddress-1.0.17";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/bb/26/3b64955ff73f9e3155079b9ed31812afdfa5333b5c76387454d651ef593a/ipaddress-1.0.17.tar.gz";
      sha256 = "3a21c5a15f433710aaa26f1ae174b615973a25182006ae7f9c26de151cd51716";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.psfl;
      description = "IPv4/IPv6 manipulation library";
    };
  };



  "jsonfield" = python.mkDerivation {
    name = "jsonfield-1.0.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ad/e2/e1d8a62edb0aa3c9984ed5cb73d9001065520796f1740caf6daf1c5540c4/jsonfield-1.0.3.tar.gz";
      sha256 = "7e7f73a675c518712badd783279e26d164140f3fc2ed7a32102c3d08a6a2a4a7";
    };
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
    name = "kombu-4.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/95/fc/596472db8daa607efd599bb10cadd0bba0934fe1334ab1084201eeb38311/kombu-4.0.0.tar.gz";
      sha256 = "fb855eccbe83d3b97d44ac3f5bb809f97b73938017e383953baf3cb60dbb1ea9";
    };
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
    name = "libsass-0.11.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/4a/82/25fb0c35c64571e0a616ac5ceb28129217fb2d5b0f2439b505ca30ce72dc/libsass-0.11.2.tar.gz";
      sha256 = "2c20a64dba8d09d435f17ac6f61ca428420ef15535eb23932fa14090273c3764";
    };
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



  "lockfile" = python.mkDerivation {
    name = "lockfile-0.12.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/17/47/72cb04a58a35ec495f96984dddb48232b551aafb95bde614605b754fe6f7/lockfile-0.12.2.tar.gz";
      sha256 = "6aed02de03cba24efabcd600b30540140634fc06cfa603822d508d5361e9f799";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Platform-independent file locking module";
    };
  };



  "ndg-httpsclient" = python.mkDerivation {
    name = "ndg-httpsclient-0.4.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a2/a7/ad1c1c48e35dc7545dab1a9c5513f49d5fa3b5015627200d2be27576c2a0/ndg_httpsclient-0.4.2.tar.gz";
      sha256 = "580987ef194334c50389e0d7de885fccf15605c13c6eecaabd8d6c43768eb8ac";
    };
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
    name = "oauthlib-1.0.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/db/73/2a73deac557e3d2489e4aa14d606e20d6a445cd24a1f8661a6b1d26b41c6/oauthlib-1.0.3.tar.gz";
      sha256 = "ef4bfe4663ca3b97a995860c0173b967ebd98033d02f38c9e1b2cbb6c191d9ad";
    };
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



  "pbr" = python.mkDerivation {
    name = "pbr-1.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c3/2c/63275fab26a0fd8cadafca71a3623e4d0f0ee8ed7124a5bb128853d178a7/pbr-1.10.0.tar.gz";
      sha256 = "186428c270309e6fdfe2d5ab0949ab21ae5f7dea831eab96701b86bd666af39c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: OSI Approved :: Apache Software License";
      description = "Python Build Reasonableness";
    };
  };



  "psutil" = python.mkDerivation {
    name = "psutil-5.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/93/7f/347309562d30c688299727e65f4d76ef34180c406dfb6f2c7b6c8d746e13/psutil-5.0.0.zip";
      sha256 = "5411e22c63168220f4b8cc42fd05ea96f5b5e65e08b93b675ca50653aea482f8";
    };
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
    name = "psycopg2-2.6.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7b/a8/dc2d50a6f37c157459cd18bab381c8e6134b9381b50fbe969997b2ae7dbc/psycopg2-2.6.2.tar.gz";
      sha256 = "70490e12ed9c5c818ecd85d185d363335cc8a8cbf7212e3c185431c79ff8c05c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.lgpl2;
      description = "psycopg2 - Python-PostgreSQL Database Adapter";
    };
  };



  "py-bcrypt" = python.mkDerivation {
    name = "py-bcrypt-0.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/68/b1/1c3068c5c4d2e35c48b38dcc865301ebfdf45f54507086ac65ced1fd3b3d/py-bcrypt-0.4.tar.gz";
      sha256 = "5fa13bce551468350d66c4883694850570f3da28d6866bb638ba44fe5eabda78";
    };
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
    name = "pyOpenSSL-16.2.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/0c/d6/b1fe519846a21614fa4f8233361574eddb223e0bc36b182140d916acfb3b/pyOpenSSL-16.2.0.tar.gz";
      sha256 = "7779a3bbb74e79db234af6a08775568c6769b5821faecf6e2f4143edb227516e";
    };
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
    name = "pyasn1-0.1.9";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f7/83/377e3dd2e95f9020dbd0dfd3c47aaa7deebe3c68d3857a4e51917146ae8b/pyasn1-0.1.9.tar.gz";
      sha256 = "853cacd96d1f701ddd67aa03ecc05f51890135b7262e922710112f12a2ed2a7f";
    };
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
    name = "pycparser-2.17";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/be/64/1bb257ffb17d01f4a38d7ce686809a736837ad4371bcc5c42ba7a715c3ac/pycparser-2.17.tar.gz";
      sha256 = "0aac31e917c24cb3357f5a4d5566f2cc91a19ca41862f6c3c22dc60a629673b6";
    };
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
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/4a/04/396ec24e806fd3af7ea5d0f3cb6c7bbd4d00f7064712e4dd48f24c02ca95/pyjade-4.0.0.tar.gz";
      sha256 = "8d95b741de09c4942259fc3d1ad7b4f48166e69cef6f11c172e4b2c458b1ccd7";
    };
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



  "python-daemon" = python.mkDerivation {
    name = "python-daemon-2.1.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ae/e4/82870b5e01d761a04597fa332e4aaf285acfa1e675350fda55c6686f16ef/python-daemon-2.1.1.tar.gz";
      sha256 = "58a8c187ee37c3a28913bef00f83240c9ecd4a59dce09a24d92f5c941606689f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."docutils"
      self."lockfile"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: OSI Approved :: Apache Software License";
      description = "Library to implement a well-behaved Unix daemon process.";
    };
  };



  "python-editor" = python.mkDerivation {
    name = "python-editor-1.0.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/2b/c0/df7b87d5cf016f82eab3b05cd35f53287c1178ad8c42bfb6fa61b89b22f6/python-editor-1.0.1.tar.gz";
      sha256 = "8672e9a44a7957741453dd35e842299f6c29f0a88dc9e4316b0fa5935abb9186";
    };
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
    name = "pytz-2016.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/53/35/6376f58fb82ce69e2c113ca0ebe5c0f69b20f006e184bcc238a6007f4bdb/pytz-2016.7.tar.bz2";
      sha256 = "6eab31709e3a4aea748457707da45e805b650cbb352583805d2417de2a1dd71e";
    };
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
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/68/44/5efe9e98ad83ef5b742ce62a15bea609ed5a0d1caf35b79257ddb324031a/redis-2.10.5.tar.gz";
      sha256 = "5dfbae6acfc54edf0a7a415b99e0b21c0a3c27a7f787b292eea727b1facc5533";
    };
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
    name = "requests-2.12.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6e/40/7434b2d9fe24107ada25ec90a1fc646e97f346130a2c51aa6a2b1aba28de/requests-2.12.1.tar.gz";
      sha256 = "2109ecea94df90980be040490ff1d879971b024861539abb00054062388b612e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."cryptography"
      self."idna"
      self."pyOpenSSL"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Python HTTP for Humans.";
    };
  };



  "scrypt" = python.mkDerivation {
    name = "scrypt-0.8.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/af/82/44b030646b9de44ba5a5c7e87b0419a4d44318ba18468f5292b9c16737ac/scrypt-0.8.0.tar.gz";
      sha256 = "d4a5a4f53450b8ef629bbf1ee4be6105c69936e49b3d8bc621ac2287f0c86020";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Bindings for the scrypt key derivation function library";
    };
  };



  "six" = python.mkDerivation {
    name = "six-1.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz";
      sha256 = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a";
    };
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
    name = "sqlparse-0.2.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/55/ce/3944e990b03f80f36f0050b407ad46cde192a210d473f0d705b554bddd1d/sqlparse-0.2.2.tar.gz";
      sha256 = "d446296b2c26f9466860dd85fa32480bec523ab96bda8879262c38e8e8fbba21";
    };
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
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6f/a4/691ab63b17505a26096608cc309960b5a6bdf39e4ba1a793d5f9b1a53270/unicodecsv-0.14.1.tar.gz";
      sha256 = "018c08037d48649a0412063ff4eda26eaa81eff1546dbffa51fa5293276ff7fc";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Python2's stdlib csv module is nice, but it doesn't support unicode. This module is a drop-in replacement which *does*.";
    };
  };



  "vine" = python.mkDerivation {
    name = "vine-1.1.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/35/21/308904b027636f13c3970ed7caf2c53fca77fa160122ae3ac392d9eb6307/vine-1.1.3.tar.gz";
      sha256 = "87b95da19249373430a8fafca36f1aecb7aa0f1cc78545877857afc46aea2441";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Promises, promises, promises.";
    };
  };

}