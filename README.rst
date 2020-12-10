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

	$ poetry install
	$ poetry shell
	...
	$ poetry exit

Run commands inside the poetry shell (virtual environment):

Build the Guide::

    $ make html

Open the Guide::

    $ google-chrome-stable build/html/index.html

Start Live Preview::

    $ sphinx-reload .

Alternatively, without entering the poetry shell::

    $ poetry run make html

etc.