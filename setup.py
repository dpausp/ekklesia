#!/usr/bin/env python
import os
from setuptools import setup, find_packages

README = open(os.path.join(os.path.dirname(__file__), 'README.rst')).read()

# allow setup.py to be run from any path
os.chdir(os.path.normpath(os.path.join(os.path.abspath(__file__), os.pardir)))

setup(
    name='ekklesia',
    author='Thomas T.',
    author_email='ekklesia@heterarchy.net',
    url='',
    version='0.1',
    py_modules=["manage"],
    package_dir={"": "./identity"},
    packages=find_packages(where="./identity"),
    include_package_data=True,
    license='AGPLv3',
    description='A framework for direct democracy in large organisations',
    long_description=README,
    classifiers=[
    'Development Status :: 4 - Beta Development Status',
        'Environment :: Web Environment',
        'Framework :: Django',
        'Intended Audience :: Other Audience',
    'License :: OSI Approved :: GNU Affero General Public License v3 or later (AGPLv3+)',
    'License :: Free for non-commercial use',
        'Operating System :: OS Independent',
        'Programming Language :: Python',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3.4',
        'Programming Language :: Python :: 3.5',
        'Topic :: Internet :: WWW/HTTP',
        'Topic :: Internet :: WWW/HTTP :: Dynamic Content',
    ],
    entry_points = {
        'console_scripts': [
            'members = ekklesia.backends.members:main_func',
            'invitations = ekklesia.backends.invitations:main_func',
            'joint = ekklesia.backends.joint:main_func',
            'ekklesia-manage.py = manage:main_func',
        ],
    }

)
