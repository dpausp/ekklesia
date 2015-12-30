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
    name = "Pillow-3.0.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/P/Pillow/Pillow-3.0.0.tar.gz";
      md5 = "fc8ac44e93da09678eac7e30c9b7377d";
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
    name = "amqp-1.4.8";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/a/amqp/amqp-1.4.8.tar.gz";
      md5 = "13ca20ef5c1cea8c2841b9d1f91f7163";
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
    name = "celery-3.1.19";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pytz billiard kombu];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/c/celery/celery-3.1.19.tar.gz";
      md5 = "fba8c4b269814dc6dbc36abb0e66c384";
    };
  };
  cffi = super.buildPythonPackage {
    name = "cffi-1.4.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pycparser];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/c/cffi/cffi-1.4.1.tar.gz";
      md5 = "73c2047f598ac7d8b7a5cd8e6d835c42";
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
  cryptography = super.buildPythonPackage {
    name = "cryptography-1.1.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [idna pyasn1 six setuptools enum34 ipaddress cffi];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/c/cryptography/cryptography-1.1.2.tar.gz";
      md5 = "15eeba9e31f852bac21155baa3dfbc61";
    };
  };
  django = super.buildPythonPackage {
    name = "django-1.7.11";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/D/Django/Django-1.7.11.tar.gz";
      md5 = "030b2f9c99a6e4e0418eadf7dba9e235";
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
    name = "django-configurations-0.8";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-configurations/django-configurations-0.8.tar.gz";
      md5 = "3ca3c5a0d78307ff304ecce3234c2822";
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
    name = "django-crispy-forms-1.5.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-crispy-forms/django-crispy-forms-1.5.2.tar.gz";
      md5 = "4e5e0f6a9ddef530417891ee4c495562";
    };
  };
  django-endless-pagination = super.buildPythonPackage {
    name = "django-endless-pagination-2.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-endless-pagination/django-endless-pagination-2.0.tar.gz";
      md5 = "8efa40cee51ebe229ce15ed258594ba0";
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
    name = "django-otp-0.3.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [django];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-otp/django-otp-0.3.3.tar.gz";
      md5 = "b8ae9ef536b384539a990118bd8e627e";
    };
  };
  django-recaptcha = super.buildPythonPackage {
    name = "django-recaptcha-1.0.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-recaptcha/django-recaptcha-1.0.4.tar.gz";
      md5 = "65c7c8d62688fb569525ef380f0008c8";
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
    name = "django-treebeard-3.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [django];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/django-treebeard/django-treebeard-3.0.tar.gz";
      md5 = "3fcc74669c1735c6ab1081c3416e419c";
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
    name = "enum34-1.1.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/e/enum34/enum34-1.1.1.tar.gz";
      md5 = "5edaf22a14ec2769fc973a0443bf02d5";
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
    name = "ipaddress-1.0.15";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/i/ipaddress/ipaddress-1.0.15.tar.gz";
      md5 = "12915e923b738107e47827478d553ba1";
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
    name = "kombu-3.0.32";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [anyjson amqp];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/k/kombu/kombu-3.0.32.tar.gz";
      md5 = "8819aa97abb09f5b27f29e35b8ecaeaf";
    };
  };
  kryptomime = super.buildPythonPackage {
    name = "kryptomime-0.5.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [gnupg six subprocess32 gnupg six subprocess32];
    src = fetchurl {
      url = "https://github.com/ttanner/kryptomime/archive/master.zip";
      None = "None";
    };
  };
  libsass = super.buildPythonPackage {
    name = "libsass-0.10.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/l/libsass/libsass-0.10.0.tar.gz";
      md5 = "8b32bc88312e791a01ab1ea6515c3fa0";
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
  psutil = super.buildPythonPackage {
    name = "psutil-3.3.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/psutil/psutil-3.3.0.tar.gz";
      md5 = "0625db01ea46417308db94cc59362b65";
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
    name = "pyjade-3.1.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pyjade/pyjade-3.1.0.tar.gz";
      md5 = "e6a38f7c5c4f6fdee15800592a85eb1d";
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
  python-daemon = super.buildPythonPackage {
    name = "python-daemon-2.1.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [setuptools docutils lockfile];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/python-daemon/python-daemon-2.1.0.tar.gz";
      md5 = "f474f94eccc544968a36430f88a70c15";
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
  requests = super.buildPythonPackage {
    name = "requests-2.9.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/r/requests/requests-2.9.0.tar.gz";
      md5 = "2f46fdceaf4f63e5e3665a8cb50d284f";
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
    name = "setuptools-19.1.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/s/setuptools/setuptools-19.1.1.tar.gz";
      md5 = "792297b8918afa9faf826cb5ec4a447a";
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
    name = "sqlalchemy-1.0.10";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/S/SQLAlchemy/SQLAlchemy-1.0.10.tar.gz";
      md5 = "84f01631cc4813a0298bf68ce27d9c5d";
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
    name = "uwsgi-2.0.11.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/u/uWSGI/uwsgi-2.0.11.2.tar.gz";
      md5 = "1f02dcbee7f6f61de4b1fd68350cf16f";
    };
  };

### Test requirements

  
}
