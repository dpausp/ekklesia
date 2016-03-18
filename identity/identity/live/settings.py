# -*- coding: utf-8 -*-
# Django settings for Ekklesia project.

"""
This file is public domain.
"""

from __future__ import absolute_import
import os.path, logging, ssl
from ekklesia.mail import Template
from .defaults import defaults, all_verbs, site_root, top_root
from .defaults import Testing as DefaultTesting

def common(production=False,admin=False,site=0):
	class Common(defaults(production,admin,site)):
		ALLOWED_HOSTS = ['localhost','beoauth.piratenpartei-bayern.de','beoapi.piratenpartei-bayern.de']
		SECRET_KEY='f#+$5tr9_wagz3!l8$q-#5_$-z@4vc1$iq9igmt#kl885soebl'

		ADMINS = (
			('entropy', 'entropy@beoauth.piratenpartei-bayern.de'),
		)
		MANAGERS = ADMINS

		DEFAULT_FROM_EMAIL = 'beoauth@beoauth.piratenpartei-bayern.de'
		EMAIL_SUBJECT_PREFIX = '[beo] '

		EMAIL_HOST='localhost'
		EMAIL_HOST_USER='beo@beoauth.piratenpartei-bayern.de'
		EMAIL_HOST_PASSWORD='beo'
		EMAIL_USE_TLS=True

		EMAIL_GPG_IMPORT_HOME = None # home of id keyrings or tuple of keyrings file of id public/secret keys
		EMAIL_GPG_HOME = None # own home

		EMAIL_INDEP_CRYPTO = False # run independent crypto processing for incoming/outgoing mail

		EMAIL_DEFAULT_IMAP=dict(host='localhost',port=993,user=None,password=None,cram_md5=True,
			certfile='../../beomail.crt',keyfile='../../beomail.key',ca_certs='../../ca-certificates.crt')

		EMAIL_DEFAULT_SMTP=dict(host='localhost',port=587,user=None,password=None,
			certfile='../../beomail.crt',keyfile='../../beomail.key',ca_certs='../../ca-certificates.crt')

		EMAIL_TEMPLATES = {
			# name: (subject,body) string(=default Template) or Template
			'register_confirm': ('Registration',
		"""Please confirm your key either by clicking on {url}={code}
		or enter the following code at {url}: {code}
		Thank you"""),
			'single_vote_confirmation': ('Bestätigung deiner Stimmgabe',
		"""Hallo,
		du hast am {time} für {abstimmung} wie folgt abgestimmt:
		{options}
		Bitte bewahre diesen Nachweis sicher auf."""),
		}

		""" id: dict(
			email= None=id,
			name='',
			key=(keyid(None=email), passphrase),
			login=(user(None=email),passphrase), # optional default for IMAP/SMTP
			imap=dict(), # optional
			imapdir='', # optional
			smtp=dict(), # optional
			templates=[default templates] # optional
			)
		"""
		EMAIL_IDS = {
		    'idserver': {
		        'email':'beo@beoauth.piratenpartei-bayern.de',
		        'key':(None,'beo'),
		        'login':(None,'beo'),
		        #'imapfolder':'register',
		        },
		    'portal': {
		        'email':'beoportal@beoauth.piratenpartei-bayern.de',
		        'key':(None,'beoportal'),
		        'login':(None,'beoportal'),
		        },
		    'voting': {
		        'email':'beovoting@beoauth.piratenpartei-bayern.de',
		        'key':(None,'beovoting'),
		        'login':(None,'beovoting'),
		        },
		}
		"""
		    'idtest': {
		        'email':'beo@beoauth.piratenpartei-bayern.de',
		        'key':(None,'beotest'),
		        'login':(None,'beo'),
		        'imapfolder':'test',
		        },
		    'auth': {
		        'email':'beoauth@beoauth.piratenpartei-bayern.de',
		        'key':(None,'beotest'),
		        'login':(None,'beoauth'),
		        },
		    'register': {
		        'email':'beoregister@beoauth.piratenpartei-bayern.de',
		        'key':(None,'beotest'),
		        'login':(None,'beoregister'),
		        'templates':['register_confirm'],
		        },
		"""

		EMAIL_REGISTER_ID = 'register' # id of key registry

		EMAIL_CLIENTS = {
			# client_id: {id:(recieve,sending(False=no,True=all templates,None=default tmpl),attachments)
			'portal-local': {'idserver':(True,None,True),'voting':(True,True,True)},
			'debug': {'idserver':(True,True,True)},
		    'vvvote': {'voting':(True,True,False)},
		    'vvvote2': {'voting':(True,True,False)},
		    'votingModule': {'voting':(True,True,True)},
		}
		EMAIL_QUEUE='crypto'

		MAILHIDE_PUBLIC="01UA7MJxOpyRBqZpXj_ptUdA=="
		MAILHIDE_PRIVATE="7c15605116d6e23a97c7337647d79ca8"

		## ppbayern
		RECAPTCHA_PUBLIC_KEY="6Le4vvESAAAAALjMMuWTJX40FPA-HT41vQ_fPzih"
		RECAPTCHA_PRIVATE_KEY="6Le4vvESAAAAAMbPHm1TSKGh-Fc5oOSRA049ocJR"

		#localhost
		#RECAPTCHA_PUBLIC_KEY="6Le5vvESAAAAAL7JjCxVIi7E8lPAZJPj-H8bVeAC"
		#RECAPTCHA_PRIVATE_KEY="6Le5vvESAAAAAJPwuUnaFnZz6iBvYKxcdqzQG_Lt"

		# own gnupg key (id,passphrase) for signing and decryption
		API_GNUPG_KEY = ('beoauth@beoauth.piratenpartei-bayern.de','beoauth')
		# gnupg keys backend:(id,passphrase) for verfication and encryption
		API_BACKEND_KEYS = {
		'members':'beo@beoauth.piratenpartei-bayern.de',
		'invitations':'beo@beoauth.piratenpartei-bayern.de',
		}

		SSL_CERTS = {
		    open('../../localhost3.crt').read():'localhost3',
		    open('../../abstimmung.piratenpartei-nrw.de.pem').read():'vvvote',
		    open('../../wollnmer.net.pem').read():'wollnmer',
		    open('../../cmr.cx.pem').read():'cmrcx',
		    open('../../savvy.ch.crt').read():'savvy',
		    open('../../discourse.crt').read():'discourse',
		}

		SSL_BASIC_AUTH = {
			# realm. logins (SSL-Cert,user,password) username=None use realm
			'invitations': [('localhost3','invitations','invitations')],
			'members': [('localhost3','members','members')],
		}

		SSL_CLIENT_LOGIN = {
			# SSL-Cert: permitted client_ids
		    'localhost3':('portal','portal-local'),
		    'vvvote':('vvvote',),
		    'wollnmer':('votingModule',),
		    'cmrcx':('antragsverwaltung',),
		    'savvy':('pps_demo_portal',),
		    'discourse':('discourse','arguments'),
		}

		SHARE_CLIENTS = {
			# share name, {client_id: allowed VERBS}
		    'portal': {'portal-local':all_verbs,'vvvote':all_verbs,
			    'pps_demo_portal':all_verbs,'arguments':all_verbs,
			    'votingModule':all_verbs,'antragsverwaltung':all_verbs},
		    'voting': {'voting':all_verbs,'portal-local':['get']},
		}

		LISTS_CLIENTS = {
			# client_id: allowed VERBS
			'portal': all_verbs,
			'portal-local': all_verbs,
			'voting': all_verbs,
			'pps_demo_portal': all_verbs,
			'antragsverwaltung': all_verbs,
			'votingModule': all_verbs,
			'arguments': all_verbs,
		}

		SHARE_PUSH = {
			# share name, [push urls]
			#'portal': ['https://portal.local/pushshare/'],
		}

		BROKER_URL = 'pyamqp://beoauth:VWGqBiFL8x3jwt@localhost/beoauth'
		USE_CELERY=True
		_BROKER_USE_SSL={
			'ca_certs': '../../beoca.pem',
			'keyfile': '../../localhost3.key',
			'certfile': '../../localhost3.crt',
			'cert_reqs': ssl.CERT_REQUIRED,
			'ssl_version':ssl.PROTOCOL_TLSv1,
		}

		#logging.basicConfig(level = logging.DEBUG)
	return Common

PROD_DATABASE = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2', # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': 'beoauth',        # Or path to database file if using sqlite3.
        'USER': 'beoauth',                      # Not used with sqlite3.
        'PASSWORD': 'wBGK7sKRZRyE4Xky',                  # Not used with sqlite3.
        'HOST': '',                      # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '',                      # Set to empty string for default. Not used with sqlite3.
    }
}

# Production settings
class TestingX(common(production=True,admin=False)):
	#SSL_CLIENT_AUTH_DEBUG = 'local'
	DATABASES = PROD_DATABASE

class Other:
	PASSWORD_HASHERS = ('django.contrib.auth.hashers.MD5PasswordHasher',)
	SECURE_REQUIRED_PATHS = ()
	CACHES = {
		'default': {
			'BACKEND': 'django.core.cache.backends.dummy.DummyCache',
		}
	}
	SSL_CERTS = {
		'FAKE CERT\n':'fake',
	}

	SSL_CLIENT_LOGIN = {
		# SSL-Cert: permitted client_ids
		'fake':('portal','debug'),
	}

	SSL_BASIC_AUTH = {
		# realm. logins (SSL-Cert,user,password) username=None use realm
		'invitations': [('fake','invitations','invitations')],
		'members': [('fake','members','members')],
	}

	SHARE_CLIENTS = {
		# share name, {client_id: allowed VERBS}
		'test': {'portal':all_verbs,'debug':all_verbs,'voting':['get']},
		'portal': {'portal':all_verbs,'voting':['get']},
		'voting': {'voting':all_verbs,'portal':['get']},
	}

	LISTS_CLIENTS = {
		# client_id: allowed VERBS
		'portal':all_verbs,'debug':all_verbs,
	}

	SHARE_PUSH = {
		# share name, [push urls]
		'portal': ['https://localhost/pushshare/'],
	}

	EMAIL_IDS = {
		'portal': dict(
			email='foo@localhost',
			name='Portal',
			login=(None,'foo'),
			key=(None,'mysecret'),
			),
		'register': dict(
			email='fnord@localhost',
			login=('foo@localhost','foo'),
			templates=['register_confirm'],
			),
	}
	EMAIL_REGISTER_ID = 'portal' # id of key registry

	EMAIL_CLIENTS = {
		# client_id: {id:(recieve,sending(False=no,True=all templates,None=default tmpl),attachments)
		'portal': {'portal':(True,None,True)},
		'voting': {'voting':(True,True,True)},
		'debug': {'portal':(True,True,True)},
	}

	import tempfile
	EMAIL_GPG_HOME = tempfile.mkdtemp()

class Testing(DefaultTesting):
	DATABASES = PROD_DATABASE

class TestingFull(DefaultTesting):
	DATABASES = PROD_DATABASE

# Development settings
class Development(common(production=False,admin=True)):
	DATABASES = PROD_DATABASE
	pass

# Development API settings
class DevelopmentAPI(common(production=False,admin=False,site=2)):
	DATABASES = PROD_DATABASE
	pass

# Production settings
class Production(common(production=True,admin=True,site=1)):
	DATABASES = PROD_DATABASE
	#with file('/etc/ekklesia-secret') as key_file:
	#	SECRET_KEY = key_file.read()

# Production API settings
class ProductionAPI(common(production=True,admin=False,site=2)):
	DATABASES = PROD_DATABASE

#import logging
#logging.basicConfig(level = logging.DEBUG)
