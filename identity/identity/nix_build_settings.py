# -*- coding: utf-8 -*-
# Django settings for Ekklesia project.

"""
This file is public domain.
"""

from __future__ import absolute_import
from .defaults import defaults


def common(production=False, admin=False, site=0):
    class Common(defaults(production, admin, site)):
        # XXX: this looks very stupid, but collectstatic fails without this fake setting...
        DATABASES = {
            'default': {}
        }

        STATICFILES_STORAGE = 'django.contrib.staticfiles.storage.ManifestStaticFilesStorage'

    return Common


class Build(common(production=True, admin=False, site=0)):
    pass

