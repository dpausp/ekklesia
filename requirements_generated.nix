{ pkgs, python }:

self: {
  "alembic" = python.mkDerivation {
    name = "alembic-0.8.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/d2/c3/fdb752aa39832d056aeac958f35f1fb9fb9397a52bdab9248adcbd9f17d9/alembic-0.8.6.tar.gz";
      md5 = "6517b160e576cedf9b7625a18a9bc594";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."Mako" self."SQLAlchemy" self."python-editor" ];
    meta = {
      homepage = "";
      license = "MIT";
      description = "A database migration tool for SQLAlchemy.";
    };
  };
  "amqp" = python.mkDerivation {
    name = "amqp-1.4.9";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/cc/a4/f265c6f9a7eb1dd45d36d9ab775520e07ff575b11ad21156f9866da047b2/amqp-1.4.9.tar.gz";
      md5 = "df57dde763ba2dea25b3fa92dfe43c19";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "LGPL";
      description = "Low-level AMQP client for Python (fork of amqplib)";
    };
  };
  "anyjson" = python.mkDerivation {
    name = "anyjson-0.3.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c3/4d/d4089e1a3dd25b46bebdb55a992b0797cff657b4477bc32ce28038fdecbc/anyjson-0.3.3.tar.gz";
      md5 = "2ea28d6ec311aeeebaf993cb3008b27c";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Wraps the best available JSON implementation available in a common interface";
    };
  };
  "billiard" = python.mkDerivation {
    name = "billiard-3.3.0.23";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/64/a6/d7b6fb7bd0a4680a41f1d4b27061c7b768c673070ba8ac116f865de4e7ca/billiard-3.3.0.23.tar.gz";
      md5 = "6ee416e1e7c8d8164ce29d7377cca6a4";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Python multiprocessing fork with improvements and bugfixes";
    };
  };
  "celery" = python.mkDerivation {
    name = "celery-3.1.23";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ea/a6/6da0bac3ea8abbc2763fd2664af2955702f97f140f2d7277069445532b7c/celery-3.1.23.tar.gz";
      md5 = "c6f10f956a49424d553ab1391ab39ab2";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."redis" self."kombu" self."SQLAlchemy" self."pytz" self."pyOpenSSL" self."billiard" ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Distributed Task Queue";
    };
  };
  "configobj" = python.mkDerivation {
    name = "configobj-5.0.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/64/61/079eb60459c44929e684fa7d9e2fdca403f67d64dd9dbac27296be2e0fab/configobj-5.0.6.tar.gz";
      md5 = "e472a3a1c2a67bb0ec9b5d54c13a47d6";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."six" ];
    meta = {
      homepage = "";
      license = "";
      description = "Config file reading, writing and validation.";
    };
  };
  "django-admin-bootstrapped" = python.mkDerivation {
    name = "django-admin-bootstrapped-2.5.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/e6/5f/4e29ecbd19fadf76dcc8360aa3dd588d19622df584b965771e63c05f4082/django-admin-bootstrapped-2.5.7.tar.gz";
      md5 = "50025cc096f4b5c49d3eb4009682614b";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."Django" ];
    meta = {
      homepage = "";
      license = "BSD License";
      description = "A Bootstrap theme for Django Admin";
    };
  };
  "django-agpl" = python.mkDerivation {
    name = "django-agpl-3.0.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/db/6f/41f557689667f0fc2ea7e2d98f4f134fb591a66c3bd05174ab7bf2c0bc9d/django-agpl-3.0.2.tar.gz";
      md5 = "11442dbb2fb6bad549cadf1647a78b02";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."Django" ];
    meta = {
      homepage = "";
      license = "";
      description = "Django application to assist GNU AGPL compliance";
    };
  };
  "django-braces" = python.mkDerivation {
    name = "django-braces-1.9.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/20/1e/a7d16b92bf794d7df38bc2db52f3268780193618aeaeb68e8ea0dc55552c/django-braces-1.9.0.tar.gz";
      md5 = "2fd94c6a870b5293a7dd3a0e16e76957";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Reusable, generic mixins for Django";
    };
  };
  "django-configurations" = python.mkDerivation {
    name = "django-configurations-1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/39/dc/5bcdd836d1bbca302453b80a4cb0a242776f60bcbaa0b184b86d59464db9/django-configurations-1.0.tar.gz";
      md5 = "c2cf12442a8e36e6846a9e49255287bb";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "A helper for organizing Django settings.";
    };
  };
  "django-cors-headers" = python.mkDerivation {
    name = "django-cors-headers-1.1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/63/fb/6ae2d0079e9c9076486f6e166fb59aadadea2c09ed6cbd911beafede2627/django-cors-headers-1.1.0.tar.gz";
      md5 = "204728fda96f9951ebfd8c2cabb54dfb";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "MIT License";
      description = "django-cors-headers is a Django application for handling the server headers required for Cross-Origin Resource Sharing (CORS).";
    };
  };
  "django-countries" = python.mkDerivation {
    name = "django-countries-3.4.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/60/a6/7a82c369d75491466a9121b469d4d11c6c42f99a3f0b99220193dba8d216/django-countries-3.4.1.tar.gz";
      md5 = "ac9063777e4a988b3b932a273a033d37";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "";
      description = "Provides a country field for Django models.";
    };
  };
  "django-crispy-forms" = python.mkDerivation {
    name = "django-crispy-forms-1.6.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/fd/68/2c9f7670f7b6f1b139642255e1e33d88e8f689e4c215f94eec00d38b05a2/django-crispy-forms-1.6.0.tar.gz";
      md5 = "cf9537e0d2e5150644f45ea966b106dc";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "MIT";
      description = "Best way to have Django DRY forms";
    };
  };
  "django-debug-toolbar" = python.mkDerivation {
    name = "django-debug-toolbar-1.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/eb/08/501be174c3edbddf0e276b96971d2399c3b4d9c57df28189358e6668c7ad/django-debug-toolbar-1.4.tar.gz";
      md5 = "8c9402e11032a76e316fb8e6efe01196";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."sqlparse" self."Django" ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "A configurable set of panels that display various debug information about the current request/response.";
    };
  };
  "django-extensions" = python.mkDerivation {
    name = "django-extensions-1.6.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7f/da/1245fe47d1a2ca8d2d03b3cdbc886e64c94a8c2d3b6f99e3464d507a7c29/django-extensions-1.6.7.tar.gz";
      md5 = "62dd2a173ad29f319b84f1b89571c060";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."six" ];
    meta = {
      homepage = "";
      license = "MIT License";
      description = "Extensions for Django";
    };
  };
  "django-oauth-toolkit" = python.mkDerivation {
    name = "django-oauth-toolkit-0.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/cf/08/e718784a49f74d6861260c08b54d9b197244d9cb2a51f8693a4f6c0635dd/django-oauth-toolkit-0.10.0.tar.gz";
      md5 = "b9f177804bb98f218f670edf72ecfea3";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."oauthlib" self."django-braces" self."six" self."Django" ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "OAuth2 goodies for Django";
    };
  };
  "django-otp" = python.mkDerivation {
    name = "django-otp-0.3.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7d/00/2140001329d3000e3421f0a7cc4a14bcf26d480bbc2bde469a91530f38ef/django-otp-0.3.5.tar.gz";
      md5 = "f115483093c3dc95328f08ea6cf4bab9";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."Django" ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "A pluggable framework for adding two-factor authentication to Django using one-time passwords.";
    };
  };
  "django-recaptcha" = python.mkDerivation {
    name = "django-recaptcha-1.0.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/81/26/e4e3a922f07a66ec78ab179691aa8f470a17c72f958678840546c0d3800a/django-recaptcha-1.0.5.tar.gz";
      md5 = "0314e33ebeda3405c2e22139954b3da4";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."Django" ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Django recaptcha form field/widget app.";
    };
  };
  "django-redis" = python.mkDerivation {
    name = "django-redis-4.4.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/3b/95/9ba8822a59390298153c810355837bc291572f6ae564e689c5fbc06b98d1/django-redis-4.4.3.tar.gz";
      md5 = "cf4a56ffec55e88424a785e32688346b";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."redis" ];
    meta = {
      homepage = "";
      license = "";
      description = "Full featured redis cache backend for Django.";
    };
  };
  "djangorestframework" = python.mkDerivation {
    name = "djangorestframework-3.3.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/23/9c/94812ea7a7bd95af5439ab95795c03b6757a0cad30e751320f80799c8038/djangorestframework-3.3.3.tar.gz";
      md5 = "6f5ee9646e7fa87dad4385d3c7e7678d";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Web APIs for Django, made easy.";
    };
  };
  "django-scrypt" = python.mkDerivation {
    name = "django-scrypt-0.2.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/fc/e3/3056ac30ebbfa8a36dfedfbb47bdbb641e00bc2cb15a2dd0049e7b732ee5/django-scrypt-0.2.3.tar.gz";
      md5 = "2c62d25c0cb322665cc06b7c4ff6fc72";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "";
      description = "A Scrypt-enabled password hasher for Django 1.4/1.5";
    };
  };
  "django-treebeard" = python.mkDerivation {
    name = "django-treebeard-4.0.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c5/a2/0df0c2e11113a68d3ff6438e497382ad738aa2664e32aabe044a0266a0f8/django-treebeard-4.0.1.tar.gz";
      md5 = "a96c72c186d7aea7142fe5673b96b3be";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."Django" ];
    meta = {
      homepage = "";
      license = "Apache License 2.0";
      description = "Efficient tree implementations for Django 1.7+";
    };
  };
  "docutils" = python.mkDerivation {
    name = "docutils-0.12";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/37/38/ceda70135b9144d84884ae2fc5886c6baac4edea39550f28bcd144c1234d/docutils-0.12.tar.gz";
      md5 = "4622263b62c5c771c03502afa3157768";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "public domain, Python, 2-Clause BSD, GPL 3 (see COPYING.txt)";
      description = "Docutils -- Python Documentation Utilities";
    };
  };
  "enum34" = python.mkDerivation {
    name = "enum34-1.1.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876/enum34-1.1.6.tar.gz";
      md5 = "5f13a0841a61f7fc295c514490d120d0";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "BSD License";
      description = "Python 3.4 Enum backported to 3.3, 3.2, 3.1, 2.7, 2.6, 2.5, and 2.4";
    };
  };
  "gnupg" = python.mkDerivation {
    name = "gnupg-2.0.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/3d/91/0d1181069007854eb46eaa595be1d8c195e6213cff4750cbc1b79cf8c071/gnupg-2.0.2.tar.gz";
      md5 = "7ca1d438430428aac7bea1491b1c237e";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."psutil" ];
    meta = {
      homepage = "";
      license = "GPLv3+";
      description = "A Python wrapper for GnuPG";
    };
  };
  "idna" = python.mkDerivation {
    name = "idna-2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/fb/84/8c27516fbaa8147acd2e431086b473c453c428e24e8fb99a1d89ce381851/idna-2.1.tar.gz";
      md5 = "f6473caa9c5e0cc1ad3fd5d04c3c114b";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "BSD-like";
      description = "Internationalized Domain Names in Applications (IDNA)";
    };
  };
  "ipaddress" = python.mkDerivation {
    name = "ipaddress-1.0.16";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/cd/c5/bd44885274379121507870d4abfe7ba908326cf7bfd50a48d9d6ae091c0d/ipaddress-1.0.16.tar.gz";
      md5 = "1e27b62aa20f5b6fc200b2bdbf0d0847";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "Python Software Foundation License";
      description = "IPv4/IPv6 manipulation library";
    };
  };
  "jsonfield" = python.mkDerivation {
    name = "jsonfield-1.0.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ad/e2/e1d8a62edb0aa3c9984ed5cb73d9001065520796f1740caf6daf1c5540c4/jsonfield-1.0.3.tar.gz";
      md5 = "a7c7df31627069a97c9ba91b599c0845";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."Django" ];
    meta = {
      homepage = "";
      license = "MIT";
      description = "A reusable Django field that allows you to store validated JSON in your model.";
    };
  };
  "kombu" = python.mkDerivation {
    name = "kombu-3.0.35";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/5f/4f/3859b52f6d465d0d4a767516c924ee4f0e1387498ac8d0c30d9942da3762/kombu-3.0.35.tar.gz";
      md5 = "6483ac8ba7109ec606f5cb9bd084b6ef";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."anyjson" self."amqp" ];
    meta = {
      homepage = "";
      license = "";
      description = "Messaging library for Python";
    };
  };
  "kryptomime" = python.mkDerivation {
    name = "kryptomime-0.5.0";
    doCheck = false;
    propagatedBuildInputs = [ self."subprocess32" self."six" self."gnupg" ];
    meta = {
      homepage = "";
      license = "";
      description = "";
    };
  };
  "lockfile" = python.mkDerivation {
    name = "lockfile-0.12.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/17/47/72cb04a58a35ec495f96984dddb48232b551aafb95bde614605b754fe6f7/lockfile-0.12.2.tar.gz";
      md5 = "a6a1a82957a23afdf44cfdd039b65ff9";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "";
      description = "Platform-independent file locking module";
    };
  };
  "Mako" = python.mkDerivation {
    name = "Mako-1.0.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7a/ae/925434246ee90b42e8ef57d3b30a0ab7caf9a2de3e449b876c56dcb48155/Mako-1.0.4.tar.gz";
      md5 = "c5fc31a323dd4990683d2f2da02d4e20";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."MarkupSafe" ];
    meta = {
      homepage = "";
      license = "MIT";
      description = "A super-fast templating language that borrows the  best ideas from the existing templating languages.";
    };
  };
  "Markdown" = python.mkDerivation {
    name = "Markdown-2.6.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/14/eb/ae35c7d154eb9395c49950788e738effd0e2e8293544e8ee7558a369d7e8/Markdown-2.6.6.zip";
      md5 = "7e1642f1210fab26f7861ec09cf7fa0d";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "BSD License";
      description = "Python implementation of Markdown.";
    };
  };
  "MarkupSafe" = python.mkDerivation {
    name = "MarkupSafe-0.23";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c0/41/bae1254e0396c0cc8cf1751cb7d9afc90a602353695af5952530482c963f/MarkupSafe-0.23.tar.gz";
      md5 = "f5ab3deee4c37cd6a922fb81e730da6e";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Implements a XML/HTML/XHTML Markup safe string for Python";
    };
  };
  "ndg-httpsclient" = python.mkDerivation {
    name = "ndg-httpsclient-0.4.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/08/92/6318c6c71566778782065736d73c62e621a7a190f9bb472a23857d97f823/ndg_httpsclient-0.4.1.tar.gz";
      md5 = "133255e6ef9cf694b5620b1bf73a99f7";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."pyOpenSSL" self."pyasn1" ];
    meta = {
      homepage = "";
      license = "BSD - See ndg/httpsclient/LICENCE file for details";
      description = "Provides enhanced HTTPS support for httplib and urllib2 using PyOpenSSL";
    };
  };
  "oauthlib" = python.mkDerivation {
    name = "oauthlib-1.0.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/db/73/2a73deac557e3d2489e4aa14d606e20d6a445cd24a1f8661a6b1d26b41c6/oauthlib-1.0.3.tar.gz";
      md5 = "02772867bf246b3b37f4ed22786c41f5";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."cryptography" ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "A generic, spec-compliant, thorough implementation of the OAuth request-signing logic";
    };
  };
  "pbr" = python.mkDerivation {
    name = "pbr-1.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c3/2c/63275fab26a0fd8cadafca71a3623e4d0f0ee8ed7124a5bb128853d178a7/pbr-1.10.0.tar.gz";
      md5 = "8e4968c587268f030e38329feb9c8f17";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "";
      description = "Python Build Reasonableness";
    };
  };
  "psutil" = python.mkDerivation {
    name = "psutil-4.3.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/22/a8/6ab3f0b3b74a36104785808ec874d24203c6a511ffd2732dd215cf32d689/psutil-4.3.0.tar.gz";
      md5 = "ca97cf5f09c07b075a12a68b9d44a67d";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "psutil is a cross-platform library for retrieving information onrunning processes and system utilization (CPU, memory, disks, network)in Python.";
    };
  };
  "psycopg2" = python.mkDerivation {
    name = "psycopg2-2.6.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/86/fd/cc8315be63a41fe000cce20482a917e874cdc1151e62cb0141f5e55f711e/psycopg2-2.6.1.tar.gz";
      md5 = "842b44f8c95517ed5b792081a2370da1";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "LGPL with exceptions or ZPL";
      description = "psycopg2 - Python-PostgreSQL Database Adapter";
    };
  };
  "pyasn1" = python.mkDerivation {
    name = "pyasn1-0.1.9";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f7/83/377e3dd2e95f9020dbd0dfd3c47aaa7deebe3c68d3857a4e51917146ae8b/pyasn1-0.1.9.tar.gz";
      md5 = "f00a02a631d4016818659d1cc38d229a";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "ASN.1 types and codecs";
    };
  };
  "py-bcrypt" = python.mkDerivation {
    name = "py-bcrypt-0.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/68/b1/1c3068c5c4d2e35c48b38dcc865301ebfdf45f54507086ac65ced1fd3b3d/py-bcrypt-0.4.tar.gz";
      md5 = "dd8b367d6b716a2ea2e72392525f4e36";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "bcrypt password hashing and key derivation";
    };
  };
  "pycparser" = python.mkDerivation {
    name = "pycparser-2.14";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6d/31/666614af3db0acf377876d48688c5d334b6e493b96d21aa7d332169bee50/pycparser-2.14.tar.gz";
      md5 = "a2bc8d28c923b4fe2b2c3b4b51a4f935";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "C parser in Python";
    };
  };
  "pyjade" = python.mkDerivation {
    name = "pyjade-4.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/4a/04/396ec24e806fd3af7ea5d0f3cb6c7bbd4d00f7064712e4dd48f24c02ca95/pyjade-4.0.0.tar.gz";
      md5 = "c25c8433c0aed7d0e47de4e3f9bc8026";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."six" ];
    meta = {
      homepage = "";
      license = "MIT";
      description = "Jade syntax template adapter for Django, Jinja2, Mako and Tornado templates";
    };
  };
  "pyOpenSSL" = python.mkDerivation {
    name = "pyOpenSSL-16.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/77/f2/bccec75ca4280a9fa762a90a1b8b152a22eac5d9c726d7da1fcbfe0a20e6/pyOpenSSL-16.0.0.tar.gz";
      md5 = "9587d813dcf656e9f2760e41a3682dc3";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."six" self."cryptography" ];
    meta = {
      homepage = "";
      license = "Apache License, Version 2.0";
      description = "Python wrapper module around the OpenSSL library";
    };
  };
  "python-daemon" = python.mkDerivation {
    name = "python-daemon-2.1.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ae/e4/82870b5e01d761a04597fa332e4aaf285acfa1e675350fda55c6686f16ef/python-daemon-2.1.1.tar.gz";
      md5 = "72e2acf2c3d69c7fa75a6625d06adfd0";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."docutils" self."lockfile" ];
    meta = {
      homepage = "";
      license = "Apache-2";
      description = "Library to implement a well-behaved Unix daemon process.";
    };
  };
  "python-editor" = python.mkDerivation {
    name = "python-editor-1.0.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/2b/c0/df7b87d5cf016f82eab3b05cd35f53287c1178ad8c42bfb6fa61b89b22f6/python-editor-1.0.1.tar.gz";
      md5 = "e1fa63535b40e022fa4fd646fd8b511a";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "Apache";
      description = "Programmatically open an editor, capture the result.";
    };
  };
  "pytz" = python.mkDerivation {
    name = "pytz-2016.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6c/4a/eb896a5629813b56f5a79cc6b7f5551598f27f1eea6c00c68b47541c1501/pytz-2016.4.zip";
      md5 = "eeb649e63d56fac3566a3fefaa35c7fa";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "MIT";
      description = "World timezone definitions, modern and historical";
    };
  };
  "redis" = python.mkDerivation {
    name = "redis-2.10.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/68/44/5efe9e98ad83ef5b742ce62a15bea609ed5a0d1caf35b79257ddb324031a/redis-2.10.5.tar.gz";
      md5 = "3b26c2b9703b4b56b30a1ad508e31083";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "MIT";
      description = "Python client for Redis key-value store";
    };
  };
  "requests" = python.mkDerivation {
    name = "requests-2.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/49/6f/183063f01aae1e025cf0130772b55848750a2f3a89bfa11b385b35d7329d/requests-2.10.0.tar.gz";
      md5 = "a36f7a64600f1bfec4d55ae021d232ae";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."pyOpenSSL" self."ndg-httpsclient" self."pyasn1" ];
    meta = {
      homepage = "";
      license = "Apache 2.0";
      description = "Python HTTP for Humans.";
    };
  };
  "six" = python.mkDerivation {
    name = "six-1.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz";
      md5 = "34eed507548117b2ab523ab14b2f8b55";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "MIT";
      description = "Python 2 and 3 compatibility utilities";
    };
  };
  "SQLAlchemy" = python.mkDerivation {
    name = "SQLAlchemy-1.0.13";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/1d/e2/3df2e0e8cd3cf7e6e2905f1a3d44f1ba51c4fceab0968cc0cb3dcefcb53a/SQLAlchemy-1.0.13.tar.gz";
      md5 = "cef0c4aa0e2464a6f903a9cac9b280d8";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "MIT License";
      description = "Database Abstraction Library";
    };
  };
  "sqlparse" = python.mkDerivation {
    name = "sqlparse-0.1.19";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/9c/cc/3d8d34cfd0507dd3c278575e42baff2316a92513de0a87ac0ec9f32806c9/sqlparse-0.1.19.tar.gz";
      md5 = "f200d8dea67b58bc15575bfa76e4e9dc";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Non-validating SQL parser";
    };
  };
  "subprocess32" = python.mkDerivation {
    name = "subprocess32-3.2.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b8/2f/49e53b0d0e94611a2dc624a1ad24d41b6d94d0f1b0a078443407ea2214c2/subprocess32-3.2.7.tar.gz";
      md5 = "824c801e479d3e916879aae3e9c15e16";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "PSF license";
      description = "A backport of the subprocess module from Python 3.2/3.3 for use on 2.x.";
    };
  };
  "unicodecsv" = python.mkDerivation {
    name = "unicodecsv-0.14.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6f/a4/691ab63b17505a26096608cc309960b5a6bdf39e4ba1a793d5f9b1a53270/unicodecsv-0.14.1.tar.gz";
      md5 = "c18ffe8ded29a4f429224877b2b34252";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "BSD License";
      description = "Python2's stdlib csv module is nice, but it doesn't support unicode. This module is a drop-in replacement which *does*.";
    };
  };
  "cffi" = python.mkDerivation {
    name = "cffi-1.6.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b6/98/11feff87072e2e640fb8320712b781eccdef05d588618915236b32289d5a/cffi-1.6.0.tar.gz";
      md5 = "2fae9160991afefb20ff0fbde3b14faf";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."pycparser" ];
    meta = {
      homepage = "";
      license = "MIT";
      description = "Foreign Function Interface for Python calling C code.";
    };
  };
  "cryptography" = python.mkDerivation {
    name = "cryptography-1.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a9/5b/a383b3a778609fe8177bd51307b5ebeee369b353550675353f46cb99c6f0/cryptography-1.4.tar.gz";
      md5 = "a9763e3831cc7cdb402c028fac1ceb39";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."ipaddress" self."enum34" self."pyasn1" self."six" self."cffi" self."idna" ];
    meta = {
      homepage = "";
      license = "BSD or Apache License, Version 2.0";
      description = "cryptography is a package which provides cryptographic recipes and primitives to Python developers.";
    };
  };
  "Django" = python.mkDerivation {
    name = "Django-1.8.13";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/85/0e/0200c2c3792a4fb8bda6a8597d267abaeb00d862e3a110f99cb101398d4d/Django-1.8.13.tar.gz";
      md5 = "a77e1ba9991f762de20bf03de57e39eb";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "A high-level Python Web framework that encourages rapid development and clean, pragmatic design.";
    };
  };
  "libsass" = python.mkDerivation {
    name = "libsass-0.11.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/96/33/bfab3318660778694d843af625459e3ec8e26f12a7494d6ff9ea4162091d/libsass-0.11.1.tar.gz";
      md5 = "e277d39d16ca0fcc0623e1ef7f5c0b05";
    };
    doCheck = false;
    propagatedBuildInputs = [ self."six" ];
    meta = {
      homepage = "";
      license = "MIT License";
      description = "SASS for Python: A straightforward binding of libsass for Python.";
    };
  };
  "scrypt" = python.mkDerivation {
    name = "scrypt-0.7.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f6/fa/2e80258d58555d38ba0373db3c8947e03ceaaa91ad9f80725802bc05aa77/scrypt-0.7.1.tar.gz";
      md5 = "9feb713f183e11caa940e8ec71cf1361";
    };
    doCheck = false;
    propagatedBuildInputs = [  ];
    meta = {
      homepage = "";
      license = "2-clause BSD";
      description = "Bindings for the scrypt key derivation function library";
    };
  };
}
