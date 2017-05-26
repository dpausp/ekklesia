# -*- coding: utf-8 -*-
# Django settings for Ekklesia project.

"""
This file is public domain.
"""

from __future__ import absolute_import
from .defaults import defaults


class Build(defaults(production=True, admin=True, site=0)):
    # XXX: collectstatic fails without this fake setting...
    DATABASES = {
        'default': {}
    }

    STATICFILES_STORAGE = 'django.contrib.staticfiles.storage.ManifestStaticFilesStorage'
