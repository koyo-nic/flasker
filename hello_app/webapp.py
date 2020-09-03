#!/usr/bin/env python
# -*-coding:utf-8 -*-

# Entry point for the application.
from . import app    # For application discovery by the 'flask' command.
from . import views  # For import side-effects of setting up routes.

# Set an environment variable for FLASK_APP. On Linux and macOS,
# use export set FLASK_APP=webapp; on Windows use set FLASK_APP=webapp