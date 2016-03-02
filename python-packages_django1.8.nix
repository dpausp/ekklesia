{
  Mako = super.buildPythonPackage {
    name = "Mako-1.0.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [MarkupSafe];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/M/Mako/Mako-1.0.3.tar.gz";
      md5 = "a78f20f6366a8a0659ce5532f8614e53";
    };
  };
  MarkupSafe = super.buildPythonPackage {
    name = "MarkupSafe-0.23";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/M/MarkupSafe/MarkupSafe-0.23.tar.gz";
      md5 = "f5ab3deee4c37cd6a922fb81e730da6e";
    };
  };
  Pillow = super.buildPythonPackage {
    name = "Pillow-3.1.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/P/Pillow/Pillow-3.1.1.tar.gz";
      md5 = "d382a86c4b9b1c8de684bd00dad43bb8";
    };
  };
  PyYAML = super.buildPythonPackage {
    name = "PyYAML-3.11";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/P/PyYAML/PyYAML-3.11.tar.gz";
      md5 = "f50e08ef0fe55178479d3a618efe21db";
    };
  };
  WebOb = super.buildPythonPackage {
    name = "WebOb-1.5.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/W/WebOb/WebOb-1.5.1.tar.gz";
      md5 = "b4c121048b154e33630ce1bf09a49b41";
    };
  };
  alembic = super.buildPythonPackage {
    name = "alembic-0.8.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [sqlalchemy Mako python-editor];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/a/alembic/alembic-0.8.4.tar.gz";
      md5 = "5f95d8ee62b443f9b37eb5bee76c582d";
    };
  };
  amqp = super.buildPythonPackage {
    name = "amqp-1.4.9";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/a/amqp/amqp-1.4.9.tar.gz";
      md5 = "df57dde763ba2dea25b3fa92dfe43c19";
    };
  };
  anyjson = super.buildPythonPackage {
    name = "anyjson-0.3.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/a/anyjson/anyjson-0.3.3.tar.gz";
      md5 = "2ea28d6ec311aeeebaf993cb3008b27c";
    };
  };
  apipkg = super.buildPythonPackage {
    name = "apipkg-1.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/a/apipkg/apipkg-1.4.tar.gz";
      md5 = "17e5668601a2322aff41548cb957e7c8";
    };
  };
  beautifulsoup4 = super.buildPythonPackage {
    name = "beautifulsoup4-4.4.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/b/beautifulsoup4/beautifulsoup4-4.4.1.tar.gz";
      md5 = "8fbd9a7cac0704645fa20d1419036815";
    };
  };
  billiard = super.buildPythonPackage {
    name = "billiard-3.3.0.22";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/b/billiard/billiard-3.3.0.22.tar.gz";
      md5 = "6dd458a042924daa220417fa701f0979";
    };
  };
  celery = super.buildPythonPackage {
    name = "celery-3.1.20";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pytz billiard kombu];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/c/celery/celery-3.1.20.tar.gz";
      md5 = "025128230881de934461f1f2702ef721";
    };
  };
  cffi = super.buildPythonPackage {
    name = "cffi-1.5.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pycparser];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/c/cffi/cffi-1.5.2.tar.gz";
      md5 = "fa766133f7299464c8bf857e0c966a82";
    };
  };
  configobj = super.buildPythonPackage {
    name = "configobj-5.0.6";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/c/configobj/configobj-5.0.6.tar.gz";
      md5 = "e472a3a1c2a67bb0ec9b5d54c13a47d6";
    };
  };
  coverage = super.buildPythonPackage {
    name = "coverage-4.0.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/c/coverage/coverage-4.0.3.tar.gz";
      md5 = "c7d3db1882484022c81bf619be7b6365";
    };
  };
  cryptography = super.buildPythonPackage {
    name = "cryptography-1.2.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [idna pyasn1 six setuptools enum34 ipaddress cffi];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/c/cryptography/cryptography-1.2.2.tar.gz";
      md5 = "2b25eebd1d3c6bae52b46f0dcec74dfb";
    };
  };
  django = super.buildPythonPackage {
    name = "django-1.8.10";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/D/Django/Django-1.8.10.tar.gz";
      md5 = "8be1858dfee4878768ce686165e29c89";
    };
  };
  django-admin-bootstrapped = super.buildPythonPackage {
    name = "django-admin-bootstrapped-2.5.7";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [setuptools django];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-admin-bootstrapped/django-admin-bootstrapped-2.5.7.tar.gz";
      md5 = "50025cc096f4b5c49d3eb4009682614b";
    };
  };
  django-braces = super.buildPythonPackage {
    name = "django-braces-1.8.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-braces/django-braces-1.8.1.tar.gz";
      md5 = "a7f4a46071325d5edf4011fd31154b4d";
    };
  };
  django-configurations = super.buildPythonPackage {
    name = "django-configurations-1.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-configurations/django-configurations-1.0.tar.gz";
      md5 = "c2cf12442a8e36e6846a9e49255287bb";
    };
  };
  django-cors-headers = super.buildPythonPackage {
    name = "django-cors-headers-1.1.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-cors-headers/django-cors-headers-1.1.0.tar.gz";
      md5 = "204728fda96f9951ebfd8c2cabb54dfb";
    };
  };
  django-countries = super.buildPythonPackage {
    name = "django-countries-3.4.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-countries/django-countries-3.4.1.tar.gz";
      md5 = "ac9063777e4a988b3b932a273a033d37";
    };
  };
  django-crispy-forms = super.buildPythonPackage {
    name = "django-crispy-forms-1.6.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-crispy-forms/django-crispy-forms-1.6.0.tar.gz";
      md5 = "cf9537e0d2e5150644f45ea966b106dc";
    };
  };
  django-debug-toolbar = super.buildPythonPackage {
    name = "django-debug-toolbar-1.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [django sqlparse];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-debug-toolbar/django-debug-toolbar-1.4.tar.gz";
      md5 = "8c9402e11032a76e316fb8e6efe01196";
    };
  };
  django-extensions = super.buildPythonPackage {
    name = "django-extensions-1.6.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-extensions/django-extensions-1.6.1.tar.gz";
      md5 = "bcd7662eb69a5cf726b927e61ee8013e";
    };
  };
  django-oauth-toolkit = super.buildPythonPackage {
    name = "django-oauth-toolkit-0.10.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [django django-braces oauthlib six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-oauth-toolkit/django-oauth-toolkit-0.10.0.tar.gz";
      md5 = "b9f177804bb98f218f670edf72ecfea3";
    };
  };
  django-otp = super.buildPythonPackage {
    name = "django-otp-0.3.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [django];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-otp/django-otp-0.3.4.tar.gz";
      md5 = "1751add9363c0968c996bf6d8bda65f6";
    };
  };
  django-recaptcha = super.buildPythonPackage {
    name = "django-recaptcha-1.0.5";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [django];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-recaptcha/django-recaptcha-1.0.5.tar.gz";
      md5 = "0314e33ebeda3405c2e22139954b3da4";
    };
  };
  django-redis = super.buildPythonPackage {
    name = "django-redis-4.3.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [redis];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-redis/django-redis-4.3.0.tar.gz";
      md5 = "271fc8f34da4bc1ca1257b2574207aec";
    };
  };
  django-rest-swagger = super.buildPythonPackage {
    name = "django-rest-swagger-0.3.5";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [django djangorestframework PyYAML];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-rest-swagger/django-rest-swagger-0.3.5.tar.gz";
      md5 = "dc889f3c52d8f31acf7d16398aa0c1d1";
    };
  };
  django-scrypt = super.buildPythonPackage {
    name = "django-scrypt-0.2.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-scrypt/django-scrypt-0.2.3.tar.gz";
      md5 = "2c62d25c0cb322665cc06b7c4ff6fc72";
    };
  };
  django-treebeard = super.buildPythonPackage {
    name = "django-treebeard-4.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [django];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-treebeard/django-treebeard-4.0.tar.gz";
      md5 = "d5a4b3b30fda8e742900b277c4fdef6b";
    };
  };
  djangorestframework = super.buildPythonPackage {
    name = "djangorestframework-3.3.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/djangorestframework/djangorestframework-3.3.2.tar.gz";
      md5 = "f45b14a65e95b85216018bd009341683";
    };
  };
  docutils = super.buildPythonPackage {
    name = "docutils-0.12";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/docutils/docutils-0.12.tar.gz";
      md5 = "4622263b62c5c771c03502afa3157768";
    };
  };
  enum34 = super.buildPythonPackage {
    name = "enum34-1.1.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/e/enum34/enum34-1.1.2.tar.gz";
      md5 = "025bb71b3f9d2fad15d0ee53e48dc873";
    };
  };
  execnet = super.buildPythonPackage {
    name = "execnet-1.4.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [apipkg];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/e/execnet/execnet-1.4.1.tar.gz";
      md5 = "0ff84b6c79d0dafb7e2971629c4d127a";
    };
  };
  gnupg = super.buildPythonPackage {
    name = "gnupg-2.0.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [psutil];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/g/gnupg/gnupg-2.0.2.tar.gz";
      md5 = "7ca1d438430428aac7bea1491b1c237e";
    };
  };
  idna = super.buildPythonPackage {
    name = "idna-2.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/i/idna/idna-2.0.tar.gz";
      md5 = "bd17a9d15e755375f48a62c13b25b801";
    };
  };
  ipaddress = super.buildPythonPackage {
    name = "ipaddress-1.0.16";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/i/ipaddress/ipaddress-1.0.16.tar.gz";
      md5 = "1e27b62aa20f5b6fc200b2bdbf0d0847";
    };
  };
  jsonfield = super.buildPythonPackage {
    name = "jsonfield-1.0.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [django];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/j/jsonfield/jsonfield-1.0.3.tar.gz";
      md5 = "a7c7df31627069a97c9ba91b599c0845";
    };
  };
  kombu = super.buildPythonPackage {
    name = "kombu-3.0.33";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [anyjson amqp];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/k/kombu/kombu-3.0.33.tar.gz";
      md5 = "75eaaaa57fd5f1cd304e285e20867f5f";
    };
  };
  kryptomime = super.buildPythonPackage {
    name = "kryptomime-0.5.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [gnupg six subprocess32 gnupg six subprocess32 gnupg six subprocess32];
    src = fetchurl {
      url = "https://github.com/ttanner/kryptomime/archive/master.zip";
      None = "None";
    };
  };
  libsass = super.buildPythonPackage {
    name = "libsass-0.10.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/l/libsass/libsass-0.10.1.tar.gz";
      md5 = "de8ebe9aabf121db31034515aa2cfe4a";
    };
  };
  lockfile = super.buildPythonPackage {
    name = "lockfile-0.12.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/l/lockfile/lockfile-0.12.2.tar.gz";
      md5 = "a6a1a82957a23afdf44cfdd039b65ff9";
    };
  };
  markdown = super.buildPythonPackage {
    name = "markdown-2.6.5";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/M/Markdown/Markdown-2.6.5.tar.gz";
      md5 = "4fdb39248c9919e32ab68f5e5a9fa9f2";
    };
  };
  ndg-httpsclient = super.buildPythonPackage {
    name = "ndg-httpsclient-0.4.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pyopenssl];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/n/ndg-httpsclient/ndg_httpsclient-0.4.0.tar.gz";
      md5 = "81972c0267d5a47d678211ac854838f5";
    };
  };
  oauthlib = super.buildPythonPackage {
    name = "oauthlib-1.0.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/o/oauthlib/oauthlib-1.0.3.tar.gz";
      md5 = "02772867bf246b3b37f4ed22786c41f5";
    };
  };
  pbr = super.buildPythonPackage {
    name = "pbr-1.8.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pbr/pbr-1.8.1.tar.gz";
      md5 = "c8f9285e1a4ca6f9654c529b158baa3a";
    };
  };
  psutil = super.buildPythonPackage {
    name = "psutil-4.0.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/psutil/psutil-4.0.0.tar.gz";
      md5 = "6f327b7cc813ad6d4584be54ac89bae8";
    };
  };
  psycopg2 = super.buildPythonPackage {
    name = "psycopg2-2.6.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/psycopg2/psycopg2-2.6.1.tar.gz";
      md5 = "842b44f8c95517ed5b792081a2370da1";
    };
  };
  py = super.buildPythonPackage {
    name = "py-1.4.31";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/py/py-1.4.31.tar.gz";
      md5 = "5d2c63c56dc3f2115ec35c066ecd582b";
    };
  };
  py-bcrypt = super.buildPythonPackage {
    name = "py-bcrypt-0.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/py-bcrypt/py-bcrypt-0.4.tar.gz";
      md5 = "dd8b367d6b716a2ea2e72392525f4e36";
    };
  };
  pyasn1 = super.buildPythonPackage {
    name = "pyasn1-0.1.9";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pyasn1/pyasn1-0.1.9.tar.gz";
      md5 = "f00a02a631d4016818659d1cc38d229a";
    };
  };
  pycparser = super.buildPythonPackage {
    name = "pycparser-2.14";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pycparser/pycparser-2.14.tar.gz";
      md5 = "a2bc8d28c923b4fe2b2c3b4b51a4f935";
    };
  };
  pyjade = super.buildPythonPackage {
    name = "pyjade-4.0.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pyjade/pyjade-4.0.0.tar.gz";
      md5 = "c25c8433c0aed7d0e47de4e3f9bc8026";
    };
  };
  pyopenssl = super.buildPythonPackage {
    name = "pyopenssl-0.15.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [cryptography six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-0.15.1.tar.gz";
      md5 = "f447644afcbd5f0a1f47350fec63a4c6";
    };
  };
  pytest = super.buildPythonPackage {
    name = "pytest-2.8.7";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [py];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pytest/pytest-2.8.7.tar.gz";
      md5 = "685e2137062c9821b1b74a4814795514";
    };
  };
  pytest-cache = super.buildPythonPackage {
    name = "pytest-cache-1.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pytest execnet];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pytest-cache/pytest-cache-1.0.tar.gz";
      md5 = "e51ff62fec70a1fd456d975ce47977cd";
    };
  };
  pytest-django = super.buildPythonPackage {
    name = "pytest-django-2.9.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pytest];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pytest-django/pytest-django-2.9.1.tar.gz";
      md5 = "3c9dde85e99ec409df209a62b4715e1a";
    };
  };
  pytest-pythonpath = super.buildPythonPackage {
    name = "pytest-pythonpath-0.7";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pytest];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pytest-pythonpath/pytest-pythonpath-0.7.tar.gz";
      md5 = "967f9a43872e9ecca39e5895d0f56155";
    };
  };
  python-daemon = super.buildPythonPackage {
    name = "python-daemon-2.1.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [setuptools docutils lockfile];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/python-daemon/python-daemon-2.1.1.tar.gz";
      md5 = "72e2acf2c3d69c7fa75a6625d06adfd0";
    };
  };
  python-editor = super.buildPythonPackage {
    name = "python-editor-0.5";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/python-editor/python-editor-0.5.tar.gz";
      md5 = "ece4f1848d93286d58df88e3fcb37704";
    };
  };
  pytz = super.buildPythonPackage {
    name = "pytz-2015.7";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pytz/pytz-2015.7.tar.bz2";
      md5 = "ad650c0ce9150d3b53d29d686c09fdda";
    };
  };
  redis = super.buildPythonPackage {
    name = "redis-2.10.5";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/r/redis/redis-2.10.5.tar.gz";
      md5 = "3b26c2b9703b4b56b30a1ad508e31083";
    };
  };
  requests = super.buildPythonPackage {
    name = "requests-2.9.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/r/requests/requests-2.9.1.tar.gz";
      md5 = "0b7f480d19012ec52bab78292efd976d";
    };
  };
  scrypt = super.buildPythonPackage {
    name = "scrypt-0.7.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/s/scrypt/scrypt-0.7.1.tar.gz";
      md5 = "9feb713f183e11caa940e8ec71cf1361";
    };
  };
  setuptools = super.buildPythonPackage {
    name = "setuptools-20.2.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/s/setuptools/setuptools-20.2.2.tar.gz";
      md5 = "bf37191cb4c1472fb61e6f933d2006b1";
    };
  };
  six = super.buildPythonPackage {
    name = "six-1.10.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/s/six/six-1.10.0.tar.gz";
      md5 = "34eed507548117b2ab523ab14b2f8b55";
    };
  };
  sqlalchemy = super.buildPythonPackage {
    name = "sqlalchemy-1.0.12";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/S/SQLAlchemy/SQLAlchemy-1.0.12.tar.gz";
      md5 = "6d19ef29883bbebdcac6613cf391cac4";
    };
  };
  sqlparse = super.buildPythonPackage {
    name = "sqlparse-0.1.18";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/s/sqlparse/sqlparse-0.1.18.tar.gz";
      md5 = "777942cb613ebbaedadda81dc7fcdb9b";
    };
  };
  subprocess32 = super.buildPythonPackage {
    name = "subprocess32-3.2.7";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/s/subprocess32/subprocess32-3.2.7.tar.gz";
      md5 = "824c801e479d3e916879aae3e9c15e16";
    };
  };
  unicodecsv = super.buildPythonPackage {
    name = "unicodecsv-0.14.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/u/unicodecsv/unicodecsv-0.14.1.tar.gz";
      md5 = "c18ffe8ded29a4f429224877b2b34252";
    };
  };
  uwsgi = super.buildPythonPackage {
    name = "uwsgi-2.0.12";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/u/uWSGI/uwsgi-2.0.12.tar.gz";
      md5 = "1451cab954bad0d7d7429e4d2c84b5df";
    };
  };
  waitress = super.buildPythonPackage {
    name = "waitress-0.8.10";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/w/waitress/waitress-0.8.10.tar.gz";
      md5 = "a957f79c1b56224660a5b68c8ef29c8b";
    };
  };
  webtest = super.buildPythonPackage {
    name = "webtest-2.0.20";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six WebOb waitress beautifulsoup4];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/W/WebTest/WebTest-2.0.20.tar.gz";
      md5 = "fa2a8a1df774ca1b5be2f027c552f338";
    };
  };

### Test requirements

  
}
