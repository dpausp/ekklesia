# generated using pypi2nix tool (version: 1.5.0.dev0)
#
# COMMAND:
#   pypi2nix -v -V 2.7 -E openssl postgresql libffi -r requirements/django1.8-pypi2nix.txt
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

  "Django" = python.mkDerivation {
    name = "Django-1.8.14";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/4f/a5/0fb863c3b83f8a15b50731d02d835cb15fef93193c7cbbaacbb2b6adf1e0/Django-1.8.14.tar.gz";
      sha256 = "5282c48b90fbb29507299f592215378e849a2808f485e4144626e66715d5464d";
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
    name = "Mako-1.0.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7a/ae/925434246ee90b42e8ef57d3b30a0ab7caf9a2de3e449b876c56dcb48155/Mako-1.0.4.tar.gz";
      sha256 = "fed99dbe4d0ddb27a33ee4910d8708aca9ef1fe854e668387a9ab9a90cbf9059";
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
    name = "Markdown-2.6.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/9b/53/4492f2888408a2462fd7f364028b6c708f3ecaa52a028587d7dd729f40b4/Markdown-2.6.6.tar.gz";
      sha256 = "9a292bb40d6d29abac8024887bcfc1159d7a32dc1d6f1f6e8d6d8e293666c504";
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
    name = "SQLAlchemy-1.0.15";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/18/7d/f230ac50198cfe3cdc957c3572a18dc92600047ce707b5b923c56ab92c1b/SQLAlchemy-1.0.15.tar.gz";
      sha256 = "586f5ccf068211795a89ed22d196c5cc3006b6be00261bcac6f584c0b8e0845a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
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
    name = "amqp-1.4.9";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/cc/a4/f265c6f9a7eb1dd45d36d9ab775520e07ff575b11ad21156f9866da047b2/amqp-1.4.9.tar.gz";
      sha256 = "2dea4d16d073c902c3b89d9b96620fb6729ac0f7a923bbc777cb4ad827c0c61a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.lgpl2;
      description = "Low-level AMQP client for Python (fork of amqplib)";
    };
  };



  "anyjson" = python.mkDerivation {
    name = "anyjson-0.3.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c3/4d/d4089e1a3dd25b46bebdb55a992b0797cff657b4477bc32ce28038fdecbc/anyjson-0.3.3.tar.gz";
      sha256 = "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Wraps the best available JSON implementation available in a common interface";
    };
  };



  "billiard" = python.mkDerivation {
    name = "billiard-3.3.0.23";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/64/a6/d7b6fb7bd0a4680a41f1d4b27061c7b768c673070ba8ac116f865de4e7ca/billiard-3.3.0.23.tar.gz";
      sha256 = "692a2a5a55ee39a42bcb7557930e2541da85df9ea81c6e24827f63b80cd39d0b";
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
    name = "celery-3.1.23";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ea/a6/6da0bac3ea8abbc2763fd2664af2955702f97f140f2d7277069445532b7c/celery-3.1.23.tar.gz";
      sha256 = "1a359c815837f9dbf193a7dbc6addafa34612c077ff70c66e3b16e14eebd2418";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
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
      description = "Distributed Task Queue";
    };
  };



  "cffi" = python.mkDerivation {
    name = "cffi-1.8.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b8/21/9d6f08d2d36a0a8c84623646b4ed5a07023d868823361a086b021fb21172/cffi-1.8.2.tar.gz";
      sha256 = "2b636db1a179439d73ae0a090479e179a43df5d4eddc7e4c4067f960d4038530";
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
    name = "cryptography-1.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6e/96/b8dab146e8be98061dae07e127f80cffa3061ab0e8da0d3d42f3308c6e91/cryptography-1.5.tar.gz";
      sha256 = "52f47ec9a57676043f88e3ca133638790b6b71e56e8890d9d7f3ae4fcd75fa24";
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
    name = "django-braces-1.9.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/20/1e/a7d16b92bf794d7df38bc2db52f3268780193618aeaeb68e8ea0dc55552c/django-braces-1.9.0.tar.gz";
      sha256 = "cb53d91d3d9906f2ee7ec3430d3937c4149c38fc388ba9947ec9a942a3d21101";
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
    name = "django-cors-headers-1.1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/63/fb/6ae2d0079e9c9076486f6e166fb59aadadea2c09ed6cbd911beafede2627/django-cors-headers-1.1.0.tar.gz";
      sha256 = "fcd96e2be47c8eef34c650e007a6d546e19e7ee61041b89edbbbbe7619aa3987";
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
    name = "django-crispy-forms-1.6.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/fd/68/2c9f7670f7b6f1b139642255e1e33d88e8f689e4c215f94eec00d38b05a2/django-crispy-forms-1.6.0.tar.gz";
      sha256 = "67fbb7194bd9887d663161405c623f5f5cd3f9ee627515c4de7a50e16fa44ed1";
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
    name = "django-debug-toolbar-1.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/5b/15/c4977b27aae721fc02a0efdfcc76f6927643705abd0e10ef93d91db0f5d2/django-debug-toolbar-1.5.tar.gz";
      sha256 = "1dbb0f07a7ccd94d1df376dec95e7dc6a85219f86eecf8d59c15a5829dd4026f";
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
    name = "django-otp-0.3.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/76/d1/3c336519da599f08a5b1c8c7af31f812a381bbb5280880ca6a90bec77aab/django-otp-0.3.6.tar.gz";
      sha256 = "20e44fb66dbbe9dcea65140fe62d081bb17348341267e222539a31819c5b7f64";
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
    name = "django-recaptcha-1.0.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/81/26/e4e3a922f07a66ec78ab179691aa8f470a17c72f958678840546c0d3800a/django-recaptcha-1.0.5.tar.gz";
      sha256 = "dc370fa0f7bd77378f8be5f03e88906bf0b62b8478b35af05846f7d640f1ec32";
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
    name = "django-redis-4.4.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/8a/c8/fb0bc58d27e38c6c719ab0f58ffd218fb54a39896d499b616498be09fad8/django-redis-4.4.4.tar.gz";
      sha256 = "76166b32062d57ae1a5ecc0afc15799b54094559712c8ddf47f28e79b5e6d04a";
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
    name = "djangorestframework-3.4.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/18/f6/80444cfe71c3cfb4361b73a1e9d921cede3f9da92f96f98d0f8cd1490f73/djangorestframework-3.4.6.tar.gz";
      sha256 = "9100c49071470dad56c760f439366c203724b2c94242b82e75748750536d8a48";
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
    name = "kombu-3.0.35";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/5f/4f/3859b52f6d465d0d4a767516c924ee4f0e1387498ac8d0c30d9942da3762/kombu-3.0.35.tar.gz";
      sha256 = "22ab336a17962717a5d9470547e5508d4bcf1b6ec10cd9486868daf4e5edb727";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."amqp"
      self."anyjson"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Messaging library for Python";
    };
  };



  "libsass" = python.mkDerivation {
    name = "libsass-0.11.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/96/33/bfab3318660778694d843af625459e3ec8e26f12a7494d6ff9ea4162091d/libsass-0.11.1.tar.gz";
      sha256 = "f060d7dab825942ca7f86d0c4adadf7d731a2e30f9bce6e4f010ad7d32adbf06";
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



  "psutil" = python.mkDerivation {
    name = "psutil-4.3.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/78/cc/f267a1371f229bf16db6a4e604428c3b032b823b83155bd33cef45e49a53/psutil-4.3.1.tar.gz";
      sha256 = "38f74182fb9e15cafd0cdf0821098a95cc17301807aed25634a18b66537ba51b";
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
    name = "pyOpenSSL-16.1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/15/1e/79c75db50e57350a7cefb70b110255757e9abd380a50ebdc0cfd853b7450/pyOpenSSL-16.1.0.tar.gz";
      sha256 = "88f7ada2a71daf2c78a4f139b19d57551b4c8be01f53a1cb5c86c2f3bf01355f";
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
    name = "pycparser-2.14";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6d/31/666614af3db0acf377876d48688c5d334b6e493b96d21aa7d332169bee50/pycparser-2.14.tar.gz";
      sha256 = "7959b4a74abdc27b312fed1c21e6caf9309ce0b29ea86b591fd2e99ecdf27f73";
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
    name = "pytz-2016.6.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f7/c7/08e54702c74baf9d8f92d0bc331ecabf6d66a56f6d36370f0a672fc6a535/pytz-2016.6.1.tar.bz2";
      sha256 = "b5aff44126cf828537581e534cc94299b223b945a2bb3b5434d37bf8c7f3a10c";
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
    name = "requests-2.11.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/2e/ad/e627446492cc374c284e82381215dcd9a0a87c4f6e90e9789afefe6da0ad/requests-2.11.1.tar.gz";
      sha256 = "5acf980358283faba0b897c73959cecf8b841205bb4b2ad3ef545f46eae1a133";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."ndg-httpsclient"
      self."pyOpenSSL"
      self."pyasn1"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Python HTTP for Humans.";
    };
  };



  "scrypt" = python.mkDerivation {
    name = "scrypt-0.7.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f6/fa/2e80258d58555d38ba0373db3c8947e03ceaaa91ad9f80725802bc05aa77/scrypt-0.7.1.tar.gz";
      sha256 = "f5f68c300c816178384b6531f071a07e705beb1ecd9b37ba8fe3960c20f61da3";
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
    name = "sqlparse-0.2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c3/c4/6159720e7a100cd419bac31a202898e291e5af29e4ada09ee58f7eeaa076/sqlparse-0.2.1.tar.gz";
      sha256 = "1c98a2bdffe67f1bb817b72a7ba4d38be592e0f07c5acea4adebcec12c4377d1";
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

}