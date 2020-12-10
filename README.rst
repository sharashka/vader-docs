Vader Developers' Guide
***********************

Sphinx assets
==============

::

	_build/
	build/
	source/
	Makefile

Install and run
===============

::

    $ python -m venv .venv
    $ source .venv/bin/activate
    $ pip install -r requirements.txt

Then you can use `pipm
<https://github.com/jnoortheen/pipm>`__ instead of pip,
to manage your `requirements` files easier.

Build the Guide::

    $ make html

Open the Guide::

    $ google-chrome-stable build/html/index.html

Start Live Preview (with `dev-requirements.txt` installed)::

    $ sphinx-reload .
