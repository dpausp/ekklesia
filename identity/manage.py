#!/usr/bin/env python
import os
import sys

def main_func():
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "identity.settings")
    os.environ.setdefault('DJANGO_CONFIGURATION', 'Development')

    #from django.core.management import execute_from_command_line
    from configurations.management import execute_from_command_line

    execute_from_command_line(sys.argv)


if __name__ == "__main__":
    main_func()

